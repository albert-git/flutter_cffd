import 'package:flutter/material.dart';
import 'package:flutter_app/comms/commWidget.dart' as cw;

var listItems = [
  {'title': 111, 'subTitle': 222, 'add': '+', 'value': 199},
  {'title': 121, 'subTitle': 232, 'add': '-', 'value': 299},
  {'title': 131, 'subTitle': 242, 'add': '+', 'value': 399},
  {'title': 141, 'subTitle': 252, 'add': '-', 'value': 499},
  {'title': 151, 'subTitle': 262, 'add': '+', 'value': 599},
  {'title': 161, 'subTitle': 262, 'add': '+', 'value': 699},
  {'title': 111, 'subTitle': 222, 'add': '+', 'value': 199},
  {'title': 121, 'subTitle': 232, 'add': '-', 'value': 299},
  {'title': 131, 'subTitle': 242, 'add': '+', 'value': 399},
  {'title': 141, 'subTitle': 252, 'add': '-', 'value': 499},
  {'title': 151, 'subTitle': 262, 'add': '+', 'value': 599},
  {'title': 161, 'subTitle': 262, 'add': '+', 'value': 699},
  {'title': 111, 'subTitle': 222, 'add': '+', 'value': 199},
  {'title': 121, 'subTitle': 232, 'add': '-', 'value': 299},
  {'title': 131, 'subTitle': 242, 'add': '+', 'value': 399},
  {'title': 141, 'subTitle': 252, 'add': '-', 'value': 499},
  {'title': 151, 'subTitle': 262, 'add': '+', 'value': 599},
  {'title': 161, 'subTitle': 262, 'add': '+', 'value': 699},
];

var dialogItems = [
  {'left': 100, 'right': '200'},
  {'left': 101, 'right': '201'},
  {'left': 102, 'right': '202'},
  {'left': 103, 'right': '203'},
  {'left': 104, 'right': '204'},
];

Future<String> showDetails2(BuildContext context) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          children: <Widget>[

            Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      '入账金额',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        '200',
                        style: TextStyle(fontSize: 20),
                      ))
                ],
              ),

            ),
            Divider(color: Colors.black,height: 2,),

            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: 500,
//              child: ListView.builder(
//                //shrinkWrap: true,
//                itemCount: 5,
//                itemBuilder: (BuildContext context, int index) {
//                  return ListTile(
//                    title: Text('Gujarat, India'),
//                  );
//                },
//              ),
              child: ListView.builder(
                  itemCount: dialogItems.length,
                  itemBuilder: (context, index) {

                    return Container(
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                BorderSide(color: Colors.grey))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(dialogItems[index]['left'].toString()),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Text(dialogItems[index]['right'].toString()),
                            )
                          ],
                        )
                    );
                  }),
            )
          ],
        );
      });
}

class RelateOrders extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RelateOrders();
  }
}

class _RelateOrders extends State<RelateOrders> {
  @override
  Widget build(BuildContext context) {
    void _listItemOnTapped() {
      showDetails2(context);

    }

    // TODO: implement build
    return Scaffold(
        appBar: cw.myAppBar(title: '关联订单'),
        body: Column(
          children: <Widget>[
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: listItems.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: GestureDetector(
                        onTap: _listItemOnTapped,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey[700]))),
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(listItems[index]['title'].toString() +
                                  '\n' +
                                  listItems[index]['subTitle'].toString()),
                              Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: Text(listItems[index]['add'].toString() +
                                    '  ' +
                                    listItems[index]['value'].toString()),
                              )
                            ],
                          ),
                        ),
                      ));
                },
              ),
            ),
          ],
        ));
  }
}
