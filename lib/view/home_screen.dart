
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:task/view/cart.dart';

import 'items_screen.dart';

class homeScreen extends StatefulWidget{

  homeScreenState createState() => homeScreenState();
}

class homeScreenState extends State<homeScreen>
{

  GlobalKey<ScaffoldState> _scKey=GlobalKey<ScaffoldState>();

  var images=['images/sh1.png','images/oil1.png','images/bis1.png','images/fri1.png','images/mob1.png'];
  var names=['Shampoo','Oil','Biscuits','Fridge','Mobile'];
  var orders=[{'order':'order1','image':'images/shep1.png','price':'20 LE','type':'chipsy','wt':'1Kg'},

    {'order':'order2','image':'images/pepsi.png','price':'10 LE','type':'pepsi Can','wt':'1L'}];

  var sendItem;
  var sendphoto;

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => itemsScreen(sendItem,sendphoto),
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



  @override
  Widget build(BuildContext context) {
    var my_height =
        MediaQuery.of(context).size.height;
    var my_width =
        MediaQuery.of(context).size.width;

    // TODO: implement build
    return Scaffold(
      key: _scKey,
      drawer:Container(
        width: my_width*60/100,
        child: Drawer(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  color:   Hexcolor('#008080'),
                  height: double.infinity,
                  width: double.infinity,
                ),

                ListView(

                  children: <Widget>[
                    InkWell(
                      child: ListTile(
                          title: Text('Company',style: TextStyle(color: Colors.white),),
                          leading: IconButton(icon: Icon(Icons.exit_to_app),color: Colors.white,onPressed: (){
                            Navigator.of(context).pop(context);
                          },)
                      ),
                      onTap: () {
                        Navigator.of(context).pop(context);
                      },
                    ),
                    InkWell(
                      child: ListTile(
                          title: Text('01222533044',style: TextStyle(color: Colors.white),),
                          leading: IconButton(icon: Icon(Icons.phone),color: Colors.white,onPressed: (){

                          },)
                      ),
                      onTap: () {

                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10,left: 10),
                      child: Divider(
                        color: Colors.white,
                        height: 3,
                      ),
                    ),
                    InkWell(
                      child: ListTile(
                          title: Text('My Wallet',style: TextStyle(color: Colors.white),),
                          leading: IconButton(icon: Icon(Icons.account_balance_wallet),color: Colors.white,onPressed: (){

                          },)
                      ),
                      onTap: () {

                      },
                    ),
                    InkWell(
                      child: ListTile(
                          title: Text('My Orders',style: TextStyle(color: Colors.white),),
                          leading: IconButton(icon: Icon(Icons.toc),color: Colors.white,onPressed: (){

                          },)
                      ),
                      onTap: () {
                      },
                    ),
                    InkWell(
                      child: ListTile(
                          title: Text('Offers',style: TextStyle(color: Colors.white),),
                          leading: IconButton(icon: Icon(Icons.local_offer),color: Colors.white,onPressed: (){

                          },)
                      ),
                      onTap: () {

                      },
                    ),
                    InkWell(
                      child: ListTile(
                          title: Text('Refer',style: TextStyle(color: Colors.white),),
                          leading: IconButton(icon: Icon(Icons.refresh),color: Colors.white,onPressed: (){
                            Navigator.of(context).pop(context);
                          },)
                      ),
                      onTap: () {
                        Navigator.of(context).pop(context);
                      },
                    ),
                    InkWell(
                      child: ListTile(
                          title: Text('LogOut',style: TextStyle(color: Colors.white),),
                          leading: IconButton(icon: Icon(Icons.exit_to_app),color: Colors.white,onPressed: (){
                            Navigator.of(context).pop(context);
                          },)
                      ),
                      onTap: () {
                        Navigator.of(context).pop(context);
                      },
                    ),
                    InkWell(
                      child: ListTile(
                          title: Text('About us',style: TextStyle(color: Colors.white),),
                          leading: IconButton(icon: Icon(Icons.info),color: Colors.white,onPressed: (){

                          },)
                      ),
                      onTap: () {

                      },
                    ),
                    InkWell(
                      child: ListTile(
                          title: Text('Rate us',style: TextStyle(color: Colors.white),),
                          leading: IconButton(icon: Icon(Icons.rate_review),color: Colors.white,onPressed: (){
                            Navigator.of(context).pop(context);
                          },)
                      ),
                      onTap: () {
                        Navigator.of(context).pop(context);
                      },
                    ),
                    InkWell(
                      child: ListTile(
                          title: Text('Share',style: TextStyle(color: Colors.white),),
                          leading: IconButton(icon: Icon(Icons.share),color: Colors.white,onPressed: (){
                            Navigator.of(context).pop(context);
                          },)
                      ),
                      onTap: () {
                        Navigator.of(context).pop(context);
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10,left: 10),
                      child: Divider(
                        color: Colors.white,
                        height: 3,
                      ),
                    ),
                  ],
                ),
              ],
            )
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.grey.withOpacity(.3),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black87),

        title: Text("Company",style: TextStyle(
          color: Colors.black87,),),
        leading: IconButton(icon: Icon(Icons.sort),
          onPressed: (){
            _scKey.currentState.openDrawer();
          },),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search
            ),
            onPressed: (){},
            color: Colors.black87,
          ),
          IconButton(
            icon: Icon(
                Icons.add_alert
            ),
            onPressed: (){},
            color: Colors.black87,
          )
        ],
      ),
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
      body: Stack(
        children: [
          Container(
            color:  Colors.grey.withOpacity(.3),
            height: double.infinity,
            width: double.infinity,
            child: ListView(
              children: [
                Container(
                    height: my_height*45.6/100,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20,right: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child:
                                Text("Discover",style: TextStyle(fontWeight: FontWeight.w600),),
                              ),
                              Container(
                                height: my_height*3.3/100,
                                 width: my_width*17/100,
                                decoration: BoxDecoration(
                                  color: Hexcolor('#008080'),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10.0) //
                                  ),
                                ),
                                child: Text("see all",style: TextStyle(color: Colors.white),),

                                alignment: Alignment.center,
                              ),

                            ],
                          ),
                          Container(
                            height: my_height*15.2/100,
                            child:
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child:  Container(
                                child:  ListView.builder(
                                    itemCount: images.length,
                                    scrollDirection: Axis.horizontal,
                                    padding: EdgeInsets.only(right: 5),
                                    //3dd l column
                                    itemBuilder: (BuildContext context, int index) {

                                      return Padding(
                                          padding: EdgeInsets.only(right: 30,left: 1),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [

                                              InkWell(
                                                child:   Container(
                                                  child: Padding(
                                                    padding: EdgeInsets.all(5),
                                                    child: Image.asset(images[index]),
                                                  ),
                                                  height: my_height*11.82/100,
                                                  width: my_width*15.6/100,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    shape: BoxShape.circle,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey.withOpacity(0.5),
                                                        spreadRadius: 1,
                                                        blurRadius: 1,
                                                      ),
                                                    ],

                                                  ),


                                                ),
                                                onTap: (){
                                                  setState(() {
                                                    sendItem=names[index];
                                                    sendphoto=images[index];
                                                  });
                                                  Navigator.of(context).push(_createRoute());
                                                },
                                              ),


                                              Expanded(
                                                child:
                                                Text(names[index]),
                                              ),
                                            ],
                                          )

                                      );
                                    }
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Container(
                                  height: my_height*16.8/100,
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Image.asset('images/offer1.jpg'),
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
                              )
                          ),
                        ],
                      ),
                    )
                ),
                Container(
                    child: Padding(
                        padding: EdgeInsets.only(left: 20,right: 20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child:
                                  Text("Your previous orders",style: TextStyle(fontWeight: FontWeight.w600),),
                                ),
                                Container(
                                  height: my_height*3.3/100,
                                  width: my_height*13.02/100,
                                  decoration: BoxDecoration(
                                    color: Hexcolor('#008080'),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0) //
                                    ),
                                  ),
                                  child: Text("see all",style: TextStyle(color: Colors.white),),

                                  alignment: Alignment.center,
                                ),

                              ],
                            ),
                            Container(

                              height: my_height*32.78/100,


                              alignment: Alignment.center,
                              child:
                              Padding(
                                padding: EdgeInsets.only(top: 5),
                                child:  Container(
                                  alignment: Alignment.center,
                                  child:  GridView .builder(
                                      itemCount: orders.length,
                                      scrollDirection: Axis.vertical,
                                      padding: EdgeInsets.only(right: 5,left: 5),
                                      gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 4
                                          ,mainAxisSpacing: 5,childAspectRatio: .8  ),
                                      itemBuilder: (BuildContext context, int index) {

                                        return Container(
                                          alignment: Alignment.center,
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
                                          child: Padding(
                                              padding: EdgeInsets.only(right: 5,left: 5),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height: my_height*13.3/100,
                                                    child:
                                                    Image.asset(orders[index]['image']),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.only(left: 10),
                                                        child: Text(orders[index]['price'],style: TextStyle(fontWeight: FontWeight.bold),),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.only(left: 10),
                                                        child: Text(orders[index]['type'],style: TextStyle(fontWeight: FontWeight.bold),),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.only(left: 10),
                                                        child: Text(orders[index]['wt']),
                                                      )
                                                    ],
                                                  ),
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsets.only(right: 10),
                                                          child:
                                                          Container(
                                                            height: my_height*3.37/100,
                                                            width: my_width*13.02/100,
                                                            decoration: BoxDecoration(
                                                              color: Hexcolor('#008080'),
                                                              borderRadius: BorderRadius.all(
                                                                  Radius.circular(10.0) //
                                                              ),
                                                            ),
                                                            child: Text("Add+",style: TextStyle(color: Colors.white),),

                                                            alignment: Alignment.center,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),


                                                ],
                                              )

                                          )
                                        );
                                      }
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Container(
                                height: my_height*16.89/100,
                                width: double.infinity,
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Image.asset('images/offer2.jpg'),
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
                            )
                          ],
                        )
                    )
                ),
              ],
            ),
          )
        ],
      )
    );
  }

}