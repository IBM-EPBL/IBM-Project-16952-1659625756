from flask import Flask
from flask_restful import Api
from Auth.resources.auth_resource import AuthResource
from flask_cors import CORS

app=Flask(__name__)
api=Api(app)
CORS(app)


#endpoints

api.add_resource(AuthResource,"/auth")

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)

