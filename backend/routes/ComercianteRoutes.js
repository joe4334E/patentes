import express from 'express';
import {
  getAllComerciantes,
  getComercianteById,
  createComerciante,
  updateComerciante,
  deleteComerciante
} from '../controllers/ComercianteController.js';

const router = express.Router();

// Obtener todos los comerciantes
router.get('/', getAllComerciantes);

// Obtener un comerciante por ID
router.get('/:cod', getComercianteById);

// Crear un nuevo comerciante
router.post('/', createComerciante);

// Actualizar un comerciante
router.put('/:cod', updateComerciante);

// Eliminar un comerciante
router.delete('/:cod', deleteComerciante);

export default router;
