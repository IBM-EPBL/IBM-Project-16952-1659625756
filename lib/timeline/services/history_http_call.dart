import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:ledgerfe/timeline/services/expense_data.dart';
import 'dart:convert';

import 'package:ledgerfe/timeline/services/pie_data.dart';

class GetHistory
{
  final String resource='expense';
  final String token='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiI4OWE5NWMyNi1mMTIwLTRmMzMtODQ3Ny0wMTk1ZWVmZDEyMjUiLCJ1aWQiOiJkZGVlYjM5NS1jNzk5LTQ0YjAtOWQxNS05YjBhM2Q3MTNhZmUiLCJleHAiOjE2NzExNTQ2MDR9.EmURVkGo-xAg33WxMtZ5tG8eFETnX9CqZFRPJg4FXPQ';
  final int from;
  final int to;
  GetHistory({required this.from, required this.to});
  Future<Map<String,dynamic>> history() async
  {
    Map<String, String> header = {
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Authorization': "Bearer $token",
      'from': "$from",
      'to': "$to"
    };
    http.Response response = await http.get(Uri.parse("http://192.168.0.143:5000/$resource"),headers: header);
    if(response.statusCode==200)
    {
      Map<String,dynamic> responseMap=json.decode(json.decode(response.body));
      //print(responseMap);
      List<Map<String,dynamic>> result=List<Map<String,dynamic>>.from(responseMap["result"]);
      Map<String, double> perTag={
        "food": 0,
        "transport": 0,
        "apparel": 0,
        "education": 0,
        "social_life": 0,
        "culture": 0,
        "beauty": 0,
        "gift": 0,
        "self_development": 0,
        "household": 0,
        "health": 0,
        "other": 0
      };
      double sum=0;
      for(int i=0;i<result.length;i++){
        sum+=result[i]["amount"];
        perTag[result[i]["tag"]]=perTag[result[i]["tag"]]! + result[i]["amount"];
      }
      List<double> piePercent=[];
      for(String k in perTag.keys){
        piePercent.add(((perTag[k]!/sum)*100).roundToDouble());
      }
      PieData fetechedPieData=PieData(percent: piePercent);
      List<ExpenseData> fetchedExpenseData=[];
      for(int i=0;i<result.length;i++){
        fetchedExpenseData.add(ExpenseData(tag: result[i]["tag"], amount: result[i]["amount"], time: result[i]["time"],remarks:result[i]["remarks"]));
      }
      Map<String,dynamic> fetchedValues={"result":"OK","expenseData": fetchedExpenseData, "pieData": fetechedPieData,"total":sum};
      if(kDebugMode){
        print(fetchedValues);
      }
      return fetchedValues;
    }
    return {"result":"Error"};
  }
}