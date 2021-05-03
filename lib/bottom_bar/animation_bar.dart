import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_study/bottom_bar/bar_pro.dart';
class AnimationBottomBar extends StatefulWidget {
  final List<BarItem> barItems;
  final Duration animationDuration;
  final BarStyle barStyle;
  final BottomBarPro bottomBarPro;
  const AnimationBottomBar(
      {Key key,
        this.barItems,
        this.animationDuration = const Duration(milliseconds: 500),
        this.barStyle,
      this.bottomBarPro})
      : super(key: key);

  @override
  _AnimationBottomBarState createState() => _AnimationBottomBarState();
}

class _AnimationBottomBarState extends State<AnimationBottomBar>
    with TickerProviderStateMixin {
  int selectedBarIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      child: Padding(
        padding: const EdgeInsets.only(
            bottom: 10.0, top: 10.0, left: 16.0, right: 16.0),
        child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _buildBarItems()),
      ),
    );
  }

  List<Widget> _buildBarItems() {
    List<Widget> _barItems = List();
    for (int i = 0; i < widget.barItems.length; i++) {
      BarItem item = widget.barItems[i];

      bool isSelected = selectedBarIndex == i;
      _barItems.add(inkWellButtonNoBadge(i, isSelected, item));
    }
    return _barItems;
  }

  InkWell inkWellButtonNoBadge(int i, bool isSelected, BarItem item) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        setState(() {
          selectedBarIndex = i;
          // var model = Provider.of<BottomBarPro>(context);
          // model.onTap(selectedBarIndex);
          // widget.onBarTab(selectedBarIndex);
          // widget.bottomBarBloc.add(new ChangeBottomBarEvent(pageNumber: selectedBarIndex));
          widget.bottomBarPro.onTap(selectedBarIndex);
        });
      },
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        duration: widget.animationDuration,
        decoration: BoxDecoration(
            color:
            isSelected ? item.color.withOpacity(0.15) : Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
        child: Row(
          children: <Widget>[
            Icon(
              item.iconData,
              color: isSelected ? item.color : Colors.black,
              size: widget.barStyle.iconSize,
            ),
            SizedBox(
              width: 10.0,
            ),
            AnimatedSize(
              duration: widget.animationDuration,
              curve: Curves.easeInOut,
              vsync: this,
              child: Text(
                isSelected ? item.text : "",
                style: TextStyle(
                    color: item.color,
                    fontWeight: widget.barStyle.fontWeight,
                    fontSize: widget.barStyle.fointSize),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BarStyle {
  final double fointSize, iconSize;
  final FontWeight fontWeight;

  BarStyle(
      {this.fointSize = 18.0,
        this.iconSize = 32.0,
        this.fontWeight = FontWeight.w600});
}

class BarItem {
  final String text;
  final IconData iconData;
  final Color color;

  BarItem(this.text, this.iconData, this.color);
}