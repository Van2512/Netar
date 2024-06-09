import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class RestClient {
  List record = [];
  Future<void> imageformdb()async{
    try{
      String uri = "http://192.168.1.2/detar/viewimage.php";
      var response = await http.post(Uri.parse(uri));
      record = jsonDecode(response.body);
    }catch(e){
      print(e);
    }
  }
  Future<void> deteteData(String id)async{
    try{
      String uri = "http://192.168.1.2/detar/delete_data.php";
      var res = await http.post(Uri.parse(uri),body:{ "id":id});
      var response = jsonDecode(res.body);
      if (response["success"]=="true"){
        print("Record updated with ID: $id");
        print("record deleted");
        imageformdb();
      }else{
        print("some issue");
      }
    }catch(e){
      print(e);
    }
  }

}