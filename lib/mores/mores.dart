import 'package:flutter/material.dart' ;
import 'package:flutter_app/globals.dart' as globals;
import 'package:flutter_app/comms/commCfg.dart' as comms;

//class Mores extends StatefulWidget{
//  @override
//  _Mores createState() {
//    // TODO: implement createState
//    return _Mores();
//  }
//}


class Mores extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    double cardWidth = MediaQuery.of(context).size.width / 3 ;
    // TODO: implement build
    return Column(
      children: <Widget>[
        comms.adImg(containerH: 120,),
        Padding(
          padding: EdgeInsets.only(top: 20),
        ),
        Expanded(
          child: GridView.builder(

              controller: new ScrollController(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,childAspectRatio: cardWidth / cardWidth),
              itemCount: 9,
              itemBuilder: (context,index){

                  return comms.moresGrid(index,context);

              }
          ),
        ),
      ],
    );
  }
}