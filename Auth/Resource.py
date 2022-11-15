from flask_restful import Resource
from Auth.Parsers.auth import loginParse,logoutParse
import base64
from Auth.utilities import credential_check,jwt



class AuthResource(Resource):
    def post(self):
        parsedAuth=loginParse.parse_args()
        data=parsedAuth["Authorization"].split(' ')
        if(data[0]!='Basic'):
            return 'Unexpected Authentication Method',400
        credentials=base64.b64decode(data[1].encode('utf-8')).decode('utf-8').split(':')
        uid=credential_check.CredentialCheck(credentials[0],credentials[1])
        if(uid):
            return jwt.createJWT(uid),200
        else:
            return 'Invalid Credentials',401
    
    def delete(self):
        parsedAuth=logoutParse.parse_args()
        data=parsedAuth["Authorization"].split(' ')
        if(data[0]!='Bearer'):
            return 'Unexpected Authentication Method',400
        return jwt.deleteJWT(data[1])
        

        