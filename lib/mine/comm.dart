import 'package:flutter/material.dart';

var routes = [
  '/mine/orders',
  '/mine/addr',
  '/mine/balance'
];

class CmdBar extends StatelessWidget {
  final String leadingImgPath, leadingTxt;
  final String tailImgPath = 'assets/images/arrow_right@2x.png';
  final double tailImgW = 12;
  final double tailImhH = 14;
  final double containerH, leadingImgW, leadingImgH, paddingLeft, paddingOther;
  final bool dividerFlga;
  final int index;
  final tailTxt;
  final String targetRoute;
  CmdBar(
      { this.leadingImgPath,
        @required this.leadingTxt,
        this.containerH = 50,
        this.leadingImgH = 23,
        this.leadingImgW = 16,
        this.paddingLeft = 0,
        this.paddingOther = 10,
        this.dividerFlga = true,
        this.index,
        this.tailTxt,
        this.targetRoute
      });

  void _onTapped(int index,BuildContext context){

    Navigator.pushNamed(context, targetRoute ?? routes[index]);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () => _onTapped(index,context),
          child: Container(
            margin: EdgeInsets.only(left: 15.0),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey[400],width: dividerFlga ? 1.0 : 0.0))
            ),
            height: containerH,
            child: Row(
              children: <Widget>[
                leadingImgPath == null ? Container() :
                Padding(
                  padding: EdgeInsets.only(
                      left: paddingLeft,
                      top: paddingOther,
                      right: paddingOther,
                      bottom: paddingOther),
                  child: Image.asset(leadingImgPath,
                      width: leadingImgW, height: leadingImgH),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(leadingTxt),
                      Padding(
                        padding: EdgeInsets.only(right: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Text(tailTxt ?? '',style: TextStyle(color: Colors.black),),
                            ),

                            Image.asset(
                              tailImgPath,
                              width: tailImgW,
                              height: tailImhH,
                            ),
                          ],
                        )
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),


      ],
    );
  }
}




class CmdBar2 extends StatelessWidget {
  final String leadingImgPath, leadingTxt;
  final String tailImgPath = 'assets/images/arrow_right@2x.png';
  final double tailImgW = 12;
  final double tailImhH = 14;
  final double containerH, leadingImgW, leadingImgH, paddingLeft, paddingOther;
  final bool dividerFlga;
  CmdBar2(
      {@required this.leadingImgPath,
      @required this.leadingTxt,
      this.containerH = 40,
      this.leadingImgH = 23,
      this.leadingImgW = 16,
      this.paddingLeft = 15,
      this.paddingOther = 10,
      this.dividerFlga = true
      });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () => print(99),
          child: Container(
            height: containerH,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      left: paddingLeft,
                      top: paddingOther,
                      right: paddingOther,
                      bottom: paddingOther),
                  child: Image.asset(leadingImgPath,
                      width: leadingImgW, height: leadingImgH),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(leadingTxt),
                      Padding(
                        padding: EdgeInsets.only(right: 13),
                        child: Image.asset(
                          tailImgPath,
                          width: tailImgW,
                          height: tailImhH,
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        Visibility(
          child: Divider(indent: 15,),
          visible: dividerFlga ? true : false,
        )
      ],
    );
  }
}

