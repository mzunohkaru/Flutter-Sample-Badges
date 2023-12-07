import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      badgeStyle: badges.BadgeStyle(
        shape: badges.BadgeShape.square,
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.white, width: 2),
        badgeColor: Colors.black,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      ),
      badgeContent: const Text('20', style: TextStyle(color: Colors.white)),
      position: badges.BadgePosition.topEnd(top: -10),
      badgeAnimation: const badges.BadgeAnimation.size(toAnimate: true),
      onTap: () {
        print('Tap Now');
      },
      child: Container(
        alignment: Alignment.center,
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Text(
          'あ',
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
