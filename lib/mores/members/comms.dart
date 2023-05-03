import 'package:flutter/material.dart';
import 'package:flutter_app/globals.dart' as globals;

Widget vipPrice({String title,String price,Function func,int index}){
  return GestureDetector(
    onTap: ()=>func(index),
    child: Container(

      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]),
          color: globals.currentVipGridIndex == index ? Color(0xfff5ffe5) : Colors.white
      ),
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(title,style: TextStyle(fontSize: 17),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('￥',style: TextStyle(fontSize: 20,color: Colors.green),),
                  Text(price,style: TextStyle(fontSize: 35,color: Colors.green),)
                ],
              )
            ],
          )
      ),
    ),
  );
}

Widget items(Function func,int index){
  var grids = [
    vipPrice(title:'会员1个月', price:'19.9',func: func,index: index),
    vipPrice(title:'会员2个月', price:'99',func: func,index:index),
    vipPrice(title:'会员12个月', price:'150',func: func,index:index)
  ];
  return grids[index];
}


Widget rtnGridView({
  ScrollController sc,
  int columnCnt,
  Function func
}){
  return GridView.builder(

      controller: sc,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columnCnt,


      ),
      itemCount: 3,

      itemBuilder: (context, index) {
        return items(func,index);
      });
}
// vouchers
Widget vouchers({Function func,int index}){
  var lists = [
    voucherPrice(title:'会员1个月', price:'19.9',func: func,index: index),
    voucherPrice(title:'会员2个月', price:'99',func: func,index:index),
    voucherPrice(title:'会员12个月', price:'150',func: func,index:index),
    voucherPrice(title:'会员1个月', price:'19.9',func: func,index: index),
    voucherPrice(title:'会员2个月', price:'99',func: func,index:index),
    voucherPrice(title:'会员12个月', price:'150',func: func,index:index)
  ];
  return lists[index];
}

// voucher price
Widget voucherPrice({String title,String price,Function func,int index}){
  return GestureDetector(
    onTap: ()=>func(index),
    child: Container(

      height: 53,
      width: double.infinity,
      decoration: BoxDecoration(
        color: globals.currentVoucherIndex == index ? Color(0xfff5ffe5) : Colors.white,
        image: DecorationImage(image: Image.asset('assets/images/voucher-on-3.png',fit: BoxFit.cover,).image)
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Center(
              child: Text(price),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(title),
            ),
          )
        ],
      ),
    ),
  );
}

ListView rtnListView({
  ScrollController sc,
  Function func
}){
  return ListView.builder(
      itemCount: 6,
      itemBuilder: (context,index){
        return vouchers(func: func,index: index);
      }
  );
}