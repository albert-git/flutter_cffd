import 'package:flutter/material.dart';

import 'package:flutter_app/comms/commCfg.dart' as comms;
import 'comms.dart' as myComms;
import 'package:flutter_app/globals.dart' as globals;
import 'package:flutter_app/comms/commWidget.dart' as cm;




class Member extends StatefulWidget{
  @override
  _MemberState createState() {
    // TODO: implement createState
    return _MemberState();
  }

}


final membersTabBar = [
  comms.tabPageBarItem(imgPath:'assets/images/vip-2.png',
      labelTxt:'VIP会员',imgContainerH: 35,imgW: 40,imgH: 30,
      imgContainerMarginTop: 5.0,txtSize: 20,rowOrColumn: 'r'
  ),
  comms.tabPageBarItem(imgPath:'assets/images/voucher-2.png',
      labelTxt:'代金卷',imgContainerMarginBottom: 5,imgContainerH: 35,imgW: 40,imgH: 30,
      imgContainerMarginTop: 5.0,txtSize: 20,rowOrColumn: 'r'
  ),
];

enum PayChannels {
  wechat,
  balance,

}

class _MemberState extends State<Member> with SingleTickerProviderStateMixin {
  TabController tc;
  ScrollController vipSc;
  ScrollController voucherSc;
  //int _currentGridIndex = 0;
  // 解决tabbar 滑动和点击遇到的问题
  int _currentTabIndex = 0;
  int _initTabIndex = 0;

  // vip tapped
  void gridOnTaped(int index){
    setState(() {
      globals.currentVipGridIndex = index;
    });
  }
  // voucher tapped
  void listOnTaped(int index){
    setState(() {
      globals.currentVoucherIndex = index;
    });
  }
  var initChannel = 0;
  void whichPayChannel(){
    setState(() {
      initChannel = (initChannel + 1) % 2;

    });

  }
  final String unSelectChannel = 'assets/images/unselect_pay@2x.png';
  final String selectChannel ='assets/images/select_pay@2x.png';
  final String wechatChannel = 'assets/images/wechat_pay@2x.png';
  final String balanceChannel = 'assets/images/balance_pay@2x.png';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tc = TabController(length: 2, vsync: this);
    tc.addListener((){
      _currentTabIndex = tc.index;
      if (_initTabIndex != _currentTabIndex){
        setState(() {
          _initTabIndex = _currentTabIndex;
        });

      }
    });
    vipSc = ScrollController();
    voucherSc = ScrollController();

  }
  @override
  void dispose() {
    // TODO: implement dispose
    tc.dispose();
    vipSc.dispose();
    voucherSc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue),
        backgroundColor: Colors.white,
        title: Text("会员中心", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Column(

              children: <Widget>[

                Image.asset('assets/images/vip@2x.png',),

                Expanded(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: TabBar(
                            indicatorColor: Colors.green,
                            indicatorWeight: 2.0,
                            unselectedLabelColor: Colors.grey,
                            labelColor: Colors.green,
                            controller: tc,
                            tabs: membersTabBar
                          //tabs: myTabs,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: _initTabIndex == 0 ? Text('开通vip会员，享受更多权益'):Text('使用代金卷，消费更')
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: TabBarView(
                          controller: tc,
                          children: <Widget>[
                            myComms.rtnGridView(sc: vipSc,columnCnt: 3,func: gridOnTaped),
                            myComms.rtnListView(sc: voucherSc,func: listOnTaped)
                          ],
                        ),
                      )

                    ],
                  )
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,

            child: cm.PayChannel(totalPrice: 90,),
          )
        ],
      )
    );
  }
}