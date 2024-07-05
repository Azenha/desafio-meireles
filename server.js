const express = require('express');
const mysql = require('mysql2');
const csv = require('csv-parser');
const fs = require('fs');
const dotenv = require('dotenv');

// Load environment variables from .env file
dotenv.config();

const app = express();
const port = process.env.PORT || 3000;

const db = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_DATABASE
});

db.connect((err) => {
  if (err) {
    throw err;
  }
  console.log('MySQL connected...');
});

// Middleware to parse JSON requests
app.use(express.json());

// Task 1: Number of customers each company has

app.get('/company-customers', (req, res) => {
    const query = `
      SELECT c.name AS company_name, COUNT(DISTINCT o.id_client) AS customer_count
      FROM companies c
      LEFT JOIN orders o ON c.id_company = o.id_company
      GROUP BY c.id_company, c.name
      ORDER BY customer_count DESC
    `;
    db.query(query, (err, results) => {
      if (err) throw err;
      res.json(results);
    });
  });

// Task 2: Orders with product details for each customer

app.get('/customer-orders', (req, res) => {
    const query = `
      SELECT cl.name AS customer_name, o.id_order, p.name AS product_name, p.price, oi.quantity
      FROM orders o
      JOIN clients cl ON o.id_client = cl.id_client
      JOIN order_itens oi ON o.id_order = oi.id_order
      JOIN products p ON oi.id_product = p.id_product
    `;
    db.query(query, (err, results) => {
      if (err) throw err;
      res.json(results);
    });
  });

// Task 3: Companies from which each customer made purchases

app.get('/customer-companies', (req, res) => {
    const query = `
      SELECT cl.name AS customer_name, c.name AS company_name
      FROM orders o
      JOIN clients cl ON o.id_client = cl.id_client
      JOIN companies c ON o.id_company = c.id_company
    `;
    db.query(query, (err, results) => {
      if (err) throw err;
      res.json(results);
    });
  });

// Task 4: Company-wise product sales

app.get('/company-product-sales', (req, res) => {
    const query = `
      SELECT c.name AS company_name, p.name AS product_name, SUM(oi.quantity) AS total_quantity_sold
      FROM companies c
      JOIN orders o ON c.id_company = o.id_company
      JOIN order_itens oi ON o.id_order = oi.id_order
      JOIN products p ON oi.id_product = p.id_product
      GROUP BY c.id_company, p.id_product
    `;
    db.query(query, (err, results) => {
      if (err) throw err;
      res.json(results);
    });
  });

// Task 5: Save clients with high total purchases in 2024

app.post('/save-high-value-clients', (req, res) => {
    const query = `
      INSERT INTO client_history (id_client, date, total_amount)
      SELECT o.id_client, CURDATE(), SUM(p.price * oi.quantity) AS total_amount
      FROM orders o
      JOIN order_itens oi ON o.id_order = oi.id_order
      JOIN products p ON oi.id_product = p.id_product
      WHERE YEAR(o.date) = 2024
      GROUP BY o.id_client
      HAVING total_amount > 1000
    `;
    db.query(query, (err, results) => {
      if (err) throw err;
      res.send('High-value clients saved to history');
    });
  });

// Task 6: Read and update/add products from CSV file

app.post('/update-products-from-csv', (req, res) => {
    const filename = 'products.csv';
  
    fs.createReadStream(filename)
      .pipe(csv({ separator: ';' })) // Specify the semicolon as the separator
      .on('data', (row) => {
        const { name, price } = row;
        const selectQuery = `
          SELECT id_product FROM products WHERE name = ?
        `;
        db.query(selectQuery, [name], (err, results) => {
          if (err) {
            console.error(`Error checking product ${name} in database: ${err.message}`);
          } else {
            if (results.length > 0) {
              // Product exists, update the price
              const updateQuery = `
                UPDATE products SET price = ? WHERE name = ?
              `;
              db.query(updateQuery, [price, name], (err, updateResult) => {
                if (err) {
                  console.error(`Error updating price for product ${name}: ${err.message}`);
                } else {
                  console.log(`Product ${name} price updated to ${price}`);
                }
              });
            } else {
              // Product does not exist, insert new product
              const insertQuery = `
                INSERT INTO products (name, price) VALUES (?, ?)
              `;
              db.query(insertQuery, [name, price], (err, insertResult) => {
                if (err) {
                  console.error(`Error inserting product ${name}: ${err.message}`);
                } else {
                  console.log(`New product ${name} added with price ${price}`);
                }
              });
            }
          }
        });
      })
      .on('end', () => {
        console.log('CSV file successfully processed');
        res.send('Products updated/added from CSV');
      });
  });

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});