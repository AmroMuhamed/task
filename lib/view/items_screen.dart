
import 'dart:math';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:random_color/random_color.dart';
import 'package:task/Utils/DummyData.dart';
import 'package:task/provider/provider_user_cart.dart';
import 'package:toast/toast.dart';

import 'cart.dart';
import 'description_of_item.dart';
import 'home_screen.dart';

class itemsScreen extends StatefulWidget{

  var item ;
  var photo;

  itemsScreen(this.item,this.photo);

  itemsScreenState createState() => itemsScreenState();
}

class itemsScreenState extends State<itemsScreen>
{
  GlobalKey<ScaffoldState> _scKey=GlobalKey<ScaffoldState>();
  double Mapd=0;
  bool check=false;
  bool selected=false;

  var items=[];
  var produc_list ;


  Future getData () async {

    produc_list=await DummyData().myData();

    setState(() {
      selected=true;
      for(int i=0;i<produc_list.length;i++)
      {
        if(widget.item==produc_list[i]['name'])
          items.add(produc_list[i]);
      }

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
    var photo=widget.photo;
    var item=widget.item;
    var my_height =
        MediaQuery.of(context).size.height;
    var my_width =
        MediaQuery.of(context).size.width;

    // TODO: implement build
    return ChangeNotifierProvider(

        create: (context)=>MyProvider(),
    child:  Scaffold(
        key: _scKey,

      bottomNavigationBar: SizedBox(
          height: my_height*6.7/100,
          child: Container(
            color:  Colors.grey.withOpacity(.3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child:
                IconButton(
                  icon: Icon(
                      Icons.home
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => homeScreen()),
                    );
                  },
                  color: Colors.black87,
                ),),
                Expanded(child:
                IconButton(
                  icon: Icon(
                      Icons.shopping_cart
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => myCart()),
                    );
                  },
                  color: Colors.black87,
                ),),
                Expanded(child:
                IconButton(
                  icon: Icon(
                      Icons.turned_in
                  ),
                  onPressed: (){

                  },
                  color: Colors.black87,
                ),),
                Expanded(child:
                IconButton(
                  icon: Icon(
                      Icons.person
                  ),
                  onPressed: (){},
                  color: Colors.black87,
                ),),
              ],
            ),
          )
      ),
        body:  Consumer<MyProvider>(builder: (context,data,widget){
          return selected? Stack(
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
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Container(
                          height:  my_height*5.91/100,
                          width:  my_width*33.25/100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(10.0) //
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 1,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Image.asset(photo ,fit: BoxFit.contain,),
                                Text(item,style: TextStyle(color: Colors.black87),),
                              ],
                            ),
                          ),

                          alignment: Alignment.center,
                        ),
                      )
                    ),

                  ],
                )

            ),

            Padding(
              padding: EdgeInsets.only(top: 100,left: 5),
              child:
              Container(

                height: double.infinity,
                alignment: Alignment.center,
                child:
                Padding(
                  padding: EdgeInsets.only(top: 5,left: 20,right: 20),
                  child:  Container(
                    alignment: Alignment.center,
                    child:  GridView .builder(
                        itemCount: items.length,
                        scrollDirection: Axis.vertical,

                        padding: EdgeInsets.only(right: 5,left: 5,top: 5),

                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 20,mainAxisSpacing: 20
                        ,childAspectRatio: .65),
                        itemBuilder: (BuildContext context, int index) {

                          Color myColor=Color((math.Random().nextDouble() * 0xFF00FF).toInt()).withOpacity(1.0);
                          return  AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 400),
                            child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: myColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)) ,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 2,
                                        ),
                                      ],

                                    ),
                                    child: Padding(
                                        padding: EdgeInsets.only(right: 5,left: 5,top: Mapd,),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              child: Column(

                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height:  my_height*12.66/100,
                                                    child:
                                                    Padding(
                                                      padding: EdgeInsets.only(top: 5),
                                                      child:  Image.asset(items[index]['image']),
                                                    ),
                                                  ),
                                                  Container(
                                                    alignment: Alignment.centerLeft,
                                                    height:  my_height*5.66/100,
                                                    child:  Padding(
                                                      padding: EdgeInsets.only(left: 10),
                                                      child: Text(items[index]['type'],style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.only(left: 10),
                                                        child: Text(items[index]['wt'],style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.only(left: 10),
                                                        child: Text('${items[index]['price']} LE',style: TextStyle(color: Colors.white),),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              onTap: (){

                                                Route _createRoute() {
                                                  return PageRouteBuilder(
                                                    pageBuilder: (context, animation, secondaryAnimation) => descScreen(items[index]['id'],myColor),
                                                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                                      var begin = Offset(0.0, 1.0);
                                                      var end = Offset.zero;
                                                      var curve = Curves.linear;

                                                      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                                                      return SlideTransition(
                                                        position: animation.drive(tween),
                                                        child: child,
                                                      );
                                                    },
                                                  );
                                                }
                                                Navigator.of(context).push(_createRoute());
                                              },
                                            ),
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                      padding: EdgeInsets.only( bottom: 5),
                                                      child:
                                                      IconButton(icon: Icon(Icons.add_shopping_cart),color: Colors.white,onPressed: (

                                                          ){
                                                        Provider.of<MyProvider>(context,listen: false).addDataToCart(items[index]['id']);
                                                        Provider.of<MyProvider>(context,listen: false).countCartData( );
                                                        Toast.show("Added to Cart",context,duration: Toast.LENGTH_SHORT,gravity: Toast.BOTTOM);

                                                      },)
                                                  ),

                                                  Padding(
                                                      padding: EdgeInsets.only( bottom: 5),
                                                      child:
                                                      IconButton(icon: Icon(Icons.turned_in),color: Colors.white,onPressed: (){
                                                        setState(() {


                                                        });
                                                      })
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        )

                                    )
                                ),
                              ),
                            ),
                          );

                        }
                    ),
                  ),
                ),
              ),
            ),
          ],
        ):Center(
          child: SpinKitThreeBounce(
          color: Hexcolor('#181616'),
          size: 50.0,
          ),
          );}),
    ));
  }

}


