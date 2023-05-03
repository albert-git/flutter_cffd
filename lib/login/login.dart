import 'package:flutter/material.dart';
import 'comm.dart';
import 'codeLogin.dart';
import 'forgotPwd.dart';
import 'package:flutter_app/comms/commWidget.dart' as cw;

class Login extends StatefulWidget{
  @override
  _LoginState createState() => new _LoginState();
}



class _LoginState extends State<Login> with TickerProviderStateMixin {
  final _balckStyle = const TextStyle(color: Colors.black);
  final _phoneController = TextEditingController();
  final _pwdController = TextEditingController();
  var _alermTxt = false;
  var _txtSize = 20.0;
  AnimationController controller;
  Animation curveAnimate;
  void animateTxt(){
    controller = AnimationController(vsync: this,duration: const Duration(milliseconds: 2000));
    curveAnimate = CurvedAnimation(parent: controller,curve: Curves.easeInOut);
    var  animation = Tween<double>(begin: 20.0,end: 15.0).animate(curveAnimate);
    animation.addListener((){
      print(animation.value);
      if(animation.status==AnimationStatus.completed){
        setState(() {
          _alermTxt = false;
        });
        controller.dispose();
      } else {
        setState(() {
          _txtSize = animation.value;
        });
      }
    });
    controller.forward();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this,duration: const Duration(milliseconds: 2000));

  }
  @override
  void dispose(){
    controller.dispose();
    _phoneController.dispose();
    _pwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //Navigator.pushReplacementNamed(context, '/forgot_pwd');
    _press(){
      var pwd = _pwdController.text;
      var phone = _phoneController.text;
      if(pwd=='111' && phone=='111'){
        Navigator.popAndPushNamed(context, '/home');
      } else {
        setState(() {
          _alermTxt = true;
        });
        animateTxt();
      }

//      return showDialog(context: context,
//          builder: (context) {
//            return AlertDialog(
//              content: Text(_phoneController.text + " hello " + _pwdController.text),
//            );
//          }
//      );
    }

    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: PreferredSize(
            child: AppBar(
              backgroundColor: Colors.white,
              title: Text("登录",style: _balckStyle),
              centerTitle: true,
              elevation: 0.0,
              actions: <Widget>[
                Padding(

                  padding: EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    key: Key("register"),
                    //onTap: () => _press(),
                    child: Center(
                      child: Text("注册",style: _balckStyle),
                    ),
                  ),
                ),
              ],
            ),
            preferredSize: Size.fromHeight(50.0)),

        body: Column(
          children: <Widget>[
            Container(
              color: Color(0x55e7e7e7),
              padding: EdgeInsets.only(top: 20,bottom: 20),
              child: Center(
                child: Image.asset('assets/images/flutter22.png',width: 150,height: 75)
              ),
            ),
            MyInput(imgPath: "assets/images/input_phone@2x.png",
                textFieldController: _phoneController,hintText: "请输入手机号",
                keyType: TextInputType.phone),

            Divider(),
            MyInput(imgPath: "assets/images/pwd@2x.png",
                textFieldController: _pwdController,
                hintText: "请输入密码",
                pwdFlag: true,keyType: TextInputType.text
            ),
            cw.MyButton(pressCB:_press,btnText: "登 录",),
            Visibility(
              visible: _alermTxt,
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text('用户名或密码错误，请重新输入',style: TextStyle(fontSize: _txtSize,color:Colors.red ),),
              ),
            ),
            Padding(

                padding: EdgeInsets.only(top: 15.0),
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      child: Text(
                        "短信验证码登录  |",
                        style: TextStyle(fontSize: 15.0,color: Color(0xff89d40c)),

                      ),
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CodeLogin())
                        );
                      },
                    ),
                    GestureDetector(
                      child: Text(
                        "  忘记密码？",
                        style: TextStyle(fontSize: 15.0,color: Color(0xff89d40c)),
                      ),

                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ForgotPwd())
                        );
                        //Navigator.popAndPushNamed(context, '/forgot_pwd');
                        //Navigator.pushReplacementNamed(context, '/forgot_pwd');
                      },
                    ),

                  ],
                )
            ),
            Expanded(
              child: Column(

                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text('其他登录方式',style: TextStyle(color: Color(0xffa3a3a3)),),
                  Padding(
                      padding: EdgeInsets.only(
                        top: 30,
                        bottom: 30,
                      ),
                      child: Image.asset("assets/images/wechat@2x.png",width: 27,height: 27)
                  ),

                ],
              ),
            )
          ],
        )
    );
  }
}