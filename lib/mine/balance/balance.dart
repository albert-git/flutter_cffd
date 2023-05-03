import 'package:flutter/material.dart' ;
import 'package:flutter_app/comms/commWidget.dart' as cw;
import 'package:flutter_app/mine/comm.dart' ;


class Balance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: cw.myAppBar(title: '余额'),
      body: Column(
        children: <Widget>[
          Container(
            height: 100,
            color: Color(0xff89d40c),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/images/balance@2x.png',width: 20,height: 15,),
                      Text('余额（元）',style: TextStyle(fontSize: 15,color: Colors.white),)
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('500.00',style: TextStyle(fontSize: 20,color: Colors.white),)
                    ],
                  ),
                )
              ],
            ),
          ),
          CmdBar(leadingImgPath: 'assets/images/withdraw@2x.png', leadingTxt: '提现',index: 10),
          CmdBar(leadingImgPath: 'assets/images/recharge.png', leadingTxt: '充值',index: 3,targetRoute: '/mine/balance/recharge',),
          CmdBar(leadingImgPath: 'assets/images/relative_orders@2x.png', leadingTxt: '关联订单',index: 4,targetRoute: '/mine/balance/relateOrders',),
        ],
      ),
    );
  }
}