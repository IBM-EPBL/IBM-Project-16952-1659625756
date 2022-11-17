from History.db.history import History
from History.db.tags import Tags
import datetime
from pytz import timezone
import json

def insertExpense(uid,expenseDetails):
    historyModel=History()
    tagModel=Tags()
    historyModel.insertTransaction(uid,expenseDetails)
    tagModel.updateTag(uid,expenseDetails)
    historyModel.commit()
    tagModel.commit()

def filterExpenses(uid,filterData):
    historyModel=History()
    dates={}
    dates["from"]=datetime.datetime.fromtimestamp(int(filterData["from"]),tz=timezone('Asia/Kolkata'))
    dates["to"]=datetime.datetime.fromtimestamp(int(filterData["to"]),tz=timezone('Asia/Kolkata'))
    print(dates["from"],"from")
    print(dates["to"],"to")
    resultList=historyModel.fetchTransactions(uid,dates)
    resultDict={"result":resultList}
    return json.dumps(resultDict)
