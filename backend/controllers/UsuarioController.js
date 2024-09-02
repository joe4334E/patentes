import Usuario from '../models/Usuario.js';

// Mostrar todos los registros
export const getAllUsuarios = async (req, res) => {
  try {
    const usuarios = await Usuario.findAll();
    res.json(usuarios);
  } catch (error) {
    res.json({ message: error.message });
  }
};

// Mostrar un registro
export const getUsuarioById = async (req, res) => {
  try {
    const usuario = await Usuario.findOne({
      where: { cod: req.params.cod },
    });
    res.json(usuario);
  } catch (error) {
    res.json({ message: error.message });
  }
};

// Crear un registro
export const createUsuario = async (req, res) => {
  try {
    const usuario = await Usuario.create(req.body);
    res.json({
      message: "Registro creado exitosamente",
      usuario,
    });
  } catch (error) {
    res.json({ message: error.message });
  }
};

// Actualizar un registro
export const updateUsuario = async (req, res) => {
  try {
    await Usuario.update(req.body, {
      where: { cod: req.params.cod },
    });
    res.json({
      message: "Registro actualizado exitosamente",
    });
  } catch (error) {
    res.json({ message: error.message });
  }
};

// Eliminar un registro
export const deleteUsuario = async (req, res) => {
  try {
    await Usuario.destroy({
      where: { cod: req.params.cod },
    });
    res.json({
      message: "Registro eliminado exitosamente",
    });
  } catch (error) {
    res.json({ message: error.message });
  }
};
