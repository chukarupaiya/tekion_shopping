import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  final double value;
  const Rating({this.value = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(5, (index) {
          return IconTheme(
            data: const IconThemeData(
              color: Colors.amber,
              size: 22,
            ),
            child: Icon(
              index < value ? Icons.star : Icons.star_border,
            ),
          );
        }),
      ),
    );
  }
}
