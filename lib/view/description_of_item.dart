
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:task/Utils/DummyData.dart';
import 'package:task/provider/provider_user_cart.dart';
import 'dart:math' as math;
import 'package:toast/toast.dart';

import 'package:task/view/cart.dart';

class descScreen extends StatefulWidget{

  var id;
  var myColor;
  descScreen(this.id,this.myColor);

  descScreenState createState() => descScreenState();
}

class descScreenState extends State<descScreen>
{
  GlobalKey<ScaffoldState> _scKey=GlobalKey<ScaffoldState>();

  bool check=false;
  bool selected=false;
  var produc_list;

  var item=[];

  Future getData () async {

    produc_list=await DummyData().myData();

    setState(() {
      selected=true;
      for(int i=0;i<produc_list.length;i++)
      {
        if(widget.id==produc_list[i]['id'])
        {
          item.add(produc_list[i]);
          break;
        }
      }

    });
  }
  @override
  void initState() {

      getData();


    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color mycolor=widget.myColor;
    var my_height =
        MediaQuery.of(context).size.height;
    var my_width =
        MediaQuery.of(context).size.width;

    // TODO: implement build
    return ChangeNotifierProvider(
      create: (context)=>MyProvider(),
      child:  Scaffold(

          body: Consumer<MyProvider>(builder: (context,data,widget){
    return

      selected?  Stack(
            children: [
              Container(
                color:  Colors.grey.withOpacity(.3),
                height: double.infinity,
                width: double.infinity,

              ),
              Container(
                alignment: Alignment.center,
                height:  my_height*42.22/100,
                decoration: BoxDecoration(
                  color: mycolor,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(200.0),bottomLeft: Radius.circular(200.0)) ,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                    ),
                  ],

                ),
                child: Padding(
                    padding: EdgeInsets.only(top: 40,left: 9),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_back),
                              color: Colors.white,
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                            ),
                            Expanded(
                              child:  Padding(
                                padding: EdgeInsets.only(left: 10),
                                child:
                                Text(item[0]['type'],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                              ),
                            )

                          ],
                        ),
                        Container(
                          height:  my_height*21.95/100,
                          child: Image.asset(item[0]['image'],fit: BoxFit.fill,),
                        ),
                      ],
                    )

                ),
              ),
              Padding(
                padding: EdgeInsets.only(top:  my_height*42.22/100,),
                child: ListView(

                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20,right: 10),
                        child:
                        Row(

                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child:
                              Text(item[0]['wt'],style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),),
                            ),
                            IconButton(
                              icon: Icon(Icons.add_shopping_cart),
                              onPressed: (){
                                Toast.show("Added to Cart",context,duration: Toast.LENGTH_SHORT,gravity: Toast.BOTTOM);
                                Provider.of<MyProvider>(context,listen: false).addDataToCart(item[0]['id']);
                                Provider.of<MyProvider>(context,listen: false).countCartData( );

                                },
                            ),

                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 20,right: 10),
                        child:Row(
                          children: [
                            Expanded(
                              child:
                              Text('${item[0]['price']} LE',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),),

                            )
                            ,
                            IconButton(
                              icon: check?  Icon(Icons.turned_in): Icon(Icons.turned_in_not),
                              onPressed: (){
                                setState(() {
                                  if(check==true)
                                  {
                                    check=false;
                                    Toast.show("Removed from favorites",context,duration: Toast.LENGTH_SHORT,gravity: Toast.BOTTOM);
                                  }
                                  else
                                  {
                                    Toast.show("Added to favorites",context,duration: Toast.LENGTH_SHORT,gravity: Toast.BOTTOM);

                                    check=true;
                                  }

                                });
                              },
                            )
                          ],
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 20,right: 20,left: 20,bottom: 5),
                          child:Container(
                            alignment: Alignment.centerLeft,
                            child:  Text("Description",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                          )
                      ),
                      Padding(
                          padding: EdgeInsets.only(right: 20,left: 20,bottom: 5),
                          child:Container(
                            alignment: Alignment.centerLeft,
                            child:  Text(item[0]['desc'],style: TextStyle(),textAlign: TextAlign.start,),
                          )
                      ),
                      Padding(
                          padding: EdgeInsets.only(right: 20,left: 20,bottom: 5),
                          child:Container(
                            alignment: Alignment.centerLeft,
                            child:  Text("Manufacturing Details",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                          )
                      ),
                      Padding(
                          padding: EdgeInsets.only(right: 20,left: 20,bottom: 10),
                          child:Container(
                            alignment: Alignment.centerLeft,
                            child:  Text(item[0]['details'],style: TextStyle(color: Colors.black87 ),textAlign: TextAlign.start,),
                          )
                      ),
                    ],
                  )
                ,

              )


            ],
          ):Center(
            child: SpinKitThreeBounce(
            color: Hexcolor('#181616'),
            size: 50.0,
            ),
            );}),
      ),
    );
  }

}