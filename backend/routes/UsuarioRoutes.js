import express from "express";
import {
  getAllUsuarios,
  getUsuarioById,
  createUsuario,
  updateUsuario,
  deleteUsuario,
} from "../controllers/UsuarioController.js";

const router = express.Router();

// Obtener todos los usuarios
router.get("/", getAllUsuarios);

// Obtener un usuario por ID
router.get("/:cod", getUsuarioById);

// Crear un nuevo usuario
router.post("/", createUsuario);

// Actualizar un usuario
router.put("/:cod", updateUsuario);

// Eliminar un usuario
router.delete("/:cod", deleteUsuario);

export default router;
