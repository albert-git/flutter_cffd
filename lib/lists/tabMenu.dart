import 'package:flutter/material.dart' ;

import 'tabViews.dart' as tb;
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
  // animate
  AnimationController controller;
  Animation curveAnimate;
  // 屏幕是半屏 还是全屏
  var screenFlag = 0;

  var moveFlag = true;
  var ts = globals.foodBreakfast;
  var count = 2;
  var hh = globals.adImgHeight;
  bool vFlag = false;
  var addImgLeft = 0.0;
  var addImgTop = 0.0;

  //move function
  moveIt(double x,double y,BuildContext context){
    var screenW = MediaQuery.of(context).size.width / 2;
    var screenH = MediaQuery.of(context).size.height ;

    var startX = screenW - 20 ;
    //var startY = -1*y;
    var startY = -1 * screenH;
    var tempX = startX + 10;
    var tempY = startY + 120;
    var endX = screenFlag==1 ? 305.0:310.0;
    var endY = screenFlag==1 ? -390.0 : -260.0 ;
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
    controller = AnimationController(vsync: this,duration: const Duration(milliseconds: 1200));
    curveAnimate = CurvedAnimation(parent: controller,curve: Curves.fastOutSlowIn);
    var  animation = Tween<double>(begin: 40,end: screenFlag==1 ? 305.0:310.0).animate(curveAnimate);

    animation.addListener((){
      //print(controller.status.toString() + 'abc');
      if (animation.status != AnimationStatus.completed){


        setState(() {
          addImgLeft = animation.value;
          addImgTop = -1*(a*addImgLeft*addImgLeft+b*addImgLeft+c);
        });

      } else {

        setState(() {
          //addImgLeft = x;
          //addImgTop = y;
          vFlag = false;
        });
        controller.dispose();

      }

    });


    controller.forward();
  }

  void _onAdd(TapDownDetails details,BuildContext context){
    var d = details;
    var xx = d.globalPosition.dx;
    var yy = d.globalPosition.dy;
    var x = d.globalPosition.dx - 15 ;
    var y = d.globalPosition.dy - screenFlag==1 ? 150.0 : 100.0 ;
    //print("$xx and $yy");
    setState(() {
      addImgLeft = xx;
      addImgTop = 0;
      //vFlag = true;
    });

    moveIt(x,y,context);
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
    foodTabC.dispose();
    marketTabC.dispose();
    controller.dispose();

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
                title: appBarTitle(_currentIndex,"男22院 ",context),
                centerTitle: true,
                elevation: 0.0,

                bottom: appBarBottom(currentIndex: _currentIndex,foodTabC: foodTabC,marketTabC: marketTabC)
            ),
            preferredSize: Size.fromHeight(_currentIndex > 1 ? 50 : globals.adImgHeight==0 ? 110:240.0)
        ),

        body: _currentIndex < 2 ? Stack(
          children: <Widget>[
            tb.myTabView(_currentIndex,foodTabC,marketTabC,context,scrollDown,scrollUp,
                _onAdd,vFlag,addImgLeft,addImgTop
            ),//_children[_currentIndex],
            tb.myCart(),
            myAnimateAdd(addImgleft: addImgLeft,addImgTop: addImgTop,vFlag: vFlag)
          ],
        ) : tb.myTabView(_currentIndex,foodTabC,marketTabC,context,scrollDown,scrollUp,
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