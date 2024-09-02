import express from 'express';
import {
  getAllSindicatos,
  getSindicatoById,
  createSindicato,
  updateSindicato,
  deleteSindicato
} from '../controllers/SindicatoController.js';

const router = express.Router();

// Obtener todos los sindicatos
router.get('/', getAllSindicatos);

// Obtener un sindicato por ID
router.get('/:cod', getSindicatoById);

// Crear un nuevo sindicato
router.post('/', createSindicato);

// Actualizar un sindicato
router.put('/:cod', updateSindicato);

// Eliminar un sindicato
router.delete('/:cod', deleteSindicato);

export default router;
