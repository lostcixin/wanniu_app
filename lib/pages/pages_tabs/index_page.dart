import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wanniu_app/components/components_index.dart';
import 'package:wanniu_app/pages/pages_tabs/navigation.dart';

import 'home_page.dart';
import 'cart_page.dart';
import 'category_page.dart';
import 'member_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List tabBodies = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage(),
  ];

  int currentIndex = 0;
  var currentPage;

  @override
  void initState() {
    // TODO: implement initState
    currentPage = tabBodies[currentIndex];
    super.initState();
  }

  List<Widget> _bottomNavPages = List(); // 底部导航栏各个可切换页面组

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    //   final List<BottomNavigationBarItem> bottomTabs = [
    //   BottomNavigationBarItem(
    //     icon:Image.asset("images/lab-button-shouye-sel.png",width: ScreenUtil().setWidth(54),height:ScreenUtil().setHeight(54)),
    //     title: Text("首页"),
    //   ),
    //   BottomNavigationBarItem(
    //     icon: Image.asset("images/lab-button-dongta-unc.png",width:ScreenUtil().setWidth(54),height:ScreenUtil().setHeight(54)),
    //     title: Text("动态"),
    //   ),
    //   BottomNavigationBarItem(
    //     icon: Image.asset("images/fabu.png",width:ScreenUtil().setWidth(100),height:ScreenUtil().setHeight(100)),
    //     title: Text(""),

    //   ),
    //   BottomNavigationBarItem(
    //     icon: Image.asset("images/lab-button-xiaoxi.png",width:ScreenUtil().setWidth(54),height:ScreenUtil().setHeight(54)),
    //     title: Text("消息"),
    //   ),
    //   BottomNavigationBarItem(
    //     icon: Image.asset("images/lab-button-wode.png",width:ScreenUtil().setWidth(54),height:ScreenUtil().setHeight(54)),
    //     title: Text("我的"),
    //   )
    // ];

    return Background(
        child: Scaffold(
      body: Navigation(),
      drawer: Drawer(
          child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: DrawerHeader(
                  child: Text("你好flutter"),
                ),
              )
            ],
          ),
          ListTile(
              leading: CircleAvatar(child: Icon(Icons.home)),
              title: Text("我的空间")),
          Divider(),
          ListTile(
              leading: CircleAvatar(child: Icon(Icons.person)),
              title: Text("用户中心")),
          Divider(),
          ListTile(
              leading: CircleAvatar(child: Icon(Icons.settings)),
              title: Text("设置中心"))
        ],
      )),
    ));
  }
}
