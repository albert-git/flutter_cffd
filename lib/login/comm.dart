import 'package:flutter/material.dart';

TextStyle hintStyle(){
  return TextStyle(color: Colors.grey[400]);
}



class MyButton extends StatelessWidget {
  MyButton({@required this.pressCB,this.btnText,this.containerH,this.containerPadding,
    this.borderRadius,this.marginTop,this.marginBottom});
  final VoidCallback pressCB;
  final String btnText;
  final double containerH;
  final double containerPadding;
  final double borderRadius;
  final double marginTop;
  final double marginBottom;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: marginTop ?? 0.0,bottom: marginBottom ?? 0.0),
      height: containerH ??  80.0,
      width: double.infinity,
      padding: EdgeInsets.all(containerPadding ?? 20.0),
      child: RaisedButton(
        onPressed: pressCB,
        color: Color(0xff89d40c),
        highlightColor: Colors.black,
        animationDuration: Duration(microseconds: 50),
        splashColor: Colors.greenAccent,
        textColor: Colors.white,
        child: Text(btnText ?? '登 录',style: TextStyle(fontSize: 20.0),),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius ?? 30.0)),
      ),
    );
  }
}


class MyInput extends StatelessWidget {
  MyInput({
    this.containerH=50.0,
    this.imgPadding=10.0,@required this.imgPath,this.imgW=16,this.imgH=23,
    this.textFieldController,@required this.hintText,this.keyType,this.pwdFlag=false,
    this.myHintStyle
  });
  final double containerH;
  final double imgPadding;
  final String imgPath;
  final double imgW;
  final double imgH;
  final TextEditingController textFieldController;
  final String hintText;
  final TextInputType keyType;
  final bool pwdFlag;
  final TextStyle myHintStyle;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: containerH,

      child: Row(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(imgPadding),
              child: Image.asset(imgPath,width: imgW,height: imgH)),
          Expanded(
              child: TextField(
                controller: textFieldController,
                decoration: InputDecoration.collapsed(hintText: hintText,hintStyle: myHintStyle ?? hintStyle()),
                keyboardType: keyType ?? TextInputType.text,
                obscureText: pwdFlag,

              )
          )
        ],
      ),

    );
  }
}