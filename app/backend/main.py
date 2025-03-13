from flask import Flask, render_template
from database import init_db
from routes import auth_blueprint
import os

TEMPLATE_DIR = os.path.abspath("frontend/templates")

app = Flask(__name__, template_folder=TEMPLATE_DIR)
app.register_blueprint(auth_blueprint)

@app.before_request
def setup():
    init_db()

@app.route('/')
def index():
    return render_template('login.html')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
