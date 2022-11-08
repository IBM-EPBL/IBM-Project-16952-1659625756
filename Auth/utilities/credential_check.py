from Auth.db.auth import Credentials
import bcrypt

def CredentialCheck(email,password):
    creds=Credentials()
    result=creds.checkCredentials(email,password)
    if(result):
        if(brcypt.checkpw(bytes(password,'utf-8'),bytes(result[2],'utf-8'))):
            return result[0]