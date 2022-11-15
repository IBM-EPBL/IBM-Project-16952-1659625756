import psycopg2
import os
from dotenv import load_dotenv

load_dotenv()

class Credentials:
    def __init__(self):
        self.conn=psycopg2.connect(
            host=os.getenv('HOST'),
            database=os.getenv('DATABASE'),
            user=os.getenv('USER'),
            password=os.getenv('PWD')
        )

    def checkCredentials(self,email,password):
        cursor=self.conn.cursor()
        try:
            cursor.execute("""SELECT * FROM auth where email=%s""",(email,))
            res=cursor.fetchone()
            if res:
                return res
            return None
        except:
            #raise
            return None
    
    def __del__(self):
        self.conn.close()