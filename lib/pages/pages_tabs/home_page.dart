import "package:flutter/material.dart";

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  initState() {
    super.initState();
    // print(ScreenUtil.screenHeight);
  }

  List<Map> navigatorList = [
    {'image': 'images/home-button-xuanshag.png', 'name': '悬赏'},
    {'image': 'images/home-button-chuangke.png', 'name': '创客'},
    {'image': 'images/home-button-tourong.png', 'name': '投融'},
    {'image': 'images/home-button-zhishi.png', 'name': '认知'},
    {'image': 'images/home-button-xinwen.png', 'name': '新闻'},
    {'image': 'images/home-button-gengduo.png', 'name': '更多'},
  ];
  List<Map> rewardList = [
    {
      'title': '电商网站制作1',
      'intro': '婴儿护肤类',
      'duration': "15:25:30",
      "price": "1000",
      "view_count": "2333"
    },
    {
      'title': '电商网站制作2',
      'intro': '婴儿护肤类',
      'duration': "15:25:30",
      "price": "1000",
      "view_count": "2333"
    },
    {
      'title': '电商网站制作3',
      'intro': '婴儿护肤类',
      'duration': "15:25:30",
      "price": "1000",
      "view_count": "2333"
    },
    {
      'title': '电商网站制作4',
      'intro': '婴儿护肤类',
      'duration': "15:25:30",
      "price": "1000",
      "view_count": "2333"
    },
    {
      'title': '电商网站制作5',
      'intro': '婴儿护肤类',
      'duration': "15:25:30",
      "price": "1000",
      "view_count": "2333"
    },
    {
      'title': '电商网站制作5',
      'intro': '婴儿护肤类',
      'duration': "15:25:30",
      "price": "1000",
      "view_count": "2333"
    },
    {
      'title': '电商网站制作5',
      'intro': '婴儿护肤类',
      'duration': "15:25:30",
      "price": "1000",
      "view_count": "2333"
    },
  ];

  @override
  Widget build(BuildContext context) {

    return ListView(children: <Widget>[
          SwiperDiy(),
          Navigator(navigatorList: this.navigatorList),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(left: ScreenUtil().setWidth(60)),
                      padding:
                          EdgeInsets.only(bottom: ScreenUtil().setHeight(24)),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 2,
                                  color: Color.fromRGBO(39, 111, 255, 1)))),
                      child: GradientText(
                        '悬赏',
                        ScreenUtil().setWidth(32),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(43, 116, 228, 1),
                            Color.fromRGBO(25, 29, 134, 1),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      )),
                  Container(
                      margin: EdgeInsets.only(right: ScreenUtil().setWidth(60)),
                      width: ScreenUtil().setWidth(230),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                              width: ScreenUtil().setWidth(104),
                              height: ScreenUtil().setHeight(50),
                              child: FlatButton(
                                  // padding: EdgeInsets.only(left: 2, right: 2),
                                  child: Text("城市"),
                                  onPressed: () {},
                                  color: Colors.grey[100],
                                  // splashColor: Colors.blue,
                                  textColor: Color.fromRGBO(106, 110, 116, 1),
                                  padding: EdgeInsets.all(0.0),
                                  shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ))),
                          SizedBox(width: ScreenUtil().setWidth(22)),
                          SizedBox(
                              width: ScreenUtil().setWidth(104),
                              height: ScreenUtil().setHeight(50),
                              child: FlatButton(
                                  child: Text("行业"),
                                  onPressed: () {},
                                  color: Colors.grey[100],
                                  // splashColor: Colors.blue,
                                  textColor: Color.fromRGBO(106, 110, 116, 1),
                                  padding: EdgeInsets.all(0.0),
                                  shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  )))
                        ],
                      )),
                ],
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(
                      ScreenUtil().setHeight(60), 10, 0, 10),
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              width: 1, color: Colors.grey.withAlpha(30)),
                          bottom: BorderSide(
                              width: 1, color: Colors.grey.withAlpha(30)))),
                  child: Row(
                    children: <Widget>[
                      Text("热度",
                          style:
                              TextStyle(fontSize: ScreenUtil().setWidth(25))),
                      Text("时间",
                          style: TextStyle(fontSize: ScreenUtil().setWidth(25)))
                    ],
                  )),
            ],
          ),
          Container(
              padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(60),
                  right: ScreenUtil().setWidth(60)),
              child: ListView.separated(
                shrinkWrap: true, //解决无限高度问题
                physics: NeverScrollableScrollPhysics(), //禁用滑动事件
                itemBuilder: (BuildContext context, int index) {
                  return RewardItem(rewardList[index]);
                  // return ListTile(title: Text("$index"));
                },
                itemCount: rewardList.length,
                //分割器构造器
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(color: Colors.grey, height: 1);
                },
              )),
        ]);
  }
}

//首页轮播组件
class SwiperDiy extends StatelessWidget {
  List<Map> list = [
    {"url": "https://www.itying.com/images/flutter/1.png"},
    {"url": "https://www.itying.com/images/flutter/2.png"},
    {"url": "https://www.itying.com/images/flutter/3.png"}
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: AspectRatio(
          aspectRatio: 375 / 163,
          child: new Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Image.network(this.list[index]["url"],
                    fit: BoxFit.cover);
              },
              itemCount: list.length,
              pagination: new SwiperPagination(),
              autoplay: true,
              control: new SwiperControl())),
    );
  }
}

// 首页导航区
class Navigator extends StatefulWidget {
  final List navigatorList;

  Navigator({Key key, this.navigatorList}) : super(key: key);

  @override
  _NavigatorState createState() => _NavigatorState();
}

class _NavigatorState extends State<Navigator> {
  List<Map> moreNavigatorList = [
    {'image': 'images/home-button-gongxinang.png', 'name': '共享'},
    {'image': 'images/home-button-baoxian.png', 'name': '保险'},
    {'image': 'images/jijin.png', 'name': '基金'},
  ];

  Widget _wrapViewItemUI(BuildContext context, item) {
    return InkWell(
      onTap: () {
        if (item['name'] == '更多') {
          if (widget.navigatorList.length > 6) {
            setState(() {
              widget.navigatorList.removeRange(6, widget.navigatorList.length);
            });
          } else {
            setState(() {
              widget.navigatorList.addAll(this.moreNavigatorList);
            });
          }
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Image.asset(item['image'],
              width: ScreenUtil().setWidth(50),
              height: ScreenUtil().setHeight(50),
              fit: BoxFit.cover),
          SizedBox(height: ScreenUtil().setHeight(7)),
          Text(
            item['name'],
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(
            ScreenUtil().setWidth(130), 40, ScreenUtil().setWidth(130), 40),
        child: Wrap(
            alignment: WrapAlignment.spaceEvenly,
            // runAlignment: WrapAlignment.start,
            spacing: ScreenUtil().setWidth(170),
            runSpacing: ScreenUtil().setHeight(32),
            children: widget.navigatorList.map((item) {
              return _wrapViewItemUI(context, item);
            }).toList()));
  }
}

// 文字渐变
class GradientText extends StatelessWidget {
  GradientText(
    this.text,
    this.fontSize, {
    @required this.gradient,
  });

  final String text;
  final double fontSize;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: TextStyle(
          // The color must be set to white for this to work
          color: Colors.white,
          fontSize: fontSize,
        ),
      ),
    );
  }
}

// 首页悬赏列表
class RewardItem extends StatefulWidget {
  final Map item;
  RewardItem(this.item);

  @override
  _RewardItemState createState() => _RewardItemState();
}

class _RewardItemState extends State<RewardItem> {
  Widget _RewardItemTile(item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: <Widget>[
            Text(
              "${item["title"]}",
              style: TextStyle(
                  fontSize: ScreenUtil().setWidth(32),
                  color: Color.fromRGBO(24, 32, 40, 1),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(width: ScreenUtil().setWidth(20)),
            Image.asset("images/home-icon-yirenzheng.png",
                width: 16, height: 16),
          ],
        ),
        SizedBox(
          height: ScreenUtil().setHeight(32),
        ),
        SizedBox(
            width: ScreenUtil().setWidth(200),
            child: Text("简介 : ${item["intro"]}",
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: TextStyle(
                    color: Colors.grey, fontSize: ScreenUtil().setWidth(20)))),
        SizedBox(
          height: ScreenUtil().setHeight(20),
        ),
        SizedBox(
            width: ScreenUtil().setWidth(200),
            child: Text("时效 : ${item["duration"]}",
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: TextStyle(
                    color: Colors.grey, fontSize: ScreenUtil().setWidth(20))))
      ],
    );
  }

  Widget _RewardItemAction(item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text('${item["price"]}',
            style: TextStyle(
                color: Colors.red, fontSize: ScreenUtil().setWidth(30))),
        SizedBox(height: ScreenUtil().setHeight(14)),
        InkWell(
            child: Container(
                width: ScreenUtil().setWidth(138),
                height: ScreenUtil().setHeight(45),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(
                      begin: Alignment(0, -1),
                      end: Alignment(0, 1.0),
                      colors: [
                        const Color.fromRGBO(43, 116, 228, 1),
                        const Color.fromRGBO(25, 29, 134, 1)
                      ]),
                ),
                child: Text("立即认领",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setWidth(20)))),
            onTap: () {
              print("点击了立即认领");
            }),
        SizedBox(height: ScreenUtil().setHeight(18)),
        Row(
          children: <Widget>[
            Text(
              "${item["view_count"]}人",
              style: TextStyle(
                  color: Color.fromRGBO(106, 110, 116, 1),
                  fontSize: ScreenUtil().setWidth(16)),
            ),
            SizedBox(width: ScreenUtil().setWidth(32)),
            Image.asset("images/home-icon-shangjin.png"),
            SizedBox(width: ScreenUtil().setWidth(8)),
            Text(
              "已交赏金",
              style: TextStyle(
                  color: Color.fromRGBO(147, 154, 166, 1),
                  fontSize: ScreenUtil().setWidth(20)),
            )
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            top: ScreenUtil().setHeight(22),
            bottom: ScreenUtil().setHeight(32)),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: _RewardItemTile(widget.item),
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: _RewardItemAction(widget.item),
              )
            ]));
  }
}
