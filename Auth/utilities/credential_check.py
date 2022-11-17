from Auth.db.auth import Credentials
import bcrypt

test=True
def CredentialCheck(email,password):
    creds=Credentials()
    result=creds.checkCredentials(email,password)
    if(result):
        if(not test and bcrypt.checkpw(bytes(password,'utf-8'),bytes(result[2],'utf-8'))):
            return result[0]
        elif(test):
            if(password==result[2]):
                return result[0]


