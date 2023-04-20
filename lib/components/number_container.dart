import 'package:flutter/material.dart';

class NumberContainer extends StatelessWidget {
  const NumberContainer({
    super.key,
    required this.number,
    required this.color,
    this.isDark = false,
  });
  final int number;
  final Color color;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    debugPrint('build NumberContainer: $number');
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(35),
      ),
      child: Center(
        child: Text(
          number.toString(),
          style: TextStyle(
            fontSize: 32,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
