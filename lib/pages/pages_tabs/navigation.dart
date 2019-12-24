import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wanniu_app/components/toast.dart';
import 'package:wanniu_app/pages/pages_tabs/cart_page.dart';
import 'package:wanniu_app/pages/pages_tabs/category_page.dart';
import 'package:wanniu_app/pages/pages_tabs/home_page.dart';
import 'package:wanniu_app/pages/pages_tabs/member_page.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;

  final List tabBodies = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage(),
  ];

  _publishDialog() async {
    var result = showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("选择发布内容"),
            children: <Widget>[
              SimpleDialogOption(
                child: ListTile(
                  title: Text("发布动态"),
                  onTap: () {
                    print('aaaaa');
                  },
                ),
              )
            ],
          );
        });

    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('navigation'),
        // ),
        // backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: tabBodies[_currentIndex],
        ),
        bottomNavigationBar: _buildBottomNavigationBar(context),
      ),
    );
  }

  Widget _buildBottomNavigationBar(context) {
    return SafeArea(
        child: SizedBox(
            height: ScreenUtil().setHeight(102),
            child: Card(
                color: Platform.isIOS ? Colors.transparent : Colors.white,
                elevation: Platform.isIOS ? 0.0 : 8.0,
                // iphone 无阴影
                shape: RoundedRectangleBorder(),
                margin: EdgeInsets.all(0.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Divider(color: Colors.grey[300], height: 0.5),
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("images/background.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              _buildBottomItem(
                                  icon: Image.asset(
                                      "images/lab-button-shouye-sel.png",
                                      width: ScreenUtil().setWidth(54),
                                      height: ScreenUtil().setHeight(54)),
                                  text: '首页',
                                  index: 0),
                              _buildBottomItem(
                                  icon: Image.asset(
                                      "images/lab-button-dongta-unc.png",
                                      width: ScreenUtil().setWidth(54),
                                      height: ScreenUtil().setHeight(54)),
                                  text: '动态',
                                  index: 1),
                              _buildBottomPubItem(
                                  Image.asset("images/fabu.png",
                                      width: ScreenUtil().setWidth(100),
                                      height: ScreenUtil().setHeight(100)),
                                  context),
                              _buildBottomItem(
                                  icon: Image.asset(
                                      "images/lab-button-xiaoxi.png",
                                      width: ScreenUtil().setWidth(54),
                                      height: ScreenUtil().setHeight(54)),
                                  text: '消息',
                                  index: 2),
                              _buildBottomItem(
                                  icon: Image.asset(
                                      "images/lab-button-wode.png",
                                      width: ScreenUtil().setWidth(54),
                                      height: ScreenUtil().setHeight(54)),
                                  text: '我的',
                                  index: 3),
                            ]),
                      )
                    ]))));
  }

  Widget _buildBottomPubItem(Image icon, context) {
    return Expanded(
      child: InkResponse(
          child: icon,
          onTap: () {
            Toast.showWeixinButtonView(context);
            // showDialog(
            //   barrierDismissible:true,
            //   context: context,
            //   builder: (context){
            //     return MyDialog(
            //       title:"关于我们",
            //       content:"关于我们"
            //     );
            //   }
            // );
          }),
    );
  }

  Widget _buildBottomItem({Image icon, String text, int index}) {
    Color color =
        _currentIndex == index ? Theme.of(context).primaryColor : Colors.grey;
    return Expanded(
        child: InkResponse(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  icon,
                  // Image.asset(, color: color, width: 22.0, height: 22.0),
                  SizedBox(height: ScreenUtil().setHeight(14)),
                  Text(text, style: TextStyle(color: color, fontSize: 10.0))
                ]),
            onTap: () {
              setState(() => _currentIndex = index);
            }));
  }
}
