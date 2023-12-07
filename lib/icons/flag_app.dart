import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

class FlagIcon extends StatelessWidget {
  const FlagIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      badgeStyle: const badges.BadgeStyle(
        badgeColor: Colors.white,
      ),
      badgeContent: const Text(
        '😃',
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
      position: badges.BadgePosition.bottomEnd(bottom: -10),
      child: Container(
        alignment: Alignment.center,
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(Icons.flag, color: Colors.white, size: 40),
      ),
    );
  }
}
