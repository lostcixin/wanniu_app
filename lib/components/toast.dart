import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
/**
 * 利用overlay实现Toast
 */

List pubList = ["发布动态", "发布悬赏", "发布创客", "发布投融", "发布认知"];

class Toast {
  static OverlayEntry weixinOverlayEntry;
  static var timer;
  static final _showTimer = (context) {
    timer = Timer.periodic(Duration(milliseconds: 3000), (t) {
      weixinOverlayEntry.remove();
      t.cancel(); //取消定时器   timer.cancel();
    });
  };

  static void showWeixinButtonView(context) {
    _showTimer(context);

    weixinOverlayEntry = new OverlayEntry(builder: (context) {
      return Positioned(
          // top: kToolbarHeight,
          top: 0,
          right: 0,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: new SafeArea(
              child: new Material(
                  type: MaterialType.transparency,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      InkWell(
                          onTap: () {
                            timer.cancel();
                            weixinOverlayEntry.remove();
                          },
                          child: Opacity(
                            opacity: 0.5,
                            child: Container(
                              color: Colors.black,
                            ),
                          )),
                      Positioned(
                        bottom: ScreenUtil().setHeight(112),
                        child: Container(
                          width: ScreenUtil().setWidth(400),
                          height: ScreenUtil().setHeight(404),
                          color: Colors.white,
                          child: ListView.separated(
                            // shrinkWrap: true, //解决无限高度问题
                            physics: NeverScrollableScrollPhysics(), //禁用滑动事件
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                  padding: EdgeInsets.only(
                                      left: ScreenUtil().setWidth(30),
                                      right: ScreenUtil().setWidth(30)),
                                  child: InkWell(
                                      onTap: (){
                                        print("${pubList[index]} 发布。。。");
                                      },
                                      child: SizedBox(
                                      height: ScreenUtil().setHeight(80),
                                      child:Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(pubList[index],
                                              style: TextStyle(
                                                  color: Colors.black)),
                                            Image.asset("images/pub_right_icon.png",width: ScreenUtil().setWidth(42),height: ScreenUtil().setHeight(42),fit: BoxFit.cover)
                                        ]),
                                    )
                                  ));
                            },
                            itemCount: pubList.length,
                            //分割器构造器
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return Divider(color: Colors.grey, height: 1);
                            },
                          ),
                        ),
                      )
                    ],
                  ))));
    });

    Overlay.of(context).insert(weixinOverlayEntry);
  }
}
