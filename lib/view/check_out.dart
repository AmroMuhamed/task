
import 'dart:math';
import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:random_color/random_color.dart';

class checkOut extends StatefulWidget{

  checkOutState createState() => checkOutState();
}

class checkOutState extends State<checkOut>
{
  GlobalKey<ScaffoldState> _scKey=GlobalKey<ScaffoldState>();
  double Mapd=0;


  @override
  Widget build(BuildContext context) {
    var my_height =
        MediaQuery.of(context).size.height;
    var my_width =
        MediaQuery.of(context).size.width;

    // TODO: implement build
    return Scaffold(
        key: _scKey,
        bottomNavigationBar:
        SizedBox(
            height:my_height*6.75/100,
            child: Container(
                alignment: Alignment.center,
                color: Hexcolor('#008080'),
                child:InkWell(

                  onTap: (){},
                  child: Text("Proceed",style: TextStyle(color: Colors.white),),
                )
            )
        ),
        body: Stack(
          children: [
            Container(
              color:  Colors.grey.withOpacity(.3),
              height: double.infinity,
              width: double.infinity,

            ),

            Padding(
                padding: EdgeInsets.only(top: 40,left: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: Colors.black87,
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                    ),
                    Text("Check out",style: TextStyle(color: Colors.black87),),

                  ],
                )

            ),
            Padding(
              padding: EdgeInsets.only(top: my_height*16.89/100 ,left: 15,right: 15),
              child:Container(
                height: my_height*15.20/100,
                width: double.infinity,
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(10  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              Text("Address",style: TextStyle(fontWeight: FontWeight.bold),),
                              Text("15/33"),
                              Text("cairo,egypt"),
                              Text("Ain shams"),
                            ],
                          ),
                        ),
                        ),

                      InkWell(
                        child: Container(
                          height: my_height*5.06/100,
                          width: my_width*26.04/100,
                          decoration: BoxDecoration(
                            color: Hexcolor('#008080'),
                            borderRadius: BorderRadius.all(
                                Radius.circular(10.0) //
                            ),
                          ),
                          child: Text("Change",style: TextStyle(color: Colors.white),),

                          alignment: Alignment.center,
                        ),
                        onTap: (){},
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                      Radius.circular(10.0)) ,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                    ),
                  ],

                ),
              ),

            ),
            Padding(
              padding: EdgeInsets.only(top: my_height*33.78/100,left: 15,right: 15),
              child:InkWell(
                child: Container(
                  height: my_height*5.06/100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Hexcolor('#008080'),
                    borderRadius: BorderRadius.all(
                        Radius.circular(10.0) //
                    ),
                  ),
                  child: Text("Add address",style: TextStyle(color: Colors.white),),

                  alignment: Alignment.center,
                ),
                onTap: (){},
              ),

            ),
          ],
        )
    );
  }

}