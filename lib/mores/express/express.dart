import 'package:flutter/material.dart';
import 'package:flutter_app/comms/commCfg.dart' as comms;
import 'package:flutter_app/comms/commWidget.dart' as cw;


// 地质信息 body
Container addrItem({bool headImg,String imgPath,String title,String middleTxt}){
  return Container(
    width: double.infinity,
    height: 50,
    margin: EdgeInsets.only(left: 20,right: 20),
    decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey))
    ),

    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            !headImg ? Text(title) : Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 5,bottom: 5,right: 20),
                  child: Image.asset(imgPath,width: 30,height: 25,),
                ),
                Text(middleTxt)
              ],
            )
          ],
        ),
        Image.asset('assets/images/path@3x.png',width: 20,height: 15,)

      ],
    ),
  );
}

Column addres(){
  return Column(
    children: <Widget>[
      addrItem(headImg: false,title: '地质（请收入时间和取之信息）'),
      addrItem(headImg: true,imgPath: 'assets/images/express_get@2x.png',middleTxt: '武汉科技大学\ntomcat188181881'),
      addrItem(headImg: true,imgPath: 'assets/images/express_take@2x.png',middleTxt: '武汉科技大学\ntomcat188181881'),
      addrItem(headImg: false,title: '送达时间'),
    ],
  );
}


// 物流信息 body
Container logisticItem({String title,bool imgFlag,String imgPath,String tail,TextEditingController tc}){
  return Container(
    width: double.infinity,
    height: 50,
    margin: EdgeInsets.only(left: 20,right: 20),
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Colors.grey))
    ),

    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(title,style: TextStyle(fontSize: 17)),
        imgFlag ? Image.asset(imgPath,width: 20,height: 15,) : Container(
          width: 200,
          padding: EdgeInsets.only(left: 70),

          child: TextField(
            controller: tc,
            decoration: InputDecoration.collapsed(hintText: tail),
          ),
        )

      ],
    ),
  );
}
Column logistics(TextEditingController tec){
  return Column(
    children: <Widget>[
      logisticItem(title: '物流公司',imgFlag: true,imgPath: 'assets/images/path@3x.png'),
      logisticItem(title: '快递但号',tail: '请输入快递号',tc: tec,imgFlag: false),
      logisticItem(title: '快递但号',tail: '请输入快递号',tc: tec,imgFlag: false),
      logisticItem(title: '快递但号',tail: '请输入快递号',tc: tec,imgFlag: false),
    ],
  );
}

class Express extends StatefulWidget{
  @override
  _Express createState() => _Express();
}

class _Express extends State<Express> with SingleTickerProviderStateMixin {
  TabController _tc;
  TextEditingController tec;
  var _initTabIndex = 0;
  var _currentTabIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tec = TextEditingController();
    _tc = TabController(length: 2,vsync: this);
    _tc.addListener((){
      _currentTabIndex = _tc.index;
      if(_initTabIndex != _currentTabIndex){
        setState(() {
          _initTabIndex = _currentTabIndex;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tc.dispose();
    tec.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomPadding:  false,
      appBar: cw.myAppBar(title:'快递'),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Column(

              children: <Widget>[
                Image.asset('assets/images/express_ad@2x.png'),
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
                              controller: _tc,
                              tabs: <Widget>[
                                Text('物流信息',style: TextStyle(fontSize: 18),),
                                Text('地质信息',style: TextStyle(fontSize: 18),)
                              ]

                          ),
                        ),
                        Container(
                          height: 20,
                        ),
                        Expanded(
                          flex: 5,
                          child: TabBarView(
                            controller: _tc,
                            children: <Widget>[
                              logistics(tec),
                              addres()
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
            //child: rtnPannel(),
            child: cw.PayChannel(totalPrice: 90,),
          )
        ],
      ),
    );
  }
}