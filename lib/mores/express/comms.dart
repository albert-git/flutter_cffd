import 'package:flutter/material.dart';
import 'package:flutter_app/comms/commCfg.dart' as comms;

final membersTabBar = [
  comms.tabPageBarItem(imgPath:null,
      labelTxt:'物流信息',imgContainerH: 35,imgW: 0,imgH: 0,
      imgContainerMarginTop: 5.0,txtSize: 20,rowOrColumn: 'r'
  ),
  comms.tabPageBarItem(imgPath:null,
      labelTxt:'地质信息',imgContainerMarginBottom: 5,imgContainerH: 35,imgW: 0,imgH: 0,
      imgContainerMarginTop: 5.0,txtSize: 20,rowOrColumn: 'r'
  ),
];