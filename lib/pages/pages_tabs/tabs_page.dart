import 'dart:io';

import 'package:wanniu_app/components/components_index.dart';
import 'package:wanniu_app/components/toast.dart';
import 'package:wanniu_app/pages/pages_tabs/cart_page.dart';
import 'package:wanniu_app/pages/pages_tabs/category_page.dart';
import 'package:wanniu_app/pages/pages_tabs/home_page.dart';
import 'package:wanniu_app/pages/pages_tabs/member_page.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  PageController _pageController = PageController(
    initialPage: 0,
  );
  final List<Widget> tabsPages = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Background(
      child: Scaffold(
          body: PageView(
            controller: _pageController,
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            children: tabsPages,
          ),
          bottomNavigationBar: _buildBottomNavigationBar(context)),
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
                          color: Colors.transparent,
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              _buildBottomItem(
                                  icon: Image.asset("assets/images/home.png",
                                      width: ScreenUtil().setWidth(54),
                                      height: ScreenUtil().setHeight(54)),
                                  text: '首页',
                                  index: 0),
                              _buildBottomItem(
                                  icon: Image.asset("assets/images/dongtai.png",
                                      width: ScreenUtil().setWidth(54),
                                      height: ScreenUtil().setHeight(54)),
                                  text: '动态',
                                  index: 1),
                              _buildBottomPubItem(
                                  Image.asset("assets/images/release.png",
                                      width: ScreenUtil().setWidth(100),
                                      height: ScreenUtil().setHeight(100)),
                                  context),
                              _buildBottomItem(
                                  icon: Image.asset("assets/images/message.png",
                                      width: ScreenUtil().setWidth(54),
                                      height: ScreenUtil().setHeight(54)),
                                  text: '消息',
                                  index: 2),
                              _buildBottomItem(
                                  icon: Image.asset("assets/images/mine.png",
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
        currentIndex == index ? Theme.of(context).primaryColor : Colors.grey;
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
              setState(() => currentIndex = index);
            }));
  }
}
