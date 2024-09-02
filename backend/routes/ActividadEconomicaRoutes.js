import express from 'express';
import {
  getAllActividadEconomicas,
  getActividadEconomicaById,
  createActividadEconomica,
  updateActividadEconomica,
  deleteActividadEconomica
} from '../controllers/ActividadEconomicaController.js';

const router = express.Router();

// Obtener todas las actividades económicas
router.get('/', getAllActividadEconomicas);

// Obtener una actividad económica por ID
router.get('/:cod', getActividadEconomicaById);

// Crear una nueva actividad económica
router.post('/', createActividadEconomica);

// Actualizar una actividad económica
router.put('/:cod', updateActividadEconomica);

// Eliminar una actividad económica
router.delete('/:cod', deleteActividadEconomica);

export default router;
