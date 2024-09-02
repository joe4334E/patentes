import express from 'express';
import bodyParser from 'body-parser';
import db from './database/db.js'; // Asegúrate de configurar tu conexión
import routes from './routes/index.js';

const app = express();
const port = process.env.PORT || 8000; // Cambiado a puerto 8000

// Middleware para parsear JSON
app.use(bodyParser.json());

// Middleware para las rutas
app.use('/api', routes);

// Iniciar el servidor
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});

// Conectar a la base de datos
db.authenticate()
  .then(() => console.log('Database connected...'))
  .catch(err => console.error('Unable to connect to the database:', err));
