import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_app/comms/commWidget.dart' as cw;

final String normalImg = 'assets/images/discount-3.png';
final String unNormalImg = 'assets/images/discount-expired-3.png';



Widget listItem(int expiredFlag,int index){
  return Padding(
    padding: EdgeInsets.only(left: 15,right: 15,top:30),
    child: Container(
      height: 100,
      decoration: BoxDecoration(
        image: DecorationImage(image: Image.asset(expiredFlag == 0 ? unNormalImg : normalImg).image)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.only(top: 15,left: 15,bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('代金卷'+index.toString(),style: TextStyle(color: Color(0xff89d40c),fontSize: 25),),
                  Text('有效期至',style: TextStyle(color: Color(0xff89d40c),fontSize: 15),),
                  Text('仅限餐饮有效，满10元可用',style: TextStyle(color: Colors.grey,fontSize: 15),)
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(top: 10,right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[

                      Text('￥',style: TextStyle(color: Color(0xff89d40c),fontSize: 20),),
                      Text('123',style: TextStyle(color: Color(0xff89d40c),fontSize: 25),)
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: 30,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xff89d40c)
                    ),
                    child: Center(
                      child: Text('去使用',style: TextStyle(color: Colors.white,fontSize: 15),),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

class Discount extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Discount();
  }
}

class _Discount extends State<Discount> {
  var _lists=<Widget>[];
  void _addItems(int startIndex){
    for(var i=startIndex;i<startIndex+10;i++){
      _lists.add(listItem(math.Random().nextInt(2), i));
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(var i=0;i<10;i++){
      _lists.add(listItem(math.Random().nextInt(2), i));
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: cw.myAppBar(title: '优惠卷列表'),
      body: ListView.builder(
        itemBuilder: (context,index){
          if(index >= _lists.length-1){
            _addItems(_lists.length);
          }
          return _lists[index];
        },
      )
    );
  }
}