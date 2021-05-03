import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider_study/main_manager/route_manager.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  AnimationController _logoController;
  Animation<double> _animation;
  AnimationController _countdownController;

  @override
  void initState() {
    // vsync 是用來 dispose controller 並設定時間。
    _logoController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    // 定義 起點、終點和動畫樣式(非線性曲線.)。
    _animation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(curve: Curves.easeInOutBack, parent: _logoController));

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _logoController.reverse(); //動畫在開始時就停止的狀態動畫反向執行（從後往前）
      } else if (status == AnimationStatus.dismissed) {
        _logoController.forward(); // 動畫在結束時動畫正常執行（從前往後）
      }
    });
    _logoController.forward();

    _countdownController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    _countdownController.forward();
    super.initState();
  }

  /// AnimationController disposse
  @override
  void dispose() {
    _logoController.dispose();
    _countdownController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () => Future.value(false),
        // StackFit.expand 擴張到和 Stack 大小
        child: Stack(fit: StackFit.expand, children: <Widget>[
          Image.asset('assets/images/splash_bg_dark.png', fit: BoxFit.fill),
          AnimatedFlutterLogo(
            animation: _animation,
          ),
          Align(
            alignment: Alignment(0.0, 0.7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                AnimatedAndroidLogo(
                  animation: _animation,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SafeArea(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(RouteName.tab);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  margin: EdgeInsets.only(right: 20, bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.black.withAlpha(100),
                  ),
                  child: AnimatedCountdown(
                    context: context,
                    animation: StepTween(begin: 3, end: 0)
                        .animate(_countdownController),
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

class AnimatedCountdown extends AnimatedWidget {
  final Animation<int> animation;

  AnimatedCountdown({key, this.animation, context})
      : super(key: key, listenable: animation) {
    this.animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacementNamed(RouteName.tab);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var value = animation.value + 1;
    return Text(value.toString());
  }
}

class AnimatedFlutterLogo extends AnimatedWidget {
  AnimatedFlutterLogo({
    Key key,
    Animation<double> animation,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return AnimatedAlign(
      duration: Duration(milliseconds: 10),
      // alignment  x= -1~1 y = -1~1
      // 絕對位置
      alignment: Alignment(0.0, 0.2 + animation.value * 0.8),
      curve: Curves.bounceOut,
      child: Image.asset(
        'assets/images/splash_flutter.png',
        width: 280,
        height: 120,
      ),
    );
  }
}

class AnimatedAndroidLogo extends AnimatedWidget {
  AnimatedAndroidLogo({
    Key key,
    Animation<double> animation,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    // 讓他有左右感覺的 row
    return Row(
      children: <Widget>[
        // Image.asset 的原健會依據大小變化，所以這邊 他會
        Image.asset(
          'assets/images/splash_fun.png',
          width: 140 * animation.value,
          height: 80 * animation.value,
        ),
        Image.asset(
          'assets/images/splash_android.png',
          width: 200 * (1 - animation.value),
          height: 80 * (1 - animation.value),
        ),
      ],
    );
  }
}
