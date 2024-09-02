import Comerciante from '../models/Comerciante.js';

// Mostrar todos los registros
export const getAllComerciantes = async (req, res) => {
  try {
    const comerciantes = await Comerciante.findAll();
    res.json(comerciantes);
  } catch (error) {
    res.json({ message: error.message });
  }
};

// Mostrar un registro
export const getComercianteById = async (req, res) => {
  try {
    const comerciante = await Comerciante.findOne({
      where: { cod: req.params.cod },
    });
    res.json(comerciante);
  } catch (error) {
    res.json({ message: error.message });
  }
};

// Crear un registro
export const createComerciante = async (req, res) => {
  try {
    const comerciante = await Comerciante.create(req.body);
    res.json({
      message: "Registro creado exitosamente",
      comerciante,
    });
  } catch (error) {
    res.json({ message: error.message });
  }
};

// Actualizar un registro
export const updateComerciante = async (req, res) => {
  try {
    await Comerciante.update(req.body, {
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
export const deleteComerciante = async (req, res) => {
  try {
    await Comerciante.destroy({
      where: { cod: req.params.cod },
    });
    res.json({
      message: "Registro eliminado exitosamente",
    });
  } catch (error) {
    res.json({ message: error.message });
  }
};
