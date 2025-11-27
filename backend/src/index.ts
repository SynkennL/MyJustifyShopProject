import express from "express";
const app = express();

app.get("/", (req, res) => {
  res.send("API çalışıyor!");
});

app.listen(3000, () => {
  console.log("Server 3000 portunda çalışıyor");
});
