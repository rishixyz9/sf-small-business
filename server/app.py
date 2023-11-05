from flask import Flask
from flask import request
import sys

from .api import get_weights
from .api import get_agents

app = Flask(__name__)

@app.route("/")
def hello_world():
    return "<p>Hello, World!</p>"

@app.route("/getweights", methods = ['POST'])
def return_weights():
    message = request.get_json()
    res = get_weights.get_weights(message)
    print(res)
    return res

@app.route("/getmatches", methods=['POST'])
def return_matches():
    user_weights = request.get_json()
    res = get_agents.get_matches(user_weights)
    print(res)
    return res