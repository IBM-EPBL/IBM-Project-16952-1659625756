import psycopg2
import psycopg2.extras
from psycopg2.sql import Identifier,SQL
from dotenv import load_dotenv
import os

load_dotenv()


class Tags:
    def __init__(self):
        self.conn=psycopg2.connect(
            host=os.getenv('HOST'),
            database=os.getenv('DATABASE'),
            user=os.getenv('USER'),
            password=os.getenv('PWD')
        )
    def commit(self):
        self.conn.commit()
    def updateTag(self,uid,expenseDetails):
        psycopg2.extras.register_uuid()
        cursor=self.conn.cursor()
        cursor.execute(SQL("UPDATE {} SET Expenditure=Expenditure+%s WHERE uid=%s").format(
            Identifier(expenseDetails['tag'])),
            (expenseDetails['amount'],uid))
    def __del__(self):
        self.conn.close()