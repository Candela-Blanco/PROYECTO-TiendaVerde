import mysql.connector


def conn():
    db = mysql.connector.connect(
        host="localhost",
        user="yoezequiel",
        password="112358",
        database="tiendaverde",
    )
    return db
