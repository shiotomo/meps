require("dotenv").config();

const client = require("socket.io-client");

const DASHBOARD = process.env.DASHBOARD;
const socket = client.connect(DASHBOARD);

const agent = () => {
  socket.on("connect", () => {
    console.log("send status.");
    socket.emit("status", new Date().toString());
  });
};

agent();
