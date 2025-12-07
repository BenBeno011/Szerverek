from flask import Flask, jsonify
import mysql.connector

app = Flask(__name__)

# Adatbázis kapcsolat beállítások
db_config = {
    'host': 'mdb1.mynet',      # adatbázis szerver címe
    'user': 'root',           # felhasználónév
    'password': '123456',     # jelszó
    'database': ''            # itt üres, mert csak SHOW DATABASES-t futtatunk
}

@app.route('/')
def show_databases():
    try:
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor()
        cursor.execute("SHOW DATABASES;")
        databases = [db[0] for db in cursor.fetchall()]
        cursor.close()
        conn.close()
        return jsonify(databases)
    except mysql.connector.Error as err:
        return f"Hiba az adatbázishoz való kapcsolódáskor: {err}", 500

if __name__ == '__main__':
    app.run(host='0.0.0.0',port='5005',debug=True)
