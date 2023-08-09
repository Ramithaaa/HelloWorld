from flask import Flask
app=Flask(__name__)
@app.route('/')
def hello_world():
    return "Hellooo,World!!!"
app.run(host='0.0.0.0',port=3000)