import 'package:flutter/material.dart';
import 'package:flutter_app/globals.dart' as globals;


Row payImg(int index){
  return Row(
    children: <Widget>[
      Image.asset('assets/images/wechat_pay@2x.png',width: 30,height: 27),
      Padding(
        padding: EdgeInsets.only(left: 10),
        child: Text('abc'),
      )
    ],
  );
}



Column rtnPannel(){
  return Column(
    children: <Widget>[
      Container(
        color: Colors.grey[300],
        height: 15,
      ),
      Expanded(
          flex: 3,
          child: InkWell(

            onTap: (){print('abc');},
            child: Column(
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text('请选择支付方式'),
                        )
                      ],
                    )
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20,right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        payImg(globals.initPayChannel),
                        Image.asset('assets/images/path@3x.png',width: 8,height: 13,)
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
      ),
      Expanded(
        flex: 2,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                color: Color(0xff504f53),
                height: double.infinity,
                child: Center(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text('99',style: TextStyle(color: Colors.white,fontSize: 17),),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: FlatButton(
                  onPressed: (){print('99');},
                  color: Color(0xff89d40c),
                  child: Container(
                      height: 200,
                      child: Center(
                        child: Text('确认支付',style: TextStyle(color: Colors.white)),
                      )
                  )
              ),

//                child: GestureDetector(
//                  onTap: tapOnConfirm,
//                  child: Container(
//                    color: Color(0xff89d40c),
//                    child: Center(
//                      child: Text('确认支付',style: TextStyle(color: Colors.white)),
//                    ),
//                  )
//                ),

            )
          ],
        ),
      )
    ],
  );
}