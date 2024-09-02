import { DataTypes } from 'sequelize';
import db from '../database/db.js';
import Usuario from './Usuario.js';

const Sindicato = db.define('sindicatos', {
  nombre: {
    type: DataTypes.STRING(100),
    unique: true,
    allowNull: false,
  },
  nombre_presidente: {
    type: DataTypes.STRING(100),
    allowNull: true,
  },
  zona: {
    type: DataTypes.STRING(50),
    allowNull: true,
  },
  area: {
    type: DataTypes.STRING(50),
    allowNull: true,
  },
  fecha_registro: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW,
  },
  usuario_cod: {
    type: DataTypes.INTEGER,
    references: {
      model: Usuario,
      key: 'cod',
    },
  },
});

Sindicato.belongsTo(Usuario, { foreignKey: 'usuario_cod' });
Usuario.hasMany(Sindicato, { foreignKey: 'usuario_cod' });

export default Sindicato;
