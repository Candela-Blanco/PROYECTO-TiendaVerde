from flask import Flask
from db import conn

app = Flask(__name__)


@app.route("/")
def home():
    db = conn()
    cursor = db.cursor()
    cursor.execute(
        """
            SELECT ensaladas.id, ensaladas.nombre, ensaladas.precio, ensaladas.peso,
            GROUP_CONCAT(ingredientes.nombre) AS ingredientes FROM ensaladas LEFT JOIN ensalada_ingrediente ON ensaladas.id = ensalada_ingrediente.id_ensalada LEFT JOIN ingredientes ON ensalada_ingrediente.id_ingrediente = ingredientes.id GROUP BY ensaladas.id;
       """
    )
    return
