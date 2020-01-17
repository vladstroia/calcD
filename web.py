import itertools
from flask import Flask, render_template, request, jsonify
app = Flask(__name__)

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/process", methods=["POST"])
def process():
    num1 = int(request.form["number1"])
    num2 = int(request.form["number2"])

    resultat = num1 + num2
    return jsonify({"result" : resultat})


if __name__ == "__main__":
    app.run(debug=True)
