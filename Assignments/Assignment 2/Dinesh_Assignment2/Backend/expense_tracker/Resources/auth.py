from flask_restful import Resource,reqparse
from Resources.dbModel import DbModel


creds=reqparse.RequestParser()
creds.add_argument(
    "email",type=str,location='headers',required=True
)
creds.add_argument(
    "password",type=str,location='headers',required=True
)

patchCreds=creds.copy()
patchCreds.add_argument(
    "newEmail",type=str,location='headers',required=True
)
patchCreds.add_argument(
    "newPassword",type=str,location='headers',required=True
)
class Auth(Resource):
    def __init__(self):
        self.db=DbModel()
    def put(self):
        parsedCreds=creds.parse_args()
        if(self.db.register(parsedCreds['email'],parsedCreds['password'])):
            return 'Successful',200
        else:
            return 'Group Already in Database',409
    def get(self):
        parsedCreds=creds.parse_args()
        if(self.db.login(parsedCreds['email'],parsedCreds['password'])):
            return 'Successful',200
        else:
            return 'Invalid Credentials',404
    
    def patch(self):
        parsedCreds=patchCreds.parse_args()
        if(self.db.change(parsedCreds['email'],parsedCreds['password'],parsedCreds['newEmail'],parsedCreds['newPassword'])):
            return 'Successful',200
        else:
            return 'Unforeseen Error',500
    def delete(self):
        parsedCreds=creds.parse_args()
        if(self.db.delete(parsedCreds['email'],parsedCreds['password'])):
            return 'Successful',200
        else:
            return 'Invalid Credentials',404
