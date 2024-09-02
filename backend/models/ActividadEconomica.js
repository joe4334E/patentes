import { DataTypes } from 'sequelize';
import db from '../database/db.js';
import Usuario from './Usuario.js';

const ActividadEconomica = db.define('actividad_economicas', {
  tipo_actividad: {
    type: DataTypes.STRING(50),
    allowNull: false,
  },
  descripcion_actividad: {
    type: DataTypes.STRING(250),
    allowNull: true,
  },
  ubicacion: {
    type: DataTypes.STRING(100),
    allowNull: true,
  },
  monto_t: {
    type: DataTypes.DECIMAL(10, 2),
    defaultValue: 0.00,
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

ActividadEconomica.belongsTo(Usuario, { foreignKey: 'usuario_cod' });
Usuario.hasMany(ActividadEconomica, { foreignKey: 'usuario_cod' });

export default ActividadEconomica;
