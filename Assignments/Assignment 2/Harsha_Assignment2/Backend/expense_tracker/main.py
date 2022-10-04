from flask import Flask
from flask_restful import Api
from Resources.auth import Auth
from flask_cors import CORS

app=Flask(__name__)
api=Api(app)
CORS(app)
#endpoints

api.add_resource(Auth,"/auth")

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)



