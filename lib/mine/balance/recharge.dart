import 'package:flutter/material.dart';
import 'package:flutter_app/comms/commWidget.dart' as cw;
class Recharge extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Recharge();
  }
}

class _Recharge extends State<Recharge> {
  var _currentIndex = 0;
  void _onGridTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }
  void _onBtnTapped(){}
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: cw.myAppBar(title: '充值'),
      body: Column(
        children: <Widget>[
          Container(
            height: 100,
            child: Center(
              child: Text('现在有余额20元',style: TextStyle(fontSize: 20),),
            ),
          ),
          Flexible(

            child: GridView.builder(
                itemCount: 3,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio: 1.0),
                itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){_onGridTapped(index);},
                    child: Container(

                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: index == _currentIndex ? Color(0xfff5ffe5) : Colors.white,
                          border: Border.all()
                      ),
                      child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('￥',style: TextStyle(fontSize: 20,color: Colors.green),),
                                  Text('99',style: TextStyle(fontSize: 35,color: Colors.green),)
                                ],
                              ),
                              Text('赠送一次会员',style: TextStyle(fontSize: 15),),
                            ],
                          )
                      ),
                    ),
                  );
                }
            ),
          ),
          Flexible(
            child: cw.MyButton(btnText: '充值并购买',pressCB: _onBtnTapped,),
          )
//          Flexible(
//            child: Padding(padding: EdgeInsets.only(top: 20),
//              child: cw.MyButton(btnText: '充值并购买',pressCB: _onGridTapped,),
//            ),
//          )
        ],
      ),
    );
  }
}