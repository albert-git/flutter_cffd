import 'package:flutter/material.dart' ;
import 'package:flutter_app/comms/commWidget.dart' as cw;
import 'package:flutter_app/globals.dart' as globals;
class Addr extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Addr();
  }
}

class _Addr extends State<Addr> {
  var _sex = 1;
  var _addrTxt = globals.globalAddr[0];
  void _selectAddr(BuildContext context){
    Navigator.pushNamed(context, '/mine/addrSelect').then((value){
      print(value);
      print(globals.globalAddr);
      setState(() {
        _addrTxt = globals.globalAddr[0];
      });
    });
  }
  void _changeSex(){
    setState(() {
      _sex = (_sex + 1) % 2;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _sex = 1;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: cw.myAppBar(title: '修改地址'),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Container(
              margin: EdgeInsets.only(top: 20),
              height: 200,

              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 15),

                              ),
                              Row(
                                children: <Widget>[
                                  Text('联系人')
                                ],
                              )
                            ],
                          )
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Theme(data: ThemeData(
                                  primaryColor: Colors.green
                                ), child: Center(
                                  child: TextField(

                                    decoration: InputDecoration(
                                        hintText: 'abc',
                                        border: InputBorder.none
                                    ),
                                  ),
                                ))
                              ),
                              Divider(color: Colors.grey[700],),
                              Expanded(
                                flex: 1,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: _changeSex,
                                        child: Container(
                                          width: 50,
                                          height: 25,
                                          margin: EdgeInsets.only(right: 20),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(85)),
                                              border: Border.all(color: _sex == 1 ? Colors.green : Colors.grey)
                                          ),
                                          child: Center(
                                            child: Text('先生',style: TextStyle(color: _sex == 1 ? Colors.green : Colors.grey),),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: _changeSex,
                                        child: Container(
                                          width: 50,
                                          height: 25,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(85)),
                                              border: Border.all(color: _sex == 0 ? Colors.green : Colors.grey)
                                          ),
                                          child: Center(
                                            child: Text('女士',style: TextStyle(color: _sex == 0 ? Colors.green : Colors.grey),),
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ),
                  Divider(color: Colors.grey[700],),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Text('手机号'),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Theme(data: ThemeData(
                                      primaryColor: Colors.green
                                  ), child: Center(
                                    child: TextField(

                                      decoration: InputDecoration(
                                          hintText: '请输入手机号',
                                          border: InputBorder.none
                                      ),
                                    ),
                                  )),
                                )
                              ],
                            )
                        ),
                        Divider(color: Colors.grey[700],),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: (){_selectAddr(context);},
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Text('地址'),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Text(_addrTxt),
                                )

                              ],
                            ),
                          )
                        )
                      ],
                    )
                  )
                ],
              ),
            )

          ),
          cw.MyButton(pressCB: (){Navigator.pop(context);},btnText: '确定',)
        ],
      ),
    );
  }
}