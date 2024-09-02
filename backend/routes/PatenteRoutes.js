import express from 'express';
import {
  getAllPatentes,
  getPatenteById,
  createPatente,
  updatePatente,
  deletePatente
} from '../controllers/PatenteController.js';

const router = express.Router();

// Obtener todas las patentes
router.get('/', getAllPatentes);

// Obtener una patente por ID
router.get('/:cod', getPatenteById);

// Crear una nueva patente
router.post('/', createPatente);

// Actualizar una patente
router.put('/:cod', updatePatente);

// Eliminar una patente
router.delete('/:cod', deletePatente);

export default router;
