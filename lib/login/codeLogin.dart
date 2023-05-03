import 'package:flutter/material.dart';
import 'comm.dart';

class CodeLogin extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    void _press(){
      Navigator.pop(context);

    }
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            iconTheme: IconThemeData(color: Colors.blue),
            backgroundColor: Colors.white,
            title: Text("验证码登录", style: TextStyle(color: Colors.black)),
            centerTitle: true,
            elevation: 0.0,
          ),
          preferredSize: Size.fromHeight(50.0)),
      body: Column(
        children: <Widget>[
          Container(
            height: 50.0,
            decoration: BoxDecoration(
                border:
                    Border(top: BorderSide(color: Colors.grey[200], width: 1))),
            child: Row(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Image.asset('assets/images/input_phone@2x.png',
                        width: 16, height: 23)),
                Expanded(
                    child: TextField(
                  //controller: _phoneController,
                  decoration: InputDecoration.collapsed(hintText: '请输入手机号',hintStyle: hintStyle()),
                  keyboardType: TextInputType.phone,
                ))
              ],
            ),
          ),
          Container(
            height: 50.0,
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.grey[200], width: 1),
                    bottom: BorderSide(color: Colors.grey[200], width: 1))),
            child: Row(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Image.asset('assets/images/pwd@2x.png',
                        width: 16, height: 23)),
                Expanded(
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            decoration:
                                InputDecoration.collapsed(hintText: '请输入验证码',hintStyle: hintStyle()),
                          ),
                          flex: 4,
                        ),
                        Expanded(
                            flex: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      left: BorderSide(
                                          color: Colors.grey[200],
                                          width: 1.0))),
                              child: Center(
                                child: Text('获取验证码',
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Color(0xff89d40c))),
                              ),
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          MyButton(marginTop: 20.0,marginBottom: 10.0,pressCB: _press,),
          GestureDetector(
            onTap: _press,
            child: Center(
              //heightFactor: 50.0,
              child: Text('账号密码登录',
                  style: TextStyle(
                      fontSize: 15.0,
                      color: Color(0xff89d40c))
              ),
            ),
          )
        ],
      ),
    );
  }
}
