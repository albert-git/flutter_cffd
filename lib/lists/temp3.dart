import 'package:flutter/material.dart' ;

import 'temp2.dart' as tb;
import 'package:flutter_app/comms/commCfg.dart';
import 'package:flutter_app/globals.dart' as globals;
import 'package:flutter_app/comms/localdb.dart' as db;
import 'dart:io';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeState();
  }
}


var initIndex = 0;
var curIndex = 0;


class _HomeState extends State<Home> with TickerProviderStateMixin {
  TabController foodTabC,marketTabC;
  // animate controller and curve
  AnimationController controller;
  Animation curveAnimate;
  // 屏幕是半屏 还是全屏 0 表示半屏
  var screenFlag = 0;
  // 当前是否可以点击的标识，防止上一个动画没结束之前的连续点击
  var moveFlag = true;
  //餐饮数据源
  var ts = globals.foodBreakfast;
  var tsLunch = globals.foodLunch;
  var tsDinner = globals.foodDinner;
  //超市数据源
  var tvsDrink = globals.marketDrink;
  var tvsNoodle = globals.marketNoodle;
  var tvsPartnew = globals.marketPartner;
  var count = 2;
  var hh = globals.adImgHeight;
  var hhSm = globals.adSmImgHeight;
  // 动画加号是否隐藏的标志
  bool vFlag = false;

  var addImgLeft = 0.0;
  var addImgTop = 0.0;

  //move function
  moveIt(double x,double y,BuildContext context,int index){
    if (moveFlag ){
      //moveFlag = false;
      var screenW = MediaQuery.of(context).size.width / 2;
      var screenH = MediaQuery.of(context).size.height ;
      //var startX = screenW - 20 ;
      var startX = x;
      //var startY = -1*y;
      //var startY = -1 * screenH;
      var startY = y;
      var tempX = startX + 10;
      var tempY = startY + 30;
      RenderBox rb = _cartKey.currentContext.findRenderObject();
      var cartPosition = rb.localToGlobal(Offset.zero);
      var endX = cartPosition.dx;
      var endY = cartPosition.dy / -1;
//      var endX = screenFlag==1 ? 305.0:310.0;
//      var endY = screenFlag==1 ? -390.0 : -260.0 ;
//      var endX = MediaQuery.of(context).size.width - 50;
//      var endY = MediaQuery.of(context).size.height * -2;
      var abc = globals.beizer(
          startX: startX,
          startY: startY,
          referenceX: tempX,
          referenceY: tempY,
          endX: endX,
          endY: endY
      );

      var a = abc['a'];
      var b = abc['b'];
      var c = abc['c'];

      moveFlag = true;
      vFlag = true;
      controller = AnimationController(vsync: this,duration: const Duration(milliseconds: 700));
      curveAnimate = CurvedAnimation(parent: controller,curve: Curves.fastOutSlowIn);
      var  animation = Tween<double>(begin: startX,end: screenFlag==1 ? 305.0:310.0).animate(curveAnimate);

      animation.addListener((){
        //print(controller.status.toString() + 'abc');
        if (animation.status != AnimationStatus.completed){
          setState(() {
            addImgLeft = animation.value;
            addImgTop = -1*(a*addImgLeft*addImgLeft+b*addImgLeft+c);
          });
        } else {
          setState(() {
            vFlag = false;
            //更新购物车中总商品数量和某类商品的数量
            globals.shoppingCount += 1;
            var findFlag = false;
            var goods = globals.shoppingList;
            for(var i=0;i<goods.length;i++){
              if(goods[i]['index'] == index){
                goods[i]['count'] += 1;
                findFlag = true;
                break;
              }
            }
            if(!findFlag){
              goods.add({'index':index,'count':1});
            }

            print(globals.shoppingList);
          });
          controller.dispose();
          moveFlag = true;
        }
      });
      controller.forward();
    }

  }
  void _onAdd(TapDownDetails d,BuildContext context,int index){
    print('from add function  '+index.toString());
    if(moveFlag){
      var y = -1*d.globalPosition.dy;
      var moveX = d.globalPosition.dx;
      var moveY = screenFlag==0 ? y+280 : y+170 ;

      //print(d.globalPosition.dx.toString()+'-----'+d.globalPosition.dy.toString());
      moveIt(moveX,moveY,context,index);
      moveFlag = false;
    }
  }

  Widget myAnimateAdd({double addImgleft=0, double addImgTop=0,bool vFlag=false}) {
    return Visibility(
        visible: vFlag,
        child: Positioned(
          child: Image.asset(
            'assets/images/add_prod@2x.png',
            width: 20,
            height: 18,
          ),
          left: addImgleft,
          top: addImgTop,
          //bottom: 0,
        )
    );
  }
  var _cartKey = GlobalKey();
  @override
  void initState(){
    super.initState();
    foodTabC = TabController(length: 5, vsync: this);

//    foodTabC.addListener((){
//      curIndex = foodTabC.index;
//      if (curIndex != initIndex){
//        print(curIndex);
//        initIndex = curIndex;
//      }
//
//
//    });
    marketTabC = TabController(length: 4, vsync: this);
//    controller = AnimationController(vsync: this,duration: const Duration(milliseconds: 800));
//    curveAnimate = CurvedAnimation(parent: controller,curve: Curves.decelerate);
  }
  @override
  void dispose(){
    controller.dispose();
    foodTabC.dispose();
    marketTabC.dispose();
    super.dispose();
  }

  int _currentIndex = 0;
  //向下滚动时向数组追加数据
  void scrollDown(){
    var nextPage = db.foodNextPage(count);
    if (nextPage.length>0){
      setState(() {
        ts.addAll(nextPage);
        screenFlag = 1;
        globals.adImgHeight=0;
        count++;
      });
    } else {
      setState(() {
        screenFlag = 1;
        globals.adImgHeight=0;
      });
    }


  }
  //向上滚动到顶，恢复广告条
  void scrollUp(){
    setState(() {
      globals.adImgHeight = 130;
      screenFlag = 0;
    });

  }
  //bottomBarItem pressed
  void _onBottomBarItemPressed(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    globals.screenWidth = MediaQuery.of(context).size.width ;
    globals.screenHeight = MediaQuery.of(context).size.height;
    // TODO: implement build
    return WillPopScope(
      onWillPop: (){return new Future((){exit(0);});},
      child: Scaffold(
        //resizeToAvoidBottomPadding: false,
        appBar: PreferredSize(
            child: AppBar(
                backgroundColor: Colors.white,
                title: appBarTitle(_currentIndex,globals.globalAddr[0],context),
                centerTitle: true,
                elevation: 0.0,
                bottom: appBarBottom(currentIndex: _currentIndex,foodTabC: foodTabC,marketTabC: marketTabC)
            ),
            preferredSize: Size.fromHeight(_currentIndex > 1 ? 50 : globals.adImgHeight==0 ? 110:240.0)
        ),

        body: _currentIndex < 2 ?
        Stack(
          children: <Widget>[
            tb.myTabView(_currentIndex,foodTabC,marketTabC,context,scrollDown,scrollUp,
                _onAdd,vFlag,addImgLeft,addImgTop
            ),//_children[_currentIndex],
            Container(
              key: _cartKey,
              child: tb.myCart(globals.shoppingCount,context),
            ),
            myAnimateAdd(addImgleft: addImgLeft,addImgTop: addImgTop,vFlag: vFlag)
          ],
        )
            :
        tb.myTabView(_currentIndex,foodTabC,marketTabC,context,scrollDown,scrollUp,
            _onAdd,vFlag,addImgLeft,addImgTop
        ),

        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: _onBottomBarItemPressed,
          currentIndex: _currentIndex,
          items: bottomBarItems(_currentIndex),
        ),
      ),
    );
  }
}