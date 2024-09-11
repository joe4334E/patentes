import express from "express";
import UsuarioRoutes from "./UsuarioRoutes.js";
import PatenteRoutes from "./PatenteRoutes.js";
import SindicatoRoutes from "./SindicatoRoutes.js";
import ActividadEconomicaRoutes from "./ActividadEconomicaRoutes.js";
import ComercianteRoutes from "./ComercianteRoutes.js";
import TramiteRoutes from "./TramiteRoutes.js";

const router = express.Router();

router.use("/usuarios", UsuarioRoutes);
router.use("/patentes", PatenteRoutes);
router.use("/sindicatos", SindicatoRoutes);
router.use("/actividad-economicas", ActividadEconomicaRoutes);
router.use("/comerciantes", ComercianteRoutes);
router.use("/tramites", TramiteRoutes);

export default router;
