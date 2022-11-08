from flask_restful import reqparse

loginParse=reqparse.RequestParser()
logoutParse=reqparse.RequestParser()

loginParse.add_argument(
    "Authorization",type=str,location="headers",required=True
)

logoutParse.add_argument(
    "Authorization",type=str,location="headers",required=True
)