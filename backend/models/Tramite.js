import { DataTypes } from 'sequelize';
import db from '../database/db.js';
import Patente from './Patente.js';
import Comerciante from './Comerciante.js';
import ActividadEconomica from './ActividadEconomica.js';
import Usuario from './Usuario.js';

const Tramite = db.define('tramites', {
  monto: {
    type: DataTypes.DECIMAL(10, 2),
    allowNull: false,
  },
  fecha_inicio: {
    type: DataTypes.DATEONLY,
    allowNull: false,
  },
  fecha_fin: {
    type: DataTypes.DATEONLY,
    allowNull: true,
  },
  estado: {
    type: DataTypes.ENUM('activo', 'inactivo'),
    defaultValue: 'activo',
  },
  fecha_registro: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW,
  },
  patente_cod: {
    type: DataTypes.INTEGER,
    references: {
      model: Patente,
      key: 'cod',
    },
  },
  comerciante_cod: {
    type: DataTypes.INTEGER,
    references: {
      model: Comerciante,
      key: 'cod',
    },
  },
  actividad_economica_cod: {
    type: DataTypes.INTEGER,
    references: {
      model: ActividadEconomica,
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

Tramite.belongsTo(Patente, { foreignKey: 'patente_cod' });
Tramite.belongsTo(Comerciante, { foreignKey: 'comerciante_cod' });
Tramite.belongsTo(ActividadEconomica, { foreignKey: 'actividad_economica_cod' });
Tramite.belongsTo(Usuario, { foreignKey: 'usuario_cod' });
Patente.hasMany(Tramite, { foreignKey: 'patente_cod' });
Comerciante.hasMany(Tramite, { foreignKey: 'comerciante_cod' });
ActividadEconomica.hasMany(Tramite, { foreignKey: 'actividad_economica_cod' });
Usuario.hasMany(Tramite, { foreignKey: 'usuario_cod' });

export default Tramite;
