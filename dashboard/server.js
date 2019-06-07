require("dotenv").config();

const express = require("express");
const bodyParser = require("body-parser");
const PORT = process.env.PORT || 5000;
const app = express();
const http = require("http").Server(app);
const io = require("socket.io")(http);

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
io.sockets.on("connection", socket => {
  // 接続時の処理
  console.log("Entry server");

  // agentからのデータをブロードキャストする
  socket.on("status", status => {
    console.log(status);
    io.emit("status", JSON.parse(status));
  });

  // 切断時の処理
  socket.on("disconnect", () => {
    console.log("Exit server.");
  });
});

http.listen(PORT, () => {
  console.log(`Start MSNS Dashboard Server !! DATE:${new Date().toString()}`);
});
