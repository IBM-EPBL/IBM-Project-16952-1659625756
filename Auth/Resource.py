from flask_restful import Resource
from Auth.Parsers.auth import loginParse,logoutParse
import base64
from Auth import utilities



class AuthResource(Resource):
    def post(self):
        parsedAuth=loginParse.parse_args()
        data=parsedAuth.split(' ')
        if(data[0]!='Basic'):
            return 'Unexpected Authentication Method',400
        credentials=base64.b64decode(data[1]).split(':')
        uid=utilities.credential_check.CredentialCheck(credentials[0],credentials[1])
        if(uid):
            return utilities.jwt.createJWT(uid),200
    
    def delete(self):
        parsedAuth=logoutParse.parse_args()
        data=parsedAuth.split(' ')
        if(data[0]!='Bearer'):
            return 'Unexpected Authentication Method',400
        return utilities.jwt.deleteJWT(data[1])
        

        