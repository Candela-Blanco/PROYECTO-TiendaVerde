import mysql.connector


def conn():
    db = mysql.connector.connect(
        host="localhost",
        user="candela",
        password="local123HOST@!",
        database="tiendaverde",
    )
    return db
