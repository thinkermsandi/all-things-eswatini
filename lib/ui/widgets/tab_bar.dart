import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final TabController _tabController;
  final List<Widget> _tabs;

  const CustomTabBar({
    Key key,
    @required TabController tabController,
    @required List<Widget> tabs,
  }) : _tabController = tabController,
        _tabs = tabs,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: TabBar(
        controller: _tabController,
        isScrollable: true,
        tabs: _tabs.toList(),
        labelColor: Colors.black,
        labelPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
        labelStyle: Theme.of(context).textTheme.body2,
        unselectedLabelColor: Colors.grey,
        indicator: UnderlineTabIndicator(
          borderSide: const BorderSide(
            width: 4.0,
            color: const Color(0xFF00C6FF),
          ),
          insets: const EdgeInsets.only(right: 80.0, left: 10.0),
        ),
      ),
    );
  }

}