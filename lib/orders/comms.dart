import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart' as en_words;
import 'dart:math';

List<String> addWord2List(){
  var wordLists = <String>[];
  for(var i=0;i<10;i++){

    wordLists.add(en_words.WordPair.random().asCamelCase);
  }
  return wordLists;
}


Widget ordersList({Function func,int index,List<String> wordLists,BuildContext context}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      GestureDetector(
        onTap: (){func(index,context);},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10),
            ),
            Expanded(
              flex: 3,
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    height: 40,
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            color: Colors.green, shape: BoxShape.circle),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        wordLists[index],
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      Text(
                        '123',
                        style: TextStyle(fontSize: 10, color: Colors.black),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        '以及支付'+'  ',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      Image.asset(
                        'assets/images/order_detail@2x.png',
                        width: 30,
                        height: 20,
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      '￥2.00',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  )

                ],
              ),
            )
          ],
        ),
      ),
      Divider(indent: 10,color: Colors.grey,)
    ],
  );
}

// popup item detail

Container perDetail(){
  return Container(
    height: 70,
    margin: EdgeInsets.only(left: 10,right: 10),
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Colors.grey))
    ),
    child: Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text('【午餐】红烧牛肉',style: TextStyle(fontSize: 15,color: Colors.grey),),
              Text('×1',style: TextStyle(fontSize: 15,color: Colors.grey),)
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '  单价：￥2.00\n  2018-11-20 12:30:00'
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset('assets/images/refund@2x.png',width: 30,height: 20,),
                    Image.asset('assets/images/reminders@2x.png',width: 30,height: 20,),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}

class ItemDetail extends StatefulWidget {
  final int itemCount;
  ItemDetail({this.itemCount}) ;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ItemDetail();
  }
}

class _ItemDetail extends State<ItemDetail>{

  var items = <Container>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(var i=0;i<widget.itemCount;i++){
      items.add(perDetail());
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[

        Expanded(
          flex: 2,
          child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context,index){
                return items[index];
              }
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(padding: EdgeInsets.only(top: 20),
            child: ListView.builder(
                itemCount: 4,
                itemBuilder: (a,b){
                  return Padding(
                    padding: EdgeInsets.only(left: 20,right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('总金额：',style: TextStyle(fontSize: 15,color: Colors.grey),),
                        Text('￥2.00',style: TextStyle(fontSize: 15,color: Colors.grey),)
                      ],
                    ),
                  );
                }
            ),
          )
        )
      ],
    );
  }
}

Future<void> showDetails(BuildContext context) async {

  switch (

  await showDialog(
      context: context,
      builder: (BuildContext context){

        return SimpleDialog(
          title:  Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/images/address@2x.png',width: 20,height: 20,),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text('配送地址： 2东1024号',style: TextStyle(fontSize: 20,color: Colors.black),),
                  ),
                ],
              ),
              Divider(color: Colors.grey,)
            ],
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          children: <Widget>[
            //ItemDetail(itemCount: Random().nextInt(4),),

            Container(
              height: 270,
              child: ItemDetail(itemCount: Random().nextInt(6)),
            ),
            
//            Expanded(
//              flex: 1,
//              child: GestureDetector(
//                  onTap: (){Navigator.pop(context,0);},
//                  child: Text('abc'),
//                  child: Center(
//                    child: Container(
//                        margin: EdgeInsets.only(top: 20),
//                        decoration: BoxDecoration(
//                          border: Border.all(color: Colors.grey[300]),
//
//                        ),
//                        width: 150,
//                        height: 40,
//                        child: Center(
//                          child: Text('确  定',style: TextStyle(fontSize: 20),),
//                        )
//
//                    ),
//                  )
//              ),
//            )

          ],
        );
      }
  )
  ){
    case 0:
      {

      }
      break;
    case 1:
      {

      }
      break;
    default:{

    }
    break;
  }
}