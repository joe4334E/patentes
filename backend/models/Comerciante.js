import { DataTypes } from 'sequelize';
import db from '../database/db.js';
import Sindicato from './Sindicato.js';
import Usuario from './Usuario.js';

const Comerciante = db.define('comerciantes', {
  nombre: {
    type: DataTypes.STRING(100),
    allowNull: false,
  },
  ci: {
    type: DataTypes.STRING(20),
    unique: true,
    allowNull: false,
  },
  direccion: {
    type: DataTypes.STRING(255),
    allowNull: true,
  },
  fecha_registro: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW,
  },
  sindicato_cod: {
    type: DataTypes.INTEGER,
    references: {
      model: Sindicato,
      key: 'cod',
    },
  },
  usuario_cod: {
    type: DataTypes.INTEGER,
    references: {
      model: Usuario,
      key: 'cod',
    },
  },
});

Comerciante.belongsTo(Sindicato, { foreignKey: 'sindicato_cod' });
Comerciante.belongsTo(Usuario, { foreignKey: 'usuario_cod' });
Sindicato.hasMany(Comerciante, { foreignKey: 'sindicato_cod' });
Usuario.hasMany(Comerciante, { foreignKey: 'usuario_cod' });

export default Comerciante;
