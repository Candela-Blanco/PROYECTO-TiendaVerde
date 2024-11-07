from flask import Flask, render_template
from db import conn

app = Flask(__name__)


@app.route("/")
def home():
    return render_template("index.html")

@app.route("/ensaladas")
def read_ensaladas():
    db = conn()
    cursor = db.cursor(dictionary=True)
    cursor.execute(
        """
            SELECT ensaladas.id, ensaladas.nombre, ensaladas.precio, ensaladas.peso,
            GROUP_CONCAT(ingredientes.nombre) AS ingredientes FROM ensaladas LEFT JOIN ensalada_ingrediente ON ensaladas.id = ensalada_ingrediente.id_ensalada LEFT JOIN ingredientes ON ensalada_ingrediente.id_ingrediente = ingredientes.id GROUP BY ensaladas.id;
       """
    )
    ensaladas=cursor.fetchall()
    print(ensaladas)
    return render_template("view_ensaladas.html",ensaladas=ensaladas)

@app.route("/ensaladas/create")
def create_ensaladas():
    db = conn()
    cursor = db.cursor(dictionary=True)
    
    cursor.execute(
        """

       """
    )
    pass