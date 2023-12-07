import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

class AlarmIcon extends StatefulWidget {
  const AlarmIcon({
    Key? key,
  }) : super(key: key);

  @override
  State<AlarmIcon> createState() => _AlarmIconState();
}

class _AlarmIconState extends State<AlarmIcon> {
  bool _isLooped = true;
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      badgeStyle: const badges.BadgeStyle(padding: EdgeInsets.all(7)),
      badgeAnimation: badges.BadgeAnimation.fade(
        animationDuration: const Duration(seconds: 1),
        loopAnimation: _isLooped,
        // toAnimate: _isLooped
      ),
      onTap: () {
        setState(() => _isLooped = !_isLooped);
      },
      ignorePointer: false,
      badgeContent:
          Text(counter.toString(), style: const TextStyle(color: Colors.white)),
      position: badges.BadgePosition.topEnd(top: -12),
      child: GestureDetector(
        onTap: () {
          setState(() => counter += 10);
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.access_alarm_outlined,
            size: 34,
          ),
        ),
      ),
    );
  }
}
