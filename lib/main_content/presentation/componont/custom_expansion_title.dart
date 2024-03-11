import 'package:flutter/material.dart';

class CustomExpansionTitle extends StatelessWidget {
  final String descriptionBody;
  const CustomExpansionTitle({super.key, required this.descriptionBody});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      expandedAlignment: Alignment.topLeft,
      collapsedIconColor: Colors.white70,
      iconColor: Colors.white,
      backgroundColor: Colors.white12,
      collapsedBackgroundColor: Colors.white10,
      childrenPadding: const EdgeInsets.all(20),
      collapsedShape: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
      shape: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
      title: const Text(
        "Description",
        style: TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
      ),
      children: [
        Text(
          descriptionBody,
          style: const TextStyle(
            color: Colors.white60,
            fontSize: 15,
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}

