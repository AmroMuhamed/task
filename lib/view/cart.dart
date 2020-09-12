
import 'dart:math';
import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:random_color/random_color.dart';
import 'package:task/Utils/DummyData.dart';
import 'package:task/provider/provider_user_cart.dart';
import 'package:task/view/home_screen.dart';

import 'check_out.dart';

class myCart extends StatefulWidget{

  myCartState createState() => myCartState();
}

class myCartState extends State<myCart>
{
  GlobalKey<ScaffoldState> _scKey=GlobalKey<ScaffoldState>();
  double Mapd=0;
  var mydata;
  var produc_list;
  int length;
  bool selected=false;


  Future getData () async {

    produc_list=await DummyData().myData();

    setState(() {
      selected=true;


    });

  }
  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var my_height =
        MediaQuery.of(context).size.height;
    var my_width =
        MediaQuery.of(context).size.width;

    // TODO: implement build
    return ChangeNotifierProvider(

        create: (context)=>MyProvider(),

    child: Scaffold(
        key: _scKey,
        bottomNavigationBar:
        SizedBox(
            height: my_height*6.75/100,
            child: Container(
              alignment: Alignment.center,
              color: Hexcolor('#008080'),
              child:InkWell(

                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => checkOut()),
                  );
                },
                child: Text("Proceed to checkout",style: TextStyle(color: Colors.white),),
              )
            )
        ),
        body:
        selected? Consumer<MyProvider>(builder: (context,data,widget){
          mydata=Provider.of<MyProvider>(context,listen: false).GetCartData();
          double total=0;
          for(int i=0;i<mydata.length;i++)
            {
              for (int j=0;j<produc_list.length;j++)
              {
                if(mydata[i]['id']==produc_list[j]['id'])
                {
                  total+=double.parse(produc_list[j]['price'])*mydata[i]['count'];
                }
              }
            }
    return Stack(
          children: [
            Container(
              color:  Colors.grey.withOpacity(.3),
              height: double.infinity,
              width: double.infinity,

            ),
            Padding(
                padding: EdgeInsets.only(top: 40,left: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: Colors.black87,
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                    ),
                    Text("Your Cart",style: TextStyle(color: Colors.black87),),
                    Expanded(
                      child:  Stack(
                        alignment: AlignmentDirectional.centerEnd,
                        children: [

                          Padding(
                            child:   IconButton(icon: Icon(Icons.shopping_cart),onPressed: (){},),
                            padding: EdgeInsets.only(right: 20),
                          ),
                          Padding(
                            child:  Container(
                              alignment: Alignment.center,
                              child: Text('${mydata.length}',style: TextStyle(color: Colors.white),),
                              height:my_height*3.37/100,
                              width: my_width*5.20/100,
                              decoration: BoxDecoration(
                                color: Colors.black87,
                                shape: BoxShape.circle,
                              ),
                            ),
                            padding: EdgeInsets.only(right: 15),
                          ),


                        ],
                      ),
                    )
                  ],
                )

            ),
            Padding(
              padding: EdgeInsets.only(top: my_height*16.89/100,left: 15,right: 15),
              child:Container(
                height: my_height*9.29/100,
                width: double.infinity,
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child:  Row(
                          children: [
                            Expanded(
                              child:
                              Text("Total item",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),),
                            ),
                            Text("Total Price",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child:
                            Text("${mydata.length}",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),),
                          ),
                          Text("${total}",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),),
                        ],
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
              child:Container(
                height: my_height*42.22/100,
                width: double.infinity,
                alignment: Alignment.center,
                child:ListView.builder(
                    itemCount:mydata.length,
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.only(right: 5),
                    //3dd l column
                    itemBuilder: (BuildContext context, int index) {

                      return  Padding(
                        padding: EdgeInsets.only(right: 25,left: 25,top: 10),
                        child: Container(
                          height: my_height*20.27/100,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                               Container(
                                  height: my_height*16.89/100,
                                  width: my_width*39.06/100,
                                  child:
                                  Image.asset(produc_list[int.parse(mydata[index]['id'])-1]['image'],fit: BoxFit.contain,),
                                ),
                               Expanded(
                                 child: Column(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Text(produc_list[int.parse(mydata[index]['id'])-1]['type'],style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),),
                                     Text(produc_list[int.parse(mydata[index]['id'])-1]['wt'],style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),),
                                     Text('${produc_list[int.parse(mydata[index]['id'])-1]['price']} LE',style: TextStyle(color: Colors.black87),),
                                     Padding(
                                       padding: EdgeInsets.only(top: 10),

                                       child: Row(
                                         mainAxisAlignment: MainAxisAlignment.center,
                                         children: [
                                           InkWell(child:Container(
                                             height: 20,
                                             width: 20,
                                             alignment: Alignment.center,
                                             color:  Hexcolor('#008080').withOpacity(.5),
                                             child: Text("-"),
                                           ),
                                             onTap: (){
                                             setState(() {

                                               Provider.of<MyProvider>(context,listen: false).updateCartdatatoremove(mydata[index]['id']);
                                               Provider.of<MyProvider>(context,listen: false).countCartData( );
                                               mydata=Provider.of<MyProvider>(context,listen: false).GetCartData();

                                             });
                                             },),
                                           Container(
                                             height: 20,
                                             width: 20,
                                             alignment: Alignment.center,
                                             color:  Hexcolor('#008080'),
                                             child: Text(mydata[index]['count'].toString()),
                                           ),
                                           InkWell(child:  Container(
                                             height: 20,
                                             width: 20,
                                             alignment: Alignment.center,
                                             color:  Hexcolor('#008080').withOpacity(.5),
                                             child: Text("+"),
                                           ),
                                             onTap: (){
                                             setState(() {


                                               Provider.of<MyProvider>(context,listen: false).updateCartdatatoadd(mydata[index]['id']);
                                               Provider.of<MyProvider>(context,listen: false).countCartData( );
                                               mydata=Provider.of<MyProvider>(context,listen: false).GetCartData();

                                             });
                                             },),



                                         ],
                                       ),
                                     ),
                                   ],
                                 ),
                               ),

                            ],
                          ),

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(5.0)) ,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 1,
                              ),
                            ],

                          ),
                        ),
                      );
                    }
                ),



              ),

            ),
            Padding(
              padding: EdgeInsets.only(top: my_height*77.32/100,left: 15,right: 15),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [InkWell(
                      child: Container(
                        height:my_height*5.06/100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Hexcolor('#008080'),
                          borderRadius: BorderRadius.all(
                              Radius.circular(10.0) //
                          ),
                        ),
                        child: Text("Remove all",style: TextStyle(color: Colors.white),),

                        alignment: Alignment.center,
                      ),
                      onTap: (){
                        setState(() {

                          Provider.of<MyProvider>(context,listen: false).deleteAllCartData( );
                        });
                      },
                    ),],
                  ),
                  Row(
                    children: [InkWell(
                      child: Padding(
                        padding: EdgeInsets.only(top: 5),
                        child:  Container(
                          height: my_height*5.06/100,
                          width: my_width*43.5/100,
                          decoration: BoxDecoration(
                            color: Hexcolor('#008080'),
                            borderRadius: BorderRadius.all(
                                Radius.circular(10.0) //
                            ),
                          ),
                          child: Text("Continue Shopping",style: TextStyle(color: Colors.white),),

                          alignment: Alignment.center,
                        ),
                      ),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => homeScreen()),
                        );
                      },
                    ),],
                  ),



                ],
              ),

            ),
          ],
        );}):Center(
    child: SpinKitThreeBounce(
    color: Hexcolor('#181616'),
    size: 50.0,
    ),
    )));
  }

}