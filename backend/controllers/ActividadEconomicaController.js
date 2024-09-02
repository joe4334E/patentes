import ActividadEconomica from '../models/ActividadEconomica.js';

// Mostrar todos los registros
export const getAllActividadEconomicas = async (req, res) => {
  try {
    const actividades = await ActividadEconomica.findAll();
    res.json(actividades);
  } catch (error) {
    res.json({ message: error.message });
  }
};

// Mostrar un registro
export const getActividadEconomicaById = async (req, res) => {
  try {
    const actividad = await ActividadEconomica.findOne({
      where: { cod: req.params.cod },
    });
    res.json(actividad);
  } catch (error) {
    res.json({ message: error.message });
  }
};

// Crear un registro
export const createActividadEconomica = async (req, res) => {
  try {
    const actividad = await ActividadEconomica.create(req.body);
    res.json({
      message: "Registro creado exitosamente",
      actividad,
    });
  } catch (error) {
    res.json({ message: error.message });
  }
};

// Actualizar un registro
export const updateActividadEconomica = async (req, res) => {
  try {
    await ActividadEconomica.update(req.body, {
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
export const deleteActividadEconomica = async (req, res) => {
  try {
    await ActividadEconomica.destroy({
      where: { cod: req.params.cod },
    });
    res.json({
      message: "Registro eliminado exitosamente",
    });
  } catch (error) {
    res.json({ message: error.message });
  }
};
