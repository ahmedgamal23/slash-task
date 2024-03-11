import 'package:flutter/material.dart';
import '../../../core/constant/app_color.dart';

class CustomHeader extends StatelessWidget {
  final double containerHeight;
  const CustomHeader({super.key, required this.containerHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: containerHeight,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: AppColor.bgHeaderColor,
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(100)),
      ),
      child: const Text(
        "Slash.",
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

