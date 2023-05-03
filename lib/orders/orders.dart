import 'package:flutter/material.dart' ;
import 'package:flutter_app/comms/commWidget.dart' as cw;
import 'comms.dart' as localcomms;

var wordLists = localcomms.addWord2List();

class Orders extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OrdersState();
  }
}

class _OrdersState extends State<Orders> with SingleTickerProviderStateMixin{
  ScrollController sc;
  var _wordLists = wordLists;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sc = ScrollController();
    sc.addListener((){
      // judge if arrive bottom
      if(sc.position.maxScrollExtent - sc.offset < 20){
        setState(() {
          _wordLists.addAll(localcomms.addWord2List());
        });
      }
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    sc.dispose();
    super.dispose();
  }


  void _listItemOnTapped(int index,BuildContext context){
    localcomms.showDetails(context);
  }
  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return Scaffold(
      appBar: cw.myAppBar(title:'订单列表'),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.grey[300],
            height: 10,
            width: double.infinity,
          ),
          Expanded(
            child: ListView.builder(
                controller: sc,
                itemCount: wordLists.length,
                itemBuilder: (context,index){
                  return localcomms.ordersList(func: _listItemOnTapped,index: index,wordLists: wordLists,context: context);

                }
            ),
          )
        ],
      ),
    );
  }
}