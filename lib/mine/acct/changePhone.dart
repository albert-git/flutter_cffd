import 'package:flutter/material.dart';
import 'package:flutter_app/comms/commWidget.dart' as cw;

//class PhoneUpdate extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return _PhoneUpdate();
//  }
//}


class PhoneUpdate extends StatelessWidget {
  final TextEditingController tec = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: cw.myAppBar(title: '更换手机号'),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              children: <Widget>[
                Container(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Text('当前手机号'),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text('11111122222'),
                    )
                  ],
                ),
                Divider(),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Text('更换新号码'),
                    ),
                    Expanded(
                      flex: 2,
                      child: TextField(controller: tec,),
                    )
                  ],
                ),
                Divider()
              ],
            ),
          ),
          cw.MyButton(pressCB: (){Navigator.pop(context);},btnText: '保存',)
        ],
      ),
    );
  }
}