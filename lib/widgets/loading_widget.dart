import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  LoadingWidget({super.key, this.color = Colors.green});
  Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 10,
      height: 10,
      child: Center(
          child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(color),
      )),
    );
  }
}
