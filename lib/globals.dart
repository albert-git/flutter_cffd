import 'package:flutter/material.dart' ;
import 'lists/index.dart' as lists;
import 'package:flutter_app/login/index.dart' as login;
import 'mores/index.dart' as mores;
import 'package:flutter_app/orders/orders.dart' as orders;
import 'package:flutter_app/mine/index.dart' as mine;

var foodBreakfast=[];
var foodLunch=[];
var foodDinner=[];
var foodNightingAle=[];
var foodFruit=[];
var foodBreakfastIndex,foodLunchIndex,foodDinnerIndex,foodNightingAleIndex,foodFruitIndex;

var marketDrink=[];
var marketNoodle=[];
var marketPartner=[];
var marketSmoke=[];
var marketDrinkIndex,marketNoodleIndex,marketPartnerIndex,marketSmokeIndex;

var screenWidth ,screenHeight;


var menuFood = [foodBreakfast,foodLunch,foodDinner,foodNightingAle,foodFruit];
var menuMarket = [marketDrink,marketNoodle,marketPartner,marketSmoke];

// 超市和餐饮的广告条初始高度
var adImgHeight = 130.0;
var adSmImgHeight = 130.0;
// 购物车总商品数量
var shoppingCount = 0;
// 购物车中某类产品数量
var shoppingList = <Map<String,int>>[];

//求解抛物线方程
Map<String,double> beizer({double startX,double startY,double referenceX,double referenceY,double endX,double endY}){
  var a1 = -1*startX*startX + referenceX*referenceX;
  var b1 = -1*startX + referenceX;
  var d1 = -1*startY + referenceY;

  var a2 = -1*referenceX*referenceX + endX*endX;
  var b2 = -1*referenceX + endX;
  var d2 = -1*referenceY + endY;

  var b3 = -1*(b2/b1);
  var a3 = b3*a1 + a2;
  var d3 =b3*d1 + d2;

  var a = d3 / a3;
  var b = (d1 - a1*a) / b1;
  var c = startY - a*startX*startX - b*startX;
  return {'a':a,'b':b,'c':c};
}

// global routes
Map<String,WidgetBuilder> allRoutes(BuildContext context){
  return {
    '/forgot_pwd': (context) => login.ForgotPwd(),
    '/home': (context) => lists.Home(),
    '/mores/memberCenter': (context) => mores.Member(),
    '/mores/sendWater' : (context) => mores.WaterSend(),
    '/mores/express' : (context) => mores.Express(),
    '/mine/orders' : (context) => orders.Orders(),
    '/mine/addr' : (context) => mine.Addr(),
    '/mine/addrSelect' : (context) => mine.AddrSelect(),
    '/mine/balance' : (context) => mine.Balance(),
    '/mine/balance/recharge' : (context) => mine.Recharge(),
    '/mine/balance/relateOrders' : (context) => mine.RelateOrders(),
    '/mine/discount' : (context) => mine.Discount(),
    '/mine/acct' : (context) => mine.AcctSet(),
    '/mine/acct/changePhone' : (context) => mine.PhoneUpdate(),
    '/mine/acct/changePayPwd' : (context) => mine.PayPwdUpdate(),
    '/lists/cart' : (context) => lists.Cart()
  };
}

// more->memberCenter->vip->currentIdx
int currentVipGridIndex = 0;
int currentVoucherIndex = 0;

// pay channel
int initPayChannel = 0;

var  globalAddr = ['常用地址'];
var globalVar = ['hello'];