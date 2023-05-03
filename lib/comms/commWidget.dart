import 'package:flutter/material.dart';
import 'package:flutter_app/globals.dart' as globals;

//appBar
AppBar myAppBar({String title}){
  return AppBar(
    iconTheme: IconThemeData(color: Colors.blue),
    backgroundColor: Colors.white,
    title: Text(title, style: TextStyle(color: Colors.black)),
    centerTitle: true,
    elevation: 0.0,
  );
}

// mybutton


class MyButton extends StatelessWidget {
  MyButton({@required this.pressCB,@required this.btnText,this.containerH,this.containerPadding,
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
        textColor: Colors.white,
        child: Text(btnText ?? '登 录',style: TextStyle(fontSize: 20.0),),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius ?? 30.0)),
      ),
    );
  }
}


//支付方式选择
final String unSelectChannel = 'assets/images/unselect_pay@2x.png';
final String selectChannel ='assets/images/select_pay@2x.png';
final String wechatChannel = 'assets/images/wechat_pay@2x.png';
final String balanceChannel = 'assets/images/balance_pay@2x.png';
var payNames = ['微信支付','余额支付'];
enum PayChannels {
  weChat,
  balance,

}

InkWell payChannelItem(Function onSelected,int currentIndex,int initIndex,String imgPath){
  return InkWell(
    onTap: (){onSelected(initIndex);},
    child: Padding(
      padding: EdgeInsets.only(left: 30,right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Image.asset(imgPath,width: 27,height: 23,),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(payNames[initIndex]),
              )
            ],
          ),
          Image.asset(initIndex == globals.initPayChannel ? selectChannel : unSelectChannel ,width: 23,height: 23,)
        ],
      ),
    ),
  );
}


class PayChannelOptions extends StatefulWidget{
  @override
  _PayChannelOptions createState() => _PayChannelOptions();
}

class _PayChannelOptions extends State<PayChannelOptions> {
  var _currentIndex = 0;
  void _onSelected(int index){
    setState(() {
      _currentIndex = index;
      globals.initPayChannel = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        payChannelItem(_onSelected, _currentIndex, 0, wechatChannel),
        Container(
          height: 20,
        ),
        payChannelItem(_onSelected, _currentIndex, 1, balanceChannel),
        Container(
          height: 20,
        ),
      ],
    );
  }
}


// payChannel Widget 支付 Widget 包括选择支付方式

class PayChannel extends StatefulWidget {
  final double totalPrice;
  final double containerH;
  PayChannel({this.totalPrice,this.containerH});
  @override
  _PayChannel createState() => _PayChannel();
}

class _PayChannel extends State<PayChannel>{

  Future<void> selectPayChannel(BuildContext context) async {

    switch (

    await showDialog(
        context: context,
        builder: (BuildContext context){

          return SimpleDialog(
            title:  Center(child: Text("请选择支付方式",style: TextStyle(fontSize: 20.0),),),
            children: <Widget>[
              PayChannelOptions(),
              //FlatButton(onPressed: (){Navigator.pop(context,globals.initPayChannel);}, child: Text('pressed')),
              GestureDetector(
                onTap: (){Navigator.pop(context,globals.initPayChannel);},
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300]),

                    ),
                    width: 150,
                    height: 40,
                    child: Center(
                      child: Text('确  定',style: TextStyle(fontSize: 20),),
                    )

                  ),
                )
              )
            ],
          );
        }
    )
    ){
      case 0:
        {
          setState(() {
            globals.initPayChannel = 0;
          });
        }
        break;
      case 1:
        {
          setState(() {
            globals.initPayChannel = 1;
          });
        }
        break;
      default:{

      }
      break;
    }
  }

  void tapOnConfirm(){
    setState(() {
      globals.initPayChannel = (globals.initPayChannel+1)%2;
    });

  }
  Row payImg(int index){
    return Row(
      children: <Widget>[
        Image.asset(index ==0 ? wechatChannel : balanceChannel,width: 30,height: 27),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(payNames[index]),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          color: Colors.grey[300],
          height: widget.containerH ?? 15,
        ),
        Expanded(
            flex: 3,
            child: InkWell(

              onTap: (){selectPayChannel(context);},
              child: Column(
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text('请选择支付方式'),
                          )
                        ],
                      )
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20,right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          payImg(globals.initPayChannel),
                          Image.asset('assets/images/path@3x.png',width: 8,height: 13,)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
        ),
        Expanded(
          flex: 2,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  color: Color(0xff504f53),
                  height: double.infinity,
                  child: Center(
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(widget.totalPrice.toString(),style: TextStyle(color: Colors.white,fontSize: 17),),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: FlatButton(
                    onPressed: tapOnConfirm,
                    color: Color(0xff89d40c),
                    child: Container(
                    height: 200,
                    child: Center(
                      child: Text('确认支付',style: TextStyle(color: Colors.white)),
                    )
                  )
                ),

//                child: GestureDetector(
//                  onTap: tapOnConfirm,
//                  child: Container(
//                    color: Color(0xff89d40c),
//                    child: Center(
//                      child: Text('确认支付',style: TextStyle(color: Colors.white)),
//                    ),
//                  )
//                ),

              )
            ],
          ),
        )
      ],
    );
  }
}


