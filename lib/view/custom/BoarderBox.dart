import 'package:flutter/material.dart';
import 'package:sample_mvvm/Utils/constant.dart';

class BoaderBox extends StatelessWidget {

  final Widget child;
  final EdgeInsets? padding;
  final double? width, height;

  const BoaderBox({Key? key, this.padding, this.width, this.height, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: COLOR_WHITE,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: COLOR_GRAY.withAlpha(40), width: 2)
      ),
      padding: padding?? const EdgeInsets.all(8.0),
      child: Center(child: child),
    );
  }
}
