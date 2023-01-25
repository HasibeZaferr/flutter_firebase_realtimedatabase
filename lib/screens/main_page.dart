import 'package:flutter/material.dart';
import 'package:learn_flutter/screens/events_page.dart';
import 'package:learn_flutter/screens/learn_page.dart';
import 'package:learn_flutter/screens/watch_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../utilities/colors.dart';
import '../utilities/constant.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PersistentTabController? _controller;
  int? selectedIndex;

  @override
  void initState() {
    _controller = PersistentTabController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        navBarHeight: 70,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: false,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style8,
        onItemSelected: (final index) {
          setState(() {
            _controller?.index = index;
          });
        },
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      const LearnPage(),
      const WatchPage(),
      const EventsPage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Column(
          children: [
            SizedBox(
              height: bottomBarIconHeight,
              child: Image.asset(
                iconPathLearn,
              ),
            ),
          ],
        ),
        inactiveIcon: Column(
          children: [
            SizedBox(
              height: bottomBarIconHeight,
              child: Image.asset(
                iconPathLearn,
              ),
            ),
          ],
        ),
        title: ('Learn'),
        activeColorPrimary: colorBottomNavigationActiveTitle,
        inactiveColorPrimary: colorBottomNavigationInactiveTitle,
      ),
      PersistentBottomNavBarItem(
        icon: Column(
          children: [
            SizedBox(
              height: bottomBarIconHeight,
              child: Image.asset(
                iconPathWatch,
              ),
            ),
          ],
        ),
        inactiveIcon: Column(
          children: [
            SizedBox(
              height: bottomBarIconHeight,
              child: Image.asset(
                iconPathWatch,
              ),
            ),
          ],
        ),
        title: ('Watch'),
        activeColorPrimary: colorBottomNavigationActiveTitle,
        inactiveColorPrimary: colorBottomNavigationInactiveTitle,
      ),
      PersistentBottomNavBarItem(
        icon: Column(
          children: [
            SizedBox(
              height: bottomBarIconHeight,
              child: Image.asset(
                iconPathEvents,
              ),
            ),
          ],
        ),
        inactiveIcon: Column(
          children: [
            SizedBox(
              height: bottomBarIconHeight,
              child: Image.asset(
                iconPathEvents,
              ),
            ),
          ],
        ),
        title: ('Events'),
        activeColorPrimary: colorBottomNavigationActiveTitle,
        inactiveColorPrimary: colorBottomNavigationInactiveTitle,
      ),
    ];
  }
}
