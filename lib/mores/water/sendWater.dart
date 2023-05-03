import 'package:flutter/material.dart' ;
import 'package:flutter_app/comms/commWidget.dart' as cw;
class WaterSend extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: cw.myAppBar(title:'桶装水'),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(image: Image.asset('assets/images/send_water@2x.png',fit: BoxFit.cover).image),
                ),
              ),
            ),
          ),
          cw.MyButton(pressCB: (){},btnText: '来一同',),
          Expanded(
            flex: 1,
            child: Container(),
          )
        ],
      ),
    );
  }
}