require("dotenv").config();
const keys = require("./keys.js");
const mysql = require("mysql");
const prompt = require('prompt');
const Table = require('cli-table');

const connection = mysql.createConnection({
    host: keys.dbConnect.dbHost,
    port: 3306,
    user: keys.dbConnect.dbUser,
    password: keys.dbConnect.dbPassword,
    database: keys.dbConnect.dbName
});

connection.connect(function (err) {
    if (err) console.log(err);
});

function displayProducts(callback) {
    const table = new Table({
        head: ['Product ID', 'Product Name', 'Department Name', 'Unit Price', 'Units Available'],
        colWidths: [15, 50, 20, 15, 20]
    });
    let query = "SELECT * FROM products ORDER BY id";
    connection.query(query, function (err, res) {
        if (!err) {
            for (let i = 0; i < res.length; i++) {
                table.push([res[i].id, res[i].product_name, res[i].department_name, '$ ' + res[i].price, res[i].stock_quantity]);
            }
        } else {
            console.log(err);
        }
        console.log(table.toString());
        callback();
    });
}

function getOrder() {
    prompt.start();
    prompt.get(['item', 'quantity'], function (err, result) {
        let query = "SELECT stock_quantity, price FROM products WHERE id = " + result.item;
        connection.query(query, function (err, res) {
            if (!err) {
                let newQuantity = parseInt(res[0].stock_quantity) - parseInt(result.quantity);
                let totalCost = res[0].price * result.quantity;
                if (newQuantity < 0) {
                    console.log("Insufficient quantity!");
                    start();
                } else {
                    query = "UPDATE products SET stock_quantity = " + newQuantity + " WHERE id = " + result.item;
                    connection.query(query, function (err, res) {
                        if (!err) {
                            console.log("Your order total is $" + totalCost);
                            start();
                        } else {
                            console.log(err);
                        }
                    });
                }
            } else {
                console.log(err);
            }
        });
    });
}

function start() {
    displayProducts(function () {
        getOrder();
    });
}

start();