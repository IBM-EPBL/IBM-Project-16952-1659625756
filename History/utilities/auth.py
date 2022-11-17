import jwt
from dotenv import load_dotenv
from Auth.db.jwt import JWT
from History.utilities.expense import insertExpense,filterExpenses
import os

load_dotenv()

def tokenCheckAndInsertExpense(token,expenseDetails):
    db_connection=JWT()
    try:
        jsonPayload=jwt.decode(token,os.getenv('JWT_SIGNATURE'),algorithms=["HS256"])
        insertExpense(jsonPayload['uid'],expenseDetails)
        return 'Expense Recorded',200
    except jwt.ExpiredSignatureError:
        db_connection.deleteJwt(jsonPayload['jti'])
        return 'Token Expired',498
    except jwt.InvalidTokenError:
        return 'Invalid Token',401

def tokenCheckAndGiveExpense(token,filterData):
    db_connection=JWT()
    try:
        jsonPayload=jwt.decode(token,os.getenv('JWT_SIGNATURE'),algorithms=["HS256"])
        return filterExpenses(jsonPayload['uid'],filterData),200
    except jwt.ExpiredSignatureError:
        db_connection.deleteJwt(jsonPayload['jti'])
        return 'Token Expired',498
    except jwt.InvalidTokenError:
        return 'Invalid Token',401

