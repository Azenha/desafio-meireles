# desafio-meireles

Desafio do Meireles

## Challenge

1) List how many different customers each company has, showing the name of the company and the total number of customers.
2) For each customer, list all orders, showing: Customer name, Order ID, product name, product price and quantity
3) for each customer, print on the screen: all companies from which they made purchases
4) For each company, print on the screen: company name, product name and total quantity sold of each product
5) Save in the client_history table all customers who made purchases with a total value greater than 1000 in the year 2024 (sum of all of them)
6) Read a CSV file containing a list of products. If a csv product does not exist in the database table, add it. If it exists, change the price field. Compare by product name.

## How to run

Create a new MySQL database using [`example-db.sql`](example-db.sql).

Update the [`.env`](.env.example) file.

Install the npm dependencies.

```
npm install
```

Run the npm script to start the server, it uses nodemon to watch for changes.

```
npm start
```

Update the [`products.csv`](products.csv) to test with new products or update existing ones.
