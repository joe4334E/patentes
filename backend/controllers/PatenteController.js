import Patente from '../models/Patente.js';

// Mostrar todos los registros
export const getAllPatentes = async (req, res) => {
  try {
    const patentes = await Patente.findAll();
    res.json(patentes);
  } catch (error) {
    res.json({ message: error.message });
  }
};

// Mostrar un registro
export const getPatenteById = async (req, res) => {
  try {
    const patente = await Patente.findOne({
      where: { cod: req.params.cod },
    });
    res.json(patente);
  } catch (error) {
    res.json({ message: error.message });
  }
};

// Crear un registro
export const createPatente = async (req, res) => {
  try {
    const patente = await Patente.create(req.body);
    res.json({
      message: "Registro creado exitosamente",
      patente,
    });
  } catch (error) {
    res.json({ message: error.message });
  }
};

// Actualizar un registro
export const updatePatente = async (req, res) => {
  try {
    await Patente.update(req.body, {
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
export const deletePatente = async (req, res) => {
  try {
    await Patente.destroy({
      where: { cod: req.params.cod },
    });
    res.json({
      message: "Registro eliminado exitosamente",
    });
  } catch (error) {
    res.json({ message: error.message });
  }
};
