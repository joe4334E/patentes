import Sindicato from '../models/Sindicato.js';

// Mostrar todos los registros
export const getAllSindicatos = async (req, res) => {
  try {
    const sindicatos = await Sindicato.findAll();
    res.json(sindicatos);
  } catch (error) {
    res.json({ message: error.message });
  }
};

// Mostrar un registro
export const getSindicatoById = async (req, res) => {
  try {
    const sindicato = await Sindicato.findOne({
      where: { cod: req.params.cod },
    });
    res.json(sindicato);
  } catch (error) {
    res.json({ message: error.message });
  }
};

// Crear un registro
export const createSindicato = async (req, res) => {
  try {
    const sindicato = await Sindicato.create(req.body);
    res.json({
      message: "Registro creado exitosamente",
      sindicato,
    });
  } catch (error) {
    res.json({ message: error.message });
  }
};

// Actualizar un registro
export const updateSindicato = async (req, res) => {
  try {
    await Sindicato.update(req.body, {
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
export const deleteSindicato = async (req, res) => {
  try {
    await Sindicato.destroy({
      where: { cod: req.params.cod },
    });
    res.json({
      message: "Registro eliminado exitosamente",
    });
  } catch (error) {
    res.json({ message: error.message });
  }
};
