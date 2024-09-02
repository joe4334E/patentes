import { DataTypes } from 'sequelize';
import db from '../database/db.js';
import Usuario from './Usuario.js';

const Patente = db.define('patentes', {
  nombre: {
    type: DataTypes.STRING(50),
    allowNull: false,
  },
  descripcion: {
    type: DataTypes.STRING(200),
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

Patente.belongsTo(Usuario, { foreignKey: 'usuario_cod' });
Usuario.hasMany(Patente, { foreignKey: 'usuario_cod' });

export default Patente;
