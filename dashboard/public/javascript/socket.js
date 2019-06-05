window.onload = () => {
  const socket = io.connect(`${window.location.host}`);
  console.log(window.location.host);
  console.log(socket);

  socket.emit("hoge");

  socket.on("receiveMessage", event => {
    console.log(event);
  });
};
