import express from 'express';
import {
  getAllTramites,
  getTramiteById,
  createTramite,
  updateTramite,
  deleteTramite
} from '../controllers/TramiteController.js';

const router = express.Router();

// Obtener todos los trámites
router.get('/', getAllTramites);

// Obtener un trámite por ID
router.get('/:cod', getTramiteById);

// Crear un nuevo trámite
router.post('/', createTramite);

// Actualizar un trámite
router.put('/:cod', updateTramite);

// Eliminar un trámite
router.delete('/:cod', deleteTramite);

export default router;
