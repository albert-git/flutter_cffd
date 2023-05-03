import 'package:flutter/material.dart';
import 'package:flutter_app/mine/comm.dart';
import 'package:flutter_app/comms/commWidget.dart' as cw;
class AcctSet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: cw.myAppBar(title: '账号设置'),
      body: Column(
        children: <Widget>[
          CmdBar(leadingTxt: '更换手机号',targetRoute: '/mine/acct/changePhone',),
          CmdBar(leadingTxt: '更换支付密码',dividerFlga: false,targetRoute:'/mine/acct/changePayPwd')
        ],
      ),
    );
  }
}