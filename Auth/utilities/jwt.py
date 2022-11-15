import jwt
import datetime
from uuid import uuid4
from pytz import timezone
from dotenv import load_dotenv
from Auth.db.jwt import JWT
import os

load_dotenv()

def createJWT(uid):
    jti=uuid4()
    exp=datetime.datetime.now(tz=timezone('Asia/Kolkata'))+datetime.timedelta(weeks=4)
    jwt_payload=jwt.encode({"jti":str(jti),"uid":uid,"exp":exp},os.getenv('JWT_SIGNATURE'))
    db_connection=JWT()
    db_connection.insertJwt(jti,uid,exp)
    return jwt_payload

def deleteJWT(payload):
    db_connection=JWT()
    try:
        jsonPayload=jwt.decode(payload,os.getenv('JWT_SIGNATURE'),algorithms=["HS256"])
        db_connection.deleteJwt(jsonPayload['jti'])
        return 'Logged Out Successfully',200
    except jwt.ExpiredSignatureError:
        db_connection.deleteJwt(jsonPayload['jti'])
        return 'Token Expired',498
    except jwt.InvalidTokenError:
        return 'Invalid Token',401
