from flask_restful import reqparse

addNewExpense=reqparse.RequestParser()


addNewExpense.add_argument(
    "Authorization",type=str,location="headers",required=True
)
addNewExpense.add_argument(
     "tag",type=str,location="json",required=True
)
addNewExpense.add_argument(
    "amount",type=float,location="json",required=True
)
addNewExpense.add_argument(
    "group_details",type=list,location="json"
)
addNewExpense.add_argument(
    "remarks",type=str,location="json"
)