import 'package:flutter/material.dart' ;
import 'package:english_words/english_words.dart' as en;
import 'package:flutter_app/comms/commWidget.dart' as cw;
import 'package:flutter_app/globals.dart' as globals;

// 地质临时数据
var address = <String>[];
List<String> rtnAddress(){
  for(var i=0;i<20;i++){
    
    address.add(
        i.toString() +' ; ' + en.WordPair.random().asCamelCase
    );
  }
  return address;
}

class AddressDialog extends StatefulWidget {
  final int idx;
  AddressDialog({this.idx});
//  final Function func;
//  final int index;
//  AddressDialog({this.func,this.index});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddressDialog();
  }
}

class _AddressDialog extends State<AddressDialog> {
  var _addrList = rtnAddress();
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      child: ListView.builder(
          itemCount: _addrList.length,
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                if(widget.idx==1){
                  globals.globalAddr[0] = address[index];
                }
                Navigator.pop(context,address[index]);
                },
              child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey))
                  ),
                  child: Center(
                    child: Text(_addrList[index],),
                  )
              ),
            );

          }),
    );
  }
}

final addrClass = {0:'学校',1:'园区',2:'东数',3:'宿舍'};
var addrTxt = ['abc','123','akakak','lao22'];

List<Widget> rtnAddrClass(Function func,Function btnFunc,BuildContext context,List<String> addrShow){
  var addrClassList = <Widget>[];

  addrClassList.add(
    Image.asset('assets/images/address@2x.png',width: 50,height: 45,)
  );
  addrClass.forEach((k,v){
    addrClassList.add(
        GestureDetector(
          onTap: (){func(k,context);},
          child: Padding(
            padding: EdgeInsets.only(top: 20,left: 30,right: 30),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[600]),
                  borderRadius: BorderRadius.circular(7)
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      height: 50,
                      width: 70,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey,width: 0.5),
                          borderRadius: BorderRadius.circular(2)
                      ),
                      child: Center(
                        child: Text(v,style: TextStyle(fontSize: 20),),
                      )
                  ),
                  Text(addrShow[k]),
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Image.asset('assets/images/arrow_pulldown@2x.png',width: 30,height: 25,),
                  )
                ],
              ),
            ),
          ),
        )
    );
  });
  addrClassList.add(
    cw.MyButton(pressCB: btnFunc,btnText: '确定',marginTop: 30,containerH: 90,containerPadding: 20,)
  );
  return addrClassList;
}

class AddrSelect extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddrSelect();
  }
}

class _AddrSelect extends State<AddrSelect> {

  var _addres = addrTxt;
  void _addrOnTapped (int index,BuildContext context) async {
    var m = await showDetails(context,index);
    if(m != null){
      setState(() {
        _addres[index] = m;
      });
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    void _btnFunc(){
      Navigator.pop(context,globals.globalAddr[0]);
    }
    // TODO: implement build
    return Scaffold(
      appBar: cw.myAppBar(title:'选择地址'),
      body: Column(
        children: rtnAddrClass(_addrOnTapped,_btnFunc,context,_addres),
      )
    );
  }
}

// simple dialog

Future<String> showDetails(BuildContext context,int index) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context){
        return SimpleDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          children: <Widget>[
            AddressDialog(idx: index)
          ],
        );
      }
  );

}