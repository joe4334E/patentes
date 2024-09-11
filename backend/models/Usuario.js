import { DataTypes } from "sequelize";
import db from "../database/db.js";

const Usuario = db.define("usuarios", {
  correo: {
    type: DataTypes.STRING(100),
    unique: true,
    allowNull: false,
  },
  contrasenia: {
    type: DataTypes.STRING(250),
    allowNull: false,
  },
  estado: {
    type: DataTypes.ENUM("activo", "inactivo"),
    defaultValue: "activo",
  },
  tipo_usuario: {
    type: DataTypes.ENUM("administrador", "cajero", "usuario"),
    defaultValue: "usuario",
  },
  fecha_registro: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW,
  },
});

export default Usuario;
