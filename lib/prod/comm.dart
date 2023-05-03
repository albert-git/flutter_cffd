import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_app/comms/localdb.dart';

final double cardHeight = 170;
final double txtSize = 18;

Container perCard(int imgIndex, BuildContext context) {
  final imgUrl = foodUrl + food[imgIndex]['img'];
  var priceOld = food[imgIndex]['priceOld'];
  var priceNew = food[imgIndex]['priceNew'];
  return Container(
      decoration:
      BoxDecoration(border: Border.all(color: Colors.blue, width: 1.0)),
      width: MediaQuery.of(context).size.width / 2,
      height: cardHeight,
      child: Column(
        children: <Widget>[
          Container(
            //decoration: BoxDecoration(border: Border.all(color: Colors.green,width: 1.0)),
//            child: Image.network(
//              imgUrl,
//              width: 166,
//              height: 111,
//            ),
            width: 167,
            height: 112,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 1.0),
                image: DecorationImage(
                    image: Image.network(
                      imgUrl,
                      width: 166,
                      height: 111,
                    ).image,
                    fit: BoxFit.cover)),
          ),
          Padding(
            padding: EdgeInsets.only(left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(food[imgIndex]['name'],style: TextStyle(fontSize: txtSize),),
                Image.asset(
                  'assets/images/add_prod@2x.png',
                  width: 20,
                  height: 18,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 5,right: 5,top: 5),
            child: Row(
              children: <Widget>[
                Text(
                  '原价￥' + priceOld.toString() + '  会员价￥' + priceNew.toString(),
                  style: TextStyle(color: Colors.green,fontSize: txtSize),
                )
              ],
            ),
          )
        ],
      ));
}

List<Container> allCards(BuildContext context) {
  var cards = <Container>[];
  for (var i = 0; i < 10; i++) {
    cards.add(perCard(i, context));
  }
  return cards;
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  var tt = <Widget>[];
  int _count = 5;
  int _from = 0;
  void _press() {
//    setState(() {
//      for (var i=_from;i<_count;i++){
//        texts.add(new Text("this is $i")) ;
//      }
//
//      _from = _count;
//      _count+=5;
//
//    });
  }
  var dx = 0.0;
  var dy = 0.0;

  void _press2(BuildContext context, TapDownDetails d) {
//    GlobalKey key = new GlobalKey();
//    final RenderBox box = key.currentContext.findRenderObject();
//    final positioned = box.localToGlobal(Offset.zero);
    var x = d.globalPosition.dx;
    var y = d.globalPosition.dy;
    setState(() {
      dx = x - 30;
      dy = y - 100;
    });
//    return showDialog(
//        context: context,
//        builder: (context) {
//          return AlertDialog(
//            content: Text("hello $x and $y"),
//          );
//        }
//    );
  }

  @override
  Widget build(BuildContext context) {
    var texts = allCards(context);
    return Scaffold(
        appBar: PreferredSize(
            child: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                "登录$_count",
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
              elevation: 0.0,
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Center(
                    child: Text(
                      "注册",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            preferredSize: Size.fromHeight(50.0)),
        body: Container(
            child: GestureDetector(
              onTapDown: (TapDownDetails details) => _press2(context, details),
              child: Stack(
                children: <Widget>[
                  GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio:
                        MediaQuery.of(context).size.width / 2 / cardHeight,
//                          childAspectRatio: MediaQuery.of(context).size.width /
//                              (MediaQuery.of(context).size.height / 4)
                      ),
                      itemCount: texts.length,
                      itemBuilder: (context, index) {
                        return texts[index];
                      }),
                  Positioned(
                    child: FloatingActionButton(
                      tooltip: 'add',
                      child: Icon(Icons.add),
                      onPressed: null,
                    ),
                    left: dx,
                    top: dy,
                  )
                ],
              ),
            )),
        floatingActionButton: FloatingActionButton(
          tooltip: 'add',
          child: Icon(Icons.add),
          onPressed: _press,
        ));
  }
}
