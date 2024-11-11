from flask import Flask, render_template, request, redirect, url_for
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
    ensaladas = cursor.fetchall()
    print(ensaladas)
    return render_template("view_ensaladas.html", ensaladas=ensaladas)


@app.route("/ensaladas/create", methods=["GET", "POST"])
def create_ensaladas():
    db = conn()
    cursor = db.cursor(dictionary=True)

    cursor.execute(
        """
            SELECT * from ingredientes
       """
    )
    ingredientes = cursor.fetchall()
    if request.method == "POST":
        nombre = request.form["nombre"]
        precio = request.form["precio"]
        peso = request.form["peso"]
        ingrediente_selec = request.form.getlist("ingredientes")
        cursor.execute(
            """
                       INSERT INTO ensaladas (nombre,precio,peso) VALUES (%s,%s,%s)
                       """,
            (nombre, precio, peso),
        )
        db.commit()
        id_ensalada = cursor.lastrowid
        for ingrediente_id in ingrediente_selec:
            cursor.execute(
                """
                           INSERT INTO ensalada_ingrediente (id_ensalada, id_ingrediente) VALUES (%s,%s)
                           """,
                (id_ensalada, ingrediente_id),
            )
        db.commit()
        return redirect(url_for("read_ensaladas"))
    else:
        return render_template("create_ensaladas.html", ingredientes=ingredientes)


@app.route("/ensaladas/delete/<int:id>", methods=["POST"])
def delete_ensaladas(id):
    db = conn()
    cursor = db.cursor(dictionary=True)
    cursor.execute(
        """
                   DELETE FROM ensalada_ingrediente where id_ensalada=%s
                   """,
        (id,),
    )
    cursor.execute(
        """
                   DELETE FROM ensaladas where id = %s
                   """,
        (id,),
    )
    db.commit()
    return redirect(url_for("read_ensaladas"))


@app.route("/ingredientes")
def read_ingredientes():
    db = conn()
    cursor = db.cursor(dictionary=True)
    cursor.execute(
        """
            SELECT * from ingredientes;
       """
    )
    ingredientes = cursor.fetchall()
    print(ingredientes)
    return render_template("view_ingredientes.html", ingredientes=ingredientes)


@app.route("/ingredientes/delete/<int:id>", methods=["POST"])
def delete_ingredientes(id):
    db = conn()
    cursor = db.cursor(dictionary=True)
    cursor.execute(
        """
                   DELETE FROM ensalada_ingrediente where id_ingrediente=%s
                   """,
        (id,),
    )
    cursor.execute(
        """
                   DELETE FROM ingredientes where id = %s
                   """,
        (id,),
    )
    db.commit()
    return redirect(url_for("read_ingredientes"))


@app.route("/ingredientes/create", methods=["GET", "POST"])
def create_ingredientes():
    db = conn()
    cursor = db.cursor(dictionary=True)
    if request.method == "POST":
        nombre = request.form["nombre"]
        cursor.execute(
            """
                       INSERT INTO ingredientes (nombre) VALUES (%s)
                       """,
            (nombre,),
        )
        db.commit()
        return redirect(url_for("read_ingredientes"))
    else:
        return render_template("create_ingrediente.html")


@app.route("/ensalada/edit/<int:id>", methods=["GET", "POST"])
def edit_ensalada(id):
    db = conn()
    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT * FROM ensaladas WHERE id=%s", (id,))
    ensalada = cursor.fetchone()
    cursor.execute("SELECT * FROM ingredientes")
    ingredientes = cursor.fetchall()
    cursor.execute(
        """
                   SELECT id_ingrediente from ensalada_ingrediente WHERE id_ensalada=%s
                   """,
        (id,),
    )
    ingredientes_ensalada = cursor.fetchall()
    ingredientes_ensalada = [i["id_ingrediente"] for i in ingredientes_ensalada]

    if request.method == "POST":
        nombre = request.form["nombre"]
        precio = request.form["precio"]
        peso = request.form["peso"]
        selected_ingredientes = request.form.getlist("ingredientes")
        cursor.execute(
            """
                       UPDATE ensaladas SET nombre=%s,precio=%s,peso=%s WHERE id=%s
                       """,
            (nombre, precio, peso, id),
        )
        db.commit()
        cursor.execute("DELETE FROM ensalada_ingrediente WHERE id_ensalada=%s", (id,))
        for ingrediente_id in selected_ingredientes:
            cursor.execute(
                "INSERT INTO ensalada_ingrediente(id_ensalada,id_ingrediente) VALUES(%s,%s)",
                (id, ingrediente_id),
            )
        db.commit()
        return redirect(url_for("read_ensaladas"))
    return render_template(
        "edit_ensaladas.html",
        ensalada=ensalada,
        ingredientes=ingredientes,
        ingredientes_ensalada=ingredientes_ensalada,
    )
