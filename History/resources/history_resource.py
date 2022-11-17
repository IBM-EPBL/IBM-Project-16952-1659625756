from flask_restful import Resource
from History.parsers.getExpense import filterExpense
from History.parsers.newExpense import addNewExpense
from History.utilities.auth import tokenCheckAndInsertExpense,tokenCheckAndGiveExpense


class HistoryResource(Resource):
    def post(self):
        expenseDetails=addNewExpense.parse_args()
        authDetails=expenseDetails["Authorization"].split(' ')
        if(authDetails[0]!='Bearer'):
            return 'Unexpected Authentication Method',400
        return tokenCheckAndInsertExpense(authDetails[1],expenseDetails)
    def get(self):
        filterData=filterExpense.parse_args()
        authDetails=filterData["Authorization"].split(' ')
        if(authDetails[0]!='Bearer'):
            return 'Unexpected Authentication Method',400
        return tokenCheckAndGiveExpense(authDetails[1],filterData)