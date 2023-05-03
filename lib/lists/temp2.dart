import 'package:flutter/material.dart';
import 'package:flutter_app/comms/localdb.dart' as db;
import 'package:flutter_app/globals.dart' as globals;
import 'package:flutter_app/mine/index.dart' as mine;
import 'package:flutter_app/mores/index.dart' as mores;
import 'package:cached_network_image/cached_network_image.dart';

/// tab page and tab views
/// every card in grid view

const double PROD_IMG_WIDTH = 166;
const double PROD_IMG_HEIGHT = 116.2;
final double txtSize = 16;
Widget perCard2(int index, String imgUrl2, List prods,Function onAdd,BuildContext context){
  final imgUrl = imgUrl2 + prods[index]['img'];
  var priceOld = prods[index]['priceOld'];
  var priceNew = prods[index]['priceNew'];
  return Container(
//    decoration: BoxDecoration(
//        border: Border.all()
//    ),
    child: Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 15,right: 15),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child:  Opacity(opacity: 0.69,
                  child: CachedNetworkImage(
                    width: double.infinity,
                    height: double.infinity,
                    placeholder: Center(
                      child: Image.asset(
                        'assets/images/food@2x.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    imageUrl: imgUrl,
                  ),
                )
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('  '+db.food[index]['name'],
                        style: TextStyle(fontSize: txtSize)),
                    Image.asset(
                      'assets/images/add_prod@2x.png',
                      width: 20,
                      height: 18,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(padding: EdgeInsets.only(top: 3),child: Text(
                  '原价￥' + priceOld.toString() + '   会员价￥' + priceNew.toString(),
                  style: TextStyle(color: Colors.green, fontSize: txtSize),
                ),)
              )
            ],
          ),
        ),
        Positioned(
          bottom: 55,
          right: 15,
          child: Opacity(opacity: 0.618, child: Container(

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.grey[300]
              ),
              child: Padding(padding: EdgeInsets.only(
                  left: 3.0, right: 3.0, top: 2, bottom: 2),
                child: Text('库存30'),
              )
          ),),
        ),
        Positioned(
          bottom: 10,
          right: 0,
          child: Opacity(opacity: 0,
            child: GestureDetector(
              onTapDown: (TapDownDetails d){onAdd(d,context);},
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all()
                ),
                height: 50,
                width: 50,

              ),
            ),
          )
        )
      ],
    ),
  );
}

Widget perCard(int index, String imgUrl2, List prods,Function onAdd,BuildContext context){
  final imgUrl = imgUrl2 + prods[index]['img'];
  var priceOld = prods[index]['priceOld'];
  var priceNew = prods[index]['priceNew'];
  return Container(
//    decoration: BoxDecoration(
//        border: Border.all()
//    ),
    child: Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 15,right: 15),
          child: Column(
            children: <Widget>[
              Expanded(
                  flex: 5,
                  child:  Opacity(opacity: 0.69,
                    child: CachedNetworkImage(
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: Center(
                        child: Image.asset(
                          'assets/images/food@2x.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      imageUrl: imgUrl,
                    ),
                  )
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('  '+db.food[index]['name'],
                        style: TextStyle(fontSize: txtSize)),
                    Image.asset(
                      'assets/images/add_prod@2x.png',
                      width: 20,
                      height: 18,
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Padding(padding: EdgeInsets.only(top: 3),child: Text(
                    '原价￥' + priceOld.toString() + '   会员价￥' + priceNew.toString(),
                    style: TextStyle(color: Colors.green, fontSize: txtSize),
                  ),)
              )
            ],
          ),
        ),
        Positioned(
          bottom: 55,
          right: 15,
          child: Opacity(opacity: 0.618, child: Container(

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.grey[300]
              ),
              child: Padding(padding: EdgeInsets.only(
                  left: 3.0, right: 3.0, top: 2, bottom: 2),
                child: Text('库存30'),
              )
          ),),
        ),
        Positioned(
            bottom: 10,
            right: 0,
            child: Opacity(opacity: 0,
              child: GestureDetector(
                onTapDown: (TapDownDetails d){onAdd(d,context,index);},
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all()
                  ),
                  height: 50,
                  width: 50,

                ),
              ),
            )
        )
      ],
    ),
  );
}


List<Widget> allCards(List prods, String imgUrl,Function onAdd,BuildContext context) {
  var cards = <Container>[];
  //print(prods.length);
  for (var i = 0; i < prods.length; i++) {
    cards.add(perCard(i, imgUrl, prods,onAdd,context));
  }
  return cards;
}

List<Widget> foodGridViewsInit(BuildContext context, VoidCallback scrollDown,
    VoidCallback scrollUp,Function onAdd) {
  var views = <Widget>[];
  var foodMenu = globals.menuFood;
  var sc = ScrollController();
  sc.addListener(() {
    var direction = sc.position.userScrollDirection.index;
//    // 2 is scroll down
//    if (direction == 2){
//      scrollDown();
//    } else if (direction == 1){
//      if (sc.offset - sc.position.minScrollExtent < 10) {
//        scrollUp();
//      }
//    }

    //检测是否到底
    if ((sc.position.maxScrollExtent - sc.offset < 20) ||
        (globals.adImgHeight == 130 && direction == 2)) {
      scrollDown();
    }
    //检测是否到顶
    if (sc.offset - sc.position.minScrollExtent < 20) {
      scrollUp();
    }

  });
  for (var i = 0; i < foodMenu.length; i++) {
    var tv = allCards(foodMenu[i], db.foodUrl,onAdd,context);
    views.add(
      GridView.builder(
          controller: sc,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 1.8
          ),
          itemCount: foodMenu[i].length,
          itemBuilder: (context, index) {
           return tv[index];
          }),
    );
  }
  return views;
}

List<Widget> marketGridViewsInit(BuildContext context,Function onAdd) {
  var views = <Widget>[];
  var marketMenu = globals.menuMarket;
  for (var i = 0; i < marketMenu.length; i++) {
    var tv = allCards(marketMenu[i], db.marketUrl,onAdd,context);
    views.add(
      GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 1.8
          ),
          itemCount: marketMenu[i].length,
          itemBuilder: (context, index) {
            return tv[index];
          }),
    );
  }
  return views;
}
// animate add shop image


// my Cart
Widget myCart(int shoppingCount,BuildContext context) {
  // 305 470
  return Positioned(
      bottom: 30,
      right: 20,
      child: Opacity(opacity: 0.618,
          child: GestureDetector(
            onTap: (){print(123);Navigator.pushNamed(context, '/lists/cart');},
            //onTapDown: (detail){print(detail.globalPosition.dx.toString() + '  '+detail.globalPosition.dy.toString());Navigator.pushNamed(context, '/lists/cart');},
            child: Stack(
              children: <Widget>[
                Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(27)
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/images/cart@2x.png', width: 40, height: 27,),
                    )
                ),
                Positioned(
                  top: 5,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.red[900],
                    child: Text(shoppingCount.toString(), style: TextStyle(fontSize: 14),),
                    radius: 10,
                  ),
                ),
              ],
            ),
          )
      )
  );
}
//tab views

Widget myTabView(int currentIndex, TabController foodTabC,
    TabController marketTabC,
    BuildContext context,
    VoidCallback scrollDown, VoidCallback scrollUp,Function onAdd,
    bool vFlag,double addImgLeft,double addImgTop
    ) {
  var tabBarViews = [
    Stack(
      children: <Widget>[
        TabBarView(
          controller: foodTabC,
          children: foodGridViewsInit(context, scrollDown, scrollUp,onAdd),
        ),
        //myAnimateAdd(vFlag: vFlag,addImgleft: addImgLeft,addImgTop: addImgTop),
        //myCart(),
      ],
    ),
    TabBarView(
      controller: marketTabC,
      children: marketGridViewsInit(context,onAdd),
    ),
    mores.Mores(),
    mine.mines()
  ];
  return tabBarViews[currentIndex];
}
