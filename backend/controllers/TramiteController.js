import Tramite from '../models/Tramite.js';

// Mostrar todos los registros
export const getAllTramites = async (req, res) => {
  try {
    const tramites = await Tramite.findAll();
    res.json(tramites);
  } catch (error) {
    res.json({ message: error.message });
  }
};

// Mostrar un registro
export const getTramiteById = async (req, res) => {
  try {
    const tramite = await Tramite.findOne({
      where: { cod: req.params.cod },
    });
    res.json(tramite);
  } catch (error) {
    res.json({ message: error.message });
  }
};

// Crear un registro
export const createTramite = async (req, res) => {
  try {
    const tramite = await Tramite.create(req.body);
    res.json({
      message: "Registro creado exitosamente",
      tramite,
    });
  } catch (error) {
    res.json({ message: error.message });
  }
};

// Actualizar un registro
export const updateTramite = async (req, res) => {
  try {
    await Tramite.update(req.body, {
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
export const deleteTramite = async (req, res) => {
  try {
    await Tramite.destroy({
      where: { cod: req.params.cod },
    });
    res.json({
      message: "Registro eliminado exitosamente",
    });
  } catch (error) {
    res.json({ message: error.message });
  }
};
