const dasboards = () => {
  const socket = io.connect(window.location.host);
  const dashboard = document.getElementById("dashboard");
  const serverList = [];

  // statusにはJSON形式のデータが格納されている
  socket.on("status", status => {
    if (status.active && serverList.indexOf(status.containerId) == -1) {
      serverList.push(status.containerId);
      const div = document.createElement("div");
      div.id = status.containerId;
      div.innerHTML = `ServerID: ${status.containerId} DATE: ${status.date}`;
      dashboard.appendChild(div);
    }
    if (!status.active && serverList.indexOf(status.containerId) >= -0) {
      const element = document.getElementById(status.containerId);
      serverList.push(status.containerId);
      while (element.firstChild) element.removeChild(element.firstChild);
    } else {
      const div = document.getElementById(status.containerId);
      div.innerHTML = `ServerID: ${status.containerId} DATE: ${status.date}`;
    }
  });
};

window.onload = () => dasboards();
