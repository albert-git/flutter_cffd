import 'package:flutter/material.dart';
import 'package:flutter_app/mine/comm.dart';

final blackTxt = new TextStyle(color: Colors.black);
final whiteTxt = new TextStyle(color: Colors.white);

Widget mines(){
  return Column(

    children: <Widget>[

      Container(
        color: Color(0xff89d40c),

        child: Row(

          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Image.asset('assets/images/head@2x.png',width: 40,height: 40,),
            ),
            Center(
              child: Text('18121957068\n感谢登录',style: whiteTxt),
            ),
          ],
        ),
      ),

      CmdBar(leadingImgPath: 'assets/images/orders@2x.png', leadingTxt: '订单',index: 0,),
      CmdBar(leadingImgPath: 'assets/images/address@2x.png',leadingTxt: '我的地址',index: 1,dividerFlga: false,),

      Container(
        height: 15,
        color: Colors.grey[350],
      ),
      CmdBar(leadingImgPath: 'assets/images/balance@2x.png',leadingTxt: '余额',index: 2,tailTxt: '￥200',),
      CmdBar(leadingImgPath: 'assets/images/discount_entry@2x.png',leadingTxt: '优惠',targetRoute: '/mine/discount',),
      CmdBar(leadingImgPath: 'assets/images/acct_set@2x.png',leadingTxt: '账号设置',targetRoute: '/mine/acct',),
      //CmdBar(leadingImgPath: 'assets/images/more_set@2x.png', leadingTxt: '更多设置',dividerFlga: false,),
      //CmdBar( leadingTxt: '更多设置',dividerFlga: false,),
      Expanded(
        child: Container(
          color: Colors.grey[350],
        ),
      )
    ],
  );
}