const mysql = require('mysql2');

// Környezeti változók
const dbHost = process.env.DB_HOST;
const dbUser = process.env.DB_USER;
const dbPassword = process.env.DB_PASSWORD;
const dbName = process.env.DB_NAME;

// MySQL kapcsolat
const connection = mysql.createConnection({
  host: dbHost,
  user: dbUser,
  password: dbPassword,
  database: dbName
});

// Csatlakozás és lekérdezés
connection.connect(err => {
  if (err) {
    console.error('Hiba a MySQL kapcsolódáskor:', err.message);
    return;
  }
  console.log('Sikeres kapcsolat a MySQL-hez!');

  // Egyszerű lekérdezés
  const query = 'SELECT NOW() as currentTime';
  connection.query(query, (err, results) => {
    if (err) {
      console.error('Hiba a lekérdezés során:', err.message);
    } else {
      console.log('Lekérdezés eredménye:', results[0].currentTime);
    }
    connection.end();
  });
});

