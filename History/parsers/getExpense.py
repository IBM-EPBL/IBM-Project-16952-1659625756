from flask_restful import reqparse


filterExpense=reqparse.RequestParser()

filterExpense.add_argument(
    "Authorization",type=str,location="headers",required=True
)
filterExpense.add_argument(
    "from",type=str,location="json",required=True
)
filterExpense.add_argument(
    "to",type=str,location="json",required=True
)

