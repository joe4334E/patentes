import { Sequelize } from "sequelize";

const db = new Sequelize("patentes", "root", "", {
  host: "localhost",
  dialect: "mysql",
});

export default db;