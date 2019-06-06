require("dotenv").config();

const client = require("socket.io-client");

const DASHBOARD = process.env.DASHBOARD;
const socket = client.connect(DASHBOARD);

// MinecraftServerのデータを取得する
const getStatus = () => {
  return new Date();
};

// 定期的にDashboardにデータを送信するメソッド
const agent = () => {
  console.log(`Start MSNS agent!! DATE: ${new Date().toString()}`);
  setInterval(() => {
    socket.emit("status", getStatus());
  }, 1000);
};

agent();
