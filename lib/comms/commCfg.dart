import 'package:flutter/material.dart';

import 'package:flutter_app/globals.dart' as globals;
import 'package:cached_network_image/cached_network_image.dart';


///bottom navigator bar

const ICON_LABEL_UNACTIVE_COLOR = Colors.grey;
const ICON_LABEL_ACTIVE_COLOR = Colors.green;
const ICON_LABEL_TXT_SIZE = 14.0;

//icon文字在激活/未激活时的颜色变化
TextStyle actTxtStyle(int myIndex,int currentIndex){
  return TextStyle(color: currentIndex == myIndex ? ICON_LABEL_ACTIVE_COLOR : ICON_LABEL_UNACTIVE_COLOR,fontSize: ICON_LABEL_TXT_SIZE);
}

const BOTTOM_NAVIGATION_BAR_IMG_WIDTH = 22.0;
const BOTTOM_NAVIGATION_BAR_IMG_HEIGHT = 25.0;
//底部四个导航条
List<BottomNavigationBarItem> bottomBarItems(int currentIndex){
  return [
    BottomNavigationBarItem(
        icon: new Image.asset('assets/images/food@2x.png',width: BOTTOM_NAVIGATION_BAR_IMG_WIDTH,height: BOTTOM_NAVIGATION_BAR_IMG_HEIGHT,),
        activeIcon: new Image.asset('assets/images/food_active@2x.png',width: BOTTOM_NAVIGATION_BAR_IMG_WIDTH,height: BOTTOM_NAVIGATION_BAR_IMG_HEIGHT,),
        title: Text('餐饮',style: actTxtStyle(0,currentIndex),)

    ),
    BottomNavigationBarItem(
        icon: new Image.asset('assets/images/market@2x.png',width: BOTTOM_NAVIGATION_BAR_IMG_WIDTH,height: BOTTOM_NAVIGATION_BAR_IMG_HEIGHT,),
        activeIcon: new Image.asset('assets/images/market_active@2x.png',width: BOTTOM_NAVIGATION_BAR_IMG_WIDTH,height: BOTTOM_NAVIGATION_BAR_IMG_HEIGHT,),
        title: Text('校园超市',style: actTxtStyle(1,currentIndex),)

    ),
    BottomNavigationBarItem(
        icon: new Image.asset('assets/images/more@2x.png',width: BOTTOM_NAVIGATION_BAR_IMG_WIDTH,height: BOTTOM_NAVIGATION_BAR_IMG_HEIGHT,),
        activeIcon: new Image.asset('assets/images/more_active@2x.png',width: BOTTOM_NAVIGATION_BAR_IMG_WIDTH,height: BOTTOM_NAVIGATION_BAR_IMG_HEIGHT,),
        title: Text('更多',style: actTxtStyle(2,currentIndex),)
    ),
    BottomNavigationBarItem(
        icon: new Image.asset('assets/images/mine@2x.png',width: BOTTOM_NAVIGATION_BAR_IMG_WIDTH,height: BOTTOM_NAVIGATION_BAR_IMG_HEIGHT,),
        activeIcon: new Image.asset('assets/images/mine_active@2x.png',width: BOTTOM_NAVIGATION_BAR_IMG_WIDTH,height: BOTTOM_NAVIGATION_BAR_IMG_HEIGHT,),
        title: Text('我的',style: actTxtStyle(3,currentIndex),)
    )
  ];
}

/// top appBar title

Widget appTitle({String addr,BuildContext context}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[

//      Expanded(
//          flex:1,
//          child: Container(
//            child: Text(''),
//            decoration: BoxDecoration(
//                border: Border.all(width: 1.0),
//                color: Colors.blue
//            ),
//          )
//      ),
      Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsets.only(left: 35),
            child: Image.asset('assets/images/flutter22.png',width: 150,height: 75,),

          )
      ),
      Expanded(
        flex: 1,
        child: GestureDetector(
          onTap: (){Navigator.pushNamed(context, '/mine/addrSelect');},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(addr ?? "男三院 ",style: TextStyle(color: Colors.black,fontSize: 14.0),),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Image.asset('assets/images/addr_select@2x.png',width: 12,height: 6,),
              )


            ],
          ),
        )
      ),
    ],
  );

}


Widget appBarTitle(int currentIndex,String addr,BuildContext context) {
  final titles = [
    appTitle(addr:addr,context: context),
    appTitle(addr:addr,context: context),
    Text('更多分类',style: TextStyle(color: Colors.black),),
    Text('个人中心',style: TextStyle(color: Colors.black),)
  ];
  return titles[currentIndex];
}

/// tab 页
// tab page bar item
//Column tabPageBarItem(String imgPath,String labelTxt){
Column tabPageBarItem({
  @required String imgPath,
  @required String labelTxt,
  double imgContainerMarginTop=10,
  double imgContainerH=22,
  double imgW=22,
  double imgH=25,
  double txtContainerMarginBottom=10,
  double imgContainerMarginBottom=0,
  String rowOrColumn='c',
  double txtSize=14.0,
  double txtContainerMarginLeft=10
}){
  if (rowOrColumn=='r'){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          //margin: EdgeInsets.only(),
          height: imgContainerH,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Tab(icon: Image.asset(imgPath,width: imgW,height: imgH)),
                Container(
                  margin: EdgeInsets.only(left: txtContainerMarginLeft),
                  child: Text(labelTxt,style: TextStyle(fontSize: txtSize),),
                )
              ],
            ),
          )
        ),

      ],
    );
  } else {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: imgContainerMarginTop,bottom: imgContainerMarginBottom),
          height: imgContainerH,
          child: Tab(icon: Image.asset(imgPath,width: imgW,height: imgH)),
        ),
        Container(
          margin: EdgeInsets.only(bottom: txtContainerMarginBottom),
          child: Text(labelTxt),
        )
      ],
    );
  }

}

// food tab page bar
final foodTabPageBar = [
  tabPageBarItem(imgPath:'assets/images/breakfast_active@2x.png', labelTxt:'早餐'),
  tabPageBarItem(imgPath:'assets/images/lunch_active@2x.png', labelTxt:'午餐'),
  tabPageBarItem(imgPath:'assets/images/dinner_active@2x.png', labelTxt:'晚餐'),
  tabPageBarItem(imgPath:'assets/images/nightingale_active@2x.png', labelTxt:'夜宵'),
  tabPageBarItem(imgPath:'assets/images/fruit-active@2x.png', labelTxt:'水果'),
];

// market tab page bar
final marketTabPageBar = [
  tabPageBarItem(imgPath:'assets/images/drink_active@2x.png', labelTxt:'饮料'),
  tabPageBarItem(imgPath:'assets/images/noodle_active@2x.png', labelTxt:'泡面'),
  tabPageBarItem(imgPath:'assets/images/partner_active@2x.png', labelTxt:'泡面搭档'),
  tabPageBarItem(imgPath:'assets/images/smoke_active@2x.png', labelTxt:'香烟'),

];

/// top appBar bottom


// 广告条充满整个容器
Widget adImg({String imgPath,double containerW=double.infinity,double containerH=double.infinity}){

  return Visibility(
    child: Container(
        height: containerH,
        width: containerW,
        child:  CachedNetworkImage(
          placeholder: Center(
            child: Image.asset(
              'assets/images/food@2x.png',
              fit: BoxFit.cover,
            ),
          ),
          imageUrl: 'https://mp.ejiajunxy.cn/ad-head@3x.png',
        ),
    ),
    visible: containerH==0 ? false : true,
  );
}

var  adImgH = globals.adImgHeight;

// top appBar bottom
PreferredSize appBarBottom(
    {int currentIndex,String adImgPath,TabController foodTabC,TabController marketTabC }
  ){

  final appBarBottomList = [
    PreferredSize(
      preferredSize: Size.fromHeight(globals.adImgHeight==0 ?10 : 140),
      child: Column(
        children: <Widget>[
          // 广告条
          Container(
            //color: Colors.green,
            width: double.infinity,
            child: adImg(containerH: globals.adImgHeight),
          ),
          TabBar(
            indicatorColor: Colors.green,
            indicatorWeight: 2.0,
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.green,
            controller: foodTabC,
            tabs: foodTabPageBar
            //tabs: myTabs,
          ),

        ],
      ),
    ),
    PreferredSize(
      preferredSize: Size.fromHeight(globals.adImgHeight==0 ? 10 :140),
      child: Column(
        children: <Widget>[
          Container(
            //color: Colors.green,
            width: double.infinity,
            child: adImg(containerH: globals.adImgHeight),
          ),
          TabBar(
              indicatorColor: Colors.green,
              indicatorWeight: 2.0,
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.green,
              controller: marketTabC,
              tabs: marketTabPageBar
            //tabs: myTabs,
          ),

        ],
      ),
    ),
    null,
    null,
  ];
  return appBarBottomList[currentIndex];
}


/// 更多 mores
final double moreImgW = 40.0;
final double moreImgH = 62.0;
final mapMoreGrids = [
  {'imgPath':'assets/images/member_center@2x.png','subTitle':'会员中心',
    'imgW':moreImgW,'imgH':moreImgH,'nextPage':'/mores/memberCenter'},
  {'imgPath':'assets/images/express_agent@2x.png','subTitle':'代取快递',
    'imgW':moreImgW,'imgH':moreImgH,'nextPage':'/mores/express'},
  {'imgPath':'assets/images/bottle_water@2x.png','subTitle':'桶装水',
    'imgW':moreImgW,'imgH':moreImgH,'nextPage':'/mores/sendWater'}
];
Widget moresGrid(int index,BuildContext context){

  if (index < mapMoreGrids.length){
    var whichGrid = mapMoreGrids[index];
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context,whichGrid['nextPage']),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[200])
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(whichGrid['imgPath'],width: whichGrid['imgW'],height: whichGrid['imgH']),
            Text(whichGrid['subTitle'],style: TextStyle(fontSize: 14.0),)
          ],
        ),

      ),
    );
  } else {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[200])
        ),
      ),
    );
  }
}


// pay channel enum

enum PayChannels {
  wechat,
  balance,

}


