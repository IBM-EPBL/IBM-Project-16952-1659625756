import psycopg2
import os
from dotenv import load_dotenv

load_dotenv()

class JWT:
    def __init__(self):
         self.conn=psycopg2.connect(
            host=os.getenv('HOST'),
            database=os.getenv('DATABASE'),
            user=os.getenv('USER')
            password=os.getenv('PWD')
        )
    def insertJwt(self,jti,uid,exp):
        cursor=self.conn.cursor()
        cursor.execute("""INSERT INTO JWT VALUES(%s, %s, %s)""",jti,uid,exp)
        self.conn.commit()
    def deleteJwt(self,jti):
        cursor=self.conn.cursor()
        cursor.execute("""DELETE FROM JWT WHERE jti=%s""",jti)
        self.conn.commit()
    def __del__(self):
        self.conn.close()
