import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_study/bottom_bar/animation_bar.dart';
import 'package:provider_study/home/home_page.dart';
import 'package:provider_study/location/app_localizations.dart';
import 'package:provider_study/project/project_page.dart';
import 'package:provider_study/user_setting/user_setting_page.dart';

import 'bar_pro.dart';

// class BottomRoutePage extends StatefulWidget {
//   @override
//   _BottomRoutePageState createState() => _BottomRoutePageState();
// }
//
// class _BottomRoutePageState extends State<BottomRoutePage> {
//   List<Widget> pages = <Widget>[HomePage(), ProjectPage(), UserSettingPage()];
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//     var _pageController = PageController();
//     int _selectedIndex = 0;
//
//     @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//         body: PageView.builder(
//           itemBuilder: (ctx, index) => pages[index],
//           itemCount: pages.length,
//           controller: _pageController,
//           physics: NeverScrollableScrollPhysics(),
//           onPageChanged: (index) {
//             setState(() {
//               _selectedIndex = index;
//             });
//           },
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           items: <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               title: Text(AppLocalizations.of(context).translate('bar_home')),
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.format_list_bulleted),
//               title:
//                   Text(AppLocalizations.of(context).translate('bar_project')),
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.insert_emoticon),
//               title:
//                   Text(AppLocalizations.of(context).translate('bar_setting')),
//             ),
//           ],
//           currentIndex: _selectedIndex,
//           onTap: (index) {
//             _pageController.jumpToPage(index);
//           },
//         ),
//       );
//     }
// }
class BottomRoutePage extends StatefulWidget {
  @override
  _BottomRoutePageState createState() => _BottomRoutePageState();
}

class _BottomRoutePageState extends State<BottomRoutePage> {
  List<Widget> pages = <Widget>[HomePage(), ProjectPage(), UserSettingPage()];
  BottomBarPro bottomBarPro;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bottomBarPro = Provider.of<BottomBarPro>(context);
  }

  @override
  Widget build(BuildContext context) {
    final List<BarItem> barIitems = [
      BarItem(AppLocalizations.of(context).translate('bar_home'), Icons.home,
          Color(0xFF498AEF)),
      BarItem(AppLocalizations.of(context).translate('bar_project'),
          Icons.format_list_bulleted, Colors.pinkAccent),
      BarItem(AppLocalizations.of(context).translate('bar_setting'),
          Icons.insert_emoticon, Colors.teal),
    ];
    print(bottomBarPro.bottomBarIndex);
    return Scaffold(
      body: IndexedStack(
        index: bottomBarPro.bottomBarIndex,
        children: pages,
      ),
      bottomNavigationBar: AnimationBottomBar(
          barItems: barIitems,
          animationDuration: const Duration(milliseconds: 550),
          barStyle: BarStyle(
              fointSize: 20.0, fontWeight: FontWeight.w400, iconSize: 30.0),
          bottomBarPro: bottomBarPro),
    );
  }
}
