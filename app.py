from flask import Flask
from db import conn
app=Flask(__name__)



@app.route("/")
def home():
    db=conn()
    cursor=db.cursor()
    cursor.execute("""
                   SELECT 
                   """)  
    return 