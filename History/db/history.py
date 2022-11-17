import psycopg2
import psycopg2.extras
from dotenv import load_dotenv
import datetime
from pytz import timezone
import os

load_dotenv()
class History:
    def __init__(self):
        self.conn=psycopg2.connect(
            host=os.getenv('HOST'),
            database=os.getenv('DATABASE'),
            user=os.getenv('USER'),
            password=os.getenv('PWD')
        )
    def commit(self):
        self.conn.commit()
    def insertTransaction(self,uid,expenseDetails):
        psycopg2.extras.register_uuid()
        cursor=self.conn.cursor()
        cursor.execute("INSERT INTO HISTORY VALUES(%s,%s,%s,%s,%s)",(uid,expenseDetails['tag'],expenseDetails['amount'],expenseDetails['remarks'],datetime.datetime.now(tz=timezone('Asia/Kolkata'))))
    def fetchTransactions(self,uid,expenseDetails):
        psycopg2.extras.register_uuid()
        cursor=self.conn.cursor()
        cursor.execute("SELECT tag,amount,remarks,time FROM HISTORY WHERE uid= %s and time between %s::timestamp and %s::timestamp",(uid,expenseDetails["from"],expenseDetails["to"]))
        provisionalResult=cursor.fetchall()
        resultList=[]
        for i in provisionalResult:
            row={}
            row['tag']=i[0]
            row['amount']=i[1]
            row['remarks']=i[2]
            row['time']=str(i[3])
            resultList.append(row)
        return resultList
    def __del__(self):
        self.conn.close()