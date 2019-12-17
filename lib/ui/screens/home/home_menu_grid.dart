import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:all_things_eswatini/ui/screens/home/home_menu_grid_item.dart';
import 'package:all_things_eswatini/model/menu.dart';
import 'package:all_things_eswatini/util/navigation_utils.dart';

class HomeMenuGrid extends StatelessWidget{

  void _goToPage(BuildContext context, Menu menu) {
    Widget widget = findRoute(menu.route);
    materialNavigateTo(context, widget);
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    final crossAxisChildCount = isPortrait ? 4 : 6;

    final List<Menu> menus = [
      new Menu(context: context, title: "Weather", route: "/weather", icon: FontAwesomeIcons.cloud, image: "", menuColor: Colors.blue),
      new Menu(context: context, title: "News", route: "/news", icon: FontAwesomeIcons.newspaper, image: "", menuColor: Colors.orange),
      new Menu(context: context, title: "TV", route: "/tv", icon: FontAwesomeIcons.tv, image: "", menuColor: Colors.purple),
      new Menu(context: context, title: "Apps", route: "/apps", icon: FontAwesomeIcons.appStore, image: "", menuColor: Colors.indigo),
      new Menu(context: context, title: "Jobs", route: "/jobs", icon: FontAwesomeIcons.briefcase, image: "", menuColor: Colors.red),
    ];

    return new Container(
      child: new GridView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        padding: const EdgeInsets.only(top: 12.0, bottom: 12.0, left: 12.0, right: 12.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisChildCount,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          childAspectRatio: 2 / 3,
        ),
        itemCount: menus.length,
        itemBuilder: (context, i) => new HomeMenuGridItem(menu: menus[i], onTapped: () => _goToPage(context, menus[i])),
      ),
    );

  }

}