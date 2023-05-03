import 'package:flutter/material.dart';
import 'package:flutter_app/comms/commWidget.dart' as cw;

Container pwdContainer({int index,int currentIndex,TextEditingController tec,Function func,FocusNode fn}){
  return Container(
    //margin: EdgeInsets.only(right: 10),
    height: 50,
    width: 50,
    decoration: BoxDecoration(
      border: Border.all(color: Color(0xff89d40c),)
    ),

    child: Center(
      child: Container(
        height: 5,
        width: 5,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index <= currentIndex ? Colors.black : Colors.white
        ),
      ),
    )
  );
}

class PayPwdUpdate extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PayPwdUpdate();
  }
}

class _PayPwdUpdate extends State<PayPwdUpdate> {
  var pwdFlag = false ;
  var _currentIndex = -1;
  var tec = TextEditingController();
  var _focusNode =  FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    tec.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(_focusNode);
    // TODO: implement build
    return Scaffold(
      appBar: cw.myAppBar(title: '更换支付密码'),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Column(
                children: <Widget>[

                  Container(
                    height: 100,
                    width: double.infinity,
                    child: Center(
                      child: Text(!pwdFlag ? '请输入旧支付密码' : '请输入新的支付密码',style: TextStyle(fontSize: 20),),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      pwdContainer(index: 0,currentIndex: _currentIndex,),
                      pwdContainer(index: 1,currentIndex: _currentIndex,),
                      pwdContainer(index: 2,currentIndex: _currentIndex,),
                      pwdContainer(index: 3,currentIndex: _currentIndex,),
                      pwdContainer(index: 4,currentIndex: _currentIndex,),
                      pwdContainer(index: 5,currentIndex: _currentIndex,),
                    ],
                  ),
                ],
              ),
              Opacity(
                opacity: 0,
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all()
                  ),
                  child: TextField(controller: tec,cursorWidth: 0,style: TextStyle(color: Colors.white),
                    maxLength: 6,focusNode: _focusNode,keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(border: InputBorder.none),
                    onChanged: (txt){
                      setState(() {
                        _currentIndex = txt.length - 1;
                      });
                      print(txt);
                    },
                  ),
                ),
              ),
            ],
          ),

          cw.MyButton(pressCB: (){
            if(pwdFlag){
              Navigator.pop(context);
            }
            if (tec.text == '123456' && !pwdFlag){
              tec.clear();
              setState(() {
                pwdFlag = true;
                _currentIndex = -1;
              });


            }

          },btnText: '确定',)
        ],
      ),
    );
  }
}