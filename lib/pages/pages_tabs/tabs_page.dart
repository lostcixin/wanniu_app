import 'dart:io';
import 'dart:ui';

import 'package:wanniu_app/components/components_index.dart';
import 'package:wanniu_app/components/toast.dart';
import 'package:wanniu_app/pages/pages_tabs/cart_page.dart';
import 'package:wanniu_app/pages/pages_tabs/category_page.dart';
import 'package:wanniu_app/pages/pages_tabs/home_page.dart';
import 'package:wanniu_app/pages/pages_tabs/member_page.dart';

import '../../components/background.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  PageController _pageController = PageController(
    initialPage: 0,
  );
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;
  List<Map> drawerlist = [
    {'img': 'assets/images/qianming.png', 'title': '签名'},
    {'img': 'assets/images/phone2.png', 'title': '0.36元'},
    {'img': 'assets/images/wallet.png', 'title': '15234675241'},
    {'img': 'assets/images/tixian.png', 'title': '提现'},
    {'img': 'assets/images/chongzhi.png', 'title': '充值'},
    {'img': 'assets/images/renzheng.png', 'title': '认证'},
    {'img': 'assets/images/headpic.png', 'title': '更换头像'},
    {'img': 'assets/images/beijing.png', 'title': '更换背景图片'},
    {'img': 'assets/images/misson.png', 'title': '我的任务进度'},
    {'img': 'assets/images/logout.png', 'title': '退出登录'},
  ];
  void showDrawer() {
    _scaffoldkey.currentState.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Background(
      child: Scaffold(
          key: _scaffoldkey,
          body: PageView(
            controller: _pageController,
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            children: [
              HomePage(showDrawer: showDrawer),
              CategoryPage(),
              CartPage(),
              MemberPage(),
            ],
          ),
          drawer: _drawer(),
          bottomNavigationBar: _buildBottomNavigationBar(context)),
    );
  }

  Widget _drawer() {
    return Drawer(
        child: Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(25), top: ScreenUtil().setWidth(53)),
          height: ScreenUtil().setWidth(227),
          child: Row(
            children: <Widget>[
              ClipOval(
                child: Image.network(
                  'https://img2.woyaogexing.com/2019/12/26/185b5768c355408bbfc987bdfc02a1f4!400x400.jpeg',
                  width: ScreenUtil().setWidth(115),
                  height: ScreenUtil().setWidth(115),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: ScreenUtil().setWidth(13)),
              Text(
                'HelloWord',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(30),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                AppColors.LinearGradientStartColor,
                AppColors.LinearGradientEndColor,
              ],
            ),
          ),
        ),
        Expanded(
          child: Background(
            child: Column(
              children: this
                  .drawerlist
                  .map((item) =>
                      menuItem(img: item['img'], title: item['title']))
                  .toList(),
            ),
          ),
        ),
      ],
    ));
  }

  Widget menuItem({String img, String title}) {
    return Container(
        height: ScreenUtil().setWidth(72),
        margin: EdgeInsets.fromLTRB(
            ScreenUtil().setWidth(20), 0, ScreenUtil().setWidth(13), 0),
        child: Row(
          children: <Widget>[
            Image.asset(
              img,
              width: ScreenUtil().setWidth(48),
              height: ScreenUtil().setWidth(48),
            ),
            Text(title,
                style: TextStyle(
                    color: Color(0XFF181818), fontSize: ScreenUtil().setSp(24)))
          ],
        ),
        decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: Color(0XFFD4D4D4))),
        ));
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
                      Background(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              _buildBottomItem(
                                  icon: Image.asset(
                                      "assets/images/home-outline.png",
                                      width: ScreenUtil().setWidth(54),
                                      height: ScreenUtil().setHeight(54)),
                                  activeIcon: Image.asset(
                                      "assets/images/home.png",
                                      width: ScreenUtil().setWidth(54),
                                      height: ScreenUtil().setHeight(54)),
                                  text: '首页',
                                  index: 0),
                              _buildBottomItem(
                                  icon: Image.asset(
                                      "assets/images/dongta-outline.png",
                                      width: ScreenUtil().setWidth(54),
                                      height: ScreenUtil().setHeight(54)),
                                  activeIcon: Image.asset(
                                      "assets/images/dongtai.png",
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
                                  icon: Image.asset(
                                      "assets/images/message-outline.png",
                                      width: ScreenUtil().setWidth(54),
                                      height: ScreenUtil().setHeight(54)),
                                  activeIcon: Image.asset(
                                      "assets/images/message.png",
                                      width: ScreenUtil().setWidth(54),
                                      height: ScreenUtil().setHeight(54)),
                                  text: '消息',
                                  index: 2),
                              _buildBottomItem(
                                  icon: Image.asset(
                                      "assets/images/mine-outline.png",
                                      width: ScreenUtil().setWidth(54),
                                      height: ScreenUtil().setHeight(54)),
                                  activeIcon: Image.asset(
                                      "assets/images/mine.png",
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

  Widget _buildBottomItem(
      {Image icon, Image activeIcon, String text, int index}) {
    Color color =
        currentIndex == index ? Theme.of(context).primaryColor : Colors.grey;
    return Expanded(
        child: InkResponse(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  currentIndex == index ? activeIcon : icon,
                  // Image.asset(, color: color, width: 22.0, height: 22.0),
                  SizedBox(height: ScreenUtil().setHeight(14)),
                  Text(text, style: TextStyle(color: color, fontSize: 10.0))
                ]),
            onTap: () {
              _pageController.jumpToPage(index);
              setState(() => currentIndex = index);
            }));
  }
}
