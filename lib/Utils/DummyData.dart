import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:flutter/cupertino.dart';
class DummyData{

  var produc_list;
  Future<String> loadAStudentAsset() async {
    return await rootBundle.loadString('android/MyData.json');
  }
  Future loadCrossword() async {
    produc_list = json.decode(await loadAStudentAsset());

  }




  myData() async{
    await loadCrossword();
    return produc_list;
  }



}