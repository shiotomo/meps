require("dotenv").config();

const client = require("socket.io-client");

const DASHBOARD = process.env.DASHBOARD;
const socket = client.connect(DASHBOARD);

// MinecraftServerのデータを取得する
// 返り値: String
const getStatus = () => {
  const status = {
    serverContainer: "hoge",
    date: new Date().toDateString(),
    ip: "192.168.10.10"
  };
  return JSON.stringify(status);
};

// 定期的にDashboardにデータを送信するメソッド
const agent = () => {
  console.log(`Start MSNS agent!! DATE: ${new Date().toString()}`);
  setInterval(() => {
    socket.emit("status", getStatus());
  }, 1000);
};

// agentを実行する
agent();
