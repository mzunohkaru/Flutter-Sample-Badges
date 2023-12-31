import 'package:badges/badges.dart' as badges;
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter_app_badger/icons/alarm_icon.dart';
import 'package:flutter_app_badger/icons/flag_app.dart';
import 'package:flutter_app_badger/icons/human_avatar.dart';
import 'package:flutter_app_badger/icons/instagram_message.dart';
import 'package:flutter_app_badger/sns_account_box/instagram_verified_account.dart';
import 'package:flutter_app_badger/sns_account_box/twitter_verified_account.dart';
import 'package:flutter_app_badger/icons/costom_icon.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: FlexThemeData.light(scheme: FlexScheme.blueWhale),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.blueWhale),
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _cartBadgeAmount = 3;
  late bool _showCartBadge;
  Color color = Colors.red;

  @override
  Widget build(BuildContext context) {
    _showCartBadge = _cartBadgeAmount > 0;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: _bottomNavigationBar(),
        appBar: AppBar(
          leading: badges.Badge(
            position: badges.BadgePosition.topEnd(top: 10, end: 10),
            child: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
          ),
          title: const Text('Badges Demo'),
          actions: [
            _shoppingCartBadge(),
          ],
          bottom: _tabBar(),
        ),
        body: Column(
          children: [
            _addRemoveCartButtons(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TwitterVerifiedAccount(),
                  SizedBox(width: 10),
                  InstagramVerifiedAccount(),
                ],
              ),
            ),
            const Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AlarmIcon(),
                      CustomIcon(),
                      FlagIcon(),
                      HumanAvatar(),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 36, left: 24, right: 24),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: InstagramMessage(
                          text: '初めまして〜どうたらこうたら！！！',
                          emojiReaction: '❤️',
                        ),
                      ),
                      SizedBox(height: 30),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: InstagramMessage(
                              text: 'こんにちは！やっぽー！！',
                              emojiReaction: '😆')),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _shoppingCartBadge() {
    return badges.Badge(
      position: badges.BadgePosition.topEnd(top: 0, end: 3),
      badgeAnimation: const badges.BadgeAnimation.slide(
        disappearanceFadeAnimationDuration: Duration(milliseconds: 200),
        curve: Curves.easeInCubic,
      ),
      showBadge: _showCartBadge,
      badgeStyle: badges.BadgeStyle(
        badgeColor: color,
      ),
      badgeContent: Text(
        _cartBadgeAmount.toString(),
        style: const TextStyle(color: Colors.white),
      ),
      child:
          IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () {}),
    );
  }

  PreferredSizeWidget _tabBar() {
    return TabBar(tabs: [
      Tab(
        icon: badges.Badge(
          badgeStyle: const badges.BadgeStyle(
            badgeColor: Colors.green,
          ),
          position: badges.BadgePosition.topEnd(top: -14),
          badgeAnimation: const badges.BadgeAnimation.slide(
            disappearanceFadeAnimationDuration: Duration(milliseconds: 20),
            curve: Curves.easeInOutSine,
          ),
          badgeContent: Text(
            _cartBadgeAmount.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          child: const Icon(Icons.account_balance_wallet, color: Colors.white),
        ),
      ),
      Tab(
        child: badges.Badge(
          badgeStyle: badges.BadgeStyle(
            shape: badges.BadgeShape.square,
            borderRadius: BorderRadius.circular(5),
            padding: const EdgeInsets.all(2),
            badgeGradient: const badges.BadgeGradient.linear(
              colors: [
                Colors.purple,
                Colors.blue,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          position: badges.BadgePosition.topEnd(top: -12, end: -20),
          badgeContent: const Text(
            'NEW',
            style: TextStyle(
                color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
          ),
          child: const Text(
            'music',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ]);
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        const BottomNavigationBarItem(
          label: 'Events',
          icon: Icon(Icons.dashboard),
        ),
        const BottomNavigationBarItem(
          label: 'Messages',
          icon: Icon(Icons.notifications),
        ),
        BottomNavigationBarItem(
          label: 'Settings',
          icon: badges.Badge(
            position: badges.BadgePosition.topEnd(),
            badgeStyle: const badges.BadgeStyle(
              padding: EdgeInsets.all(6),
            ),
            badgeContent: Container(
              height: 3,
              width: 3,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
            ),
            child: const Icon(Icons.settings),
          ),
        ),
      ],
    );
  }

  Widget _addRemoveCartButtons() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ElevatedButton.icon(
              onPressed: () => setState(() {
                    _cartBadgeAmount++;
                    if (color == Colors.blue) {
                      color = Colors.red;
                    }
                  }),
              icon: const Icon(Icons.add),
              label: const Text('Add to cart')),
          ElevatedButton.icon(
              onPressed: _showCartBadge
                  ? () => setState(() {
                        _cartBadgeAmount--;
                        color = Colors.blue;
                      })
                  : null,
              icon: const Icon(Icons.remove),
              label: const Text('Remove from cart')),
        ],
      ),
    );
  }
}
