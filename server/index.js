const { json } = require("express");
const express = require("express");
const mongoose = require("mongoose");
const PORT = 3000;

const authRouter = require("./routes/auth");

const app = express();
const DB =
  "mongodb+srv://jabri:Abdessamad99@cluster0.kfrvoih.mongodb.net/?retryWrites=true&w=majority";

//middlewares
app.use(express.json());

app.use(authRouter);

mongoose
  .connect(DB)
  .then(() => {
    console.log("connected to database");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}`);
});
