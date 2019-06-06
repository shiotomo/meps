const dasboard = () => {
  const socket = io.connect(window.location.host);
  console.log(window.location.host);
  console.log(socket);

  socket.on("status", status => {
    console.log(status);
  });

  socket.on("receiveMessage", event => {
    console.log(event);
  });
};

window.onload = () => dasboard();
