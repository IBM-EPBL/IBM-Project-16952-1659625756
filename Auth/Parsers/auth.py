from flask_restful import reqparse

logParse=reqparse.RequestParser()

logParse.add_argument(
    "Authorization",type=str,location="headers",required=True
)