import 'package:flutter/material.dart';

var data=[];
var alldata=[];
var idAndCount=[];

class MyProvider extends ChangeNotifier
{
  void addDataToCart(input){
    alldata.add(input);
    for (int i=0;i<data.length;i++)
      {
        if(input==data[i])
          {
            break;
          }
        if(i==data.length-1)
          {

            data.add(input);
          }
      }
    if(data.length==0)
      data.add(input);

    notifyListeners();
  }
  void countCartData(){
    idAndCount=[];
    for(int i=0;i<data.length;i++)
      {
        idAndCount.add({'id':data[i],'count':0});
        for(int j=0;j<alldata.length;j++)
          {
            if(data[i]==alldata[j])
              {
                idAndCount[i]['count']++;
              }
          }
      }

  }
  void updateCartdatatoremove(input){
    for(int i=0;i<idAndCount.length;i++)
    {

      if(idAndCount[i]['id']==input)
      {
        idAndCount[i]['count']--;
        if(idAndCount[i]['count']==0)
          {
            idAndCount.removeAt(i);
            for(int m=0;m<data.length;m++)
            {
              if(data[m].toString()==input.toString())
              {
                data.removeAt(m);
                break;
              }
            }
          }
        for(int k=0;k<alldata.length;k++)
          {
            if(alldata[k].toString()==input.toString())
              {
                alldata.removeAt(k);
                break;
              }
          }

        break;
      }
    }
    print(idAndCount);
  }
  void updateCartdatatoadd(input){
    for(int i=0;i<idAndCount.length;i++)
    {

      if(idAndCount[i]['id']==input)
      {
        idAndCount[i]['count']++;
        for(int k=0;k<alldata.length;k++)
        {
          if(alldata[k].toString()==input.toString())
          {
            alldata.add(alldata[k]);
            break;
          }
        }
        break;
      }
    }
  }
  void deleteAllCartData(){
    for(int i=0;i<idAndCount.length;i++)
    {

      idAndCount.removeAt(i);
    }
  }
  GetCartData(){
    print(idAndCount);
    return idAndCount;
  }




}