require("dotenv").config();

const express = require("express");
const socket = require("socket.io");
const bodyParser = require("body-parser");

const app = express();

// viewの設定
app.set("views", `${__dirname}/views`);
app.set("view engine", "ejs");

// javascript, cssの設定j
app.use("/public", express.static(`${__dirname}/public`));

// body-parserの設定
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// controller
app.get("/", (req, res, next) => {
  res.render("dashboard");
});

// websocket

const server = app.listen(process.env.PORT, () => {
  console.log(
    `Start Dashboard Server !! PORT:${server.address().port} DATE:${new Date()}`
  );
});
