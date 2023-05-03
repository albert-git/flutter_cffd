import 'package:flutter/material.dart';
import 'package:flutter_app/comms/commWidget.dart' as cw;
import 'package:flutter_app/globals.dart' as globals;
Container rtnContainer({double width,double height,String txt,double fontSize,Color color}){
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey[300])
    ),
    child: Center(
      child: Text(txt,style: TextStyle(fontSize: fontSize,color: color),),
    ),
  );
}

class Cart extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Cart();
  }
}

class _Cart extends State<Cart>{
  var goods = globals.shoppingList;
  var allPrice = 0 ;
  // 修改购物车中的数量 updateType=-1 减
  void updateProdCount(int index,int updateType,BuildContext context){
    var prod = globals.shoppingList[index];
    var count = prod['count'];

    if (count == 1 && updateType == -1){
      setState(() {
        allPrice += updateType * globals.foodBreakfast[prod['index']]['priceNew'];
        print(allPrice);
        goods.removeAt(index);
        globals.shoppingCount -= 1;
        if(globals.shoppingCount == 0){
          Navigator.pop(context);
        }
      });
    } else {
      setState(() {
        prod['count'] +=  updateType;
        globals.shoppingCount += updateType;
        allPrice += updateType * globals.foodBreakfast[prod['index']]['priceNew'];
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    goods.forEach((m){
      var perPrice = globals.foodBreakfast[m['index']]['priceNew'];
      allPrice += m['count'] * perPrice;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: cw.myAppBar(title: '购物列表'),
      body: Column(
        children: <Widget>[
          Divider(color: Colors.grey[700],),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: ListView.builder(
                itemCount: goods.length,
                itemBuilder: (context,index){
                  var goodsName = globals.foodBreakfast[goods[index]['index']]['name'];
                  var goodCnt = goods[index]['count'];
                  var totalPrice = (goodCnt * globals.foodBreakfast[goods[index]['index']]['priceNew']).toString();

                  return Container(
                    height: 70,
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey[400]))
                    ),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(goodsName),
                            ],
                          )
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: (){updateProdCount(index, -1,context);},
                                    child: rtnContainer(width: 30,height: 30,txt: '-',fontSize: 30,color: Color(0xff89d40c)),
                                  ),
                                  rtnContainer(width: 60,height: 30,txt: goodCnt.toString(),fontSize: 20,color: Colors.black),
                                  GestureDetector(
                                    onTap: (){updateProdCount(index, 1,context);},
                                    child: rtnContainer(width: 30,height: 30,txt: '+',fontSize: 30,color: Color(0xff89d40c)),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: Text(totalPrice),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          GestureDetector(
            onTap: (){Navigator.pushNamed(context, '/mores/memberCenter');},
            child: Container(
              width: double.infinity,
              height: 30,
              decoration: BoxDecoration(
                  image: DecorationImage(image: Image.asset('assets/images/members-entry.png').image)
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 6,
                    child: Center(
                      child: Text('开通会员，最高可优惠12元'),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Row(
                        children: <Widget>[
                          Image.asset('assets/images/members-2.png',width: 20,height: 20,),
                          Image.asset('assets/images/members-in.png',width: 20,height: 20,),
                        ],
                      )
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: cw.PayChannel(totalPrice: allPrice * 1.0,containerH: 0,),
          )
        ],
      ),
    );
  }
}