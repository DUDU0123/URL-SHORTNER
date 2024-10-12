import 'package:flutter/material.dart';
import 'package:url_shortner/core/constants/colors.dart';

BoxDecoration commonContainerDecoration() {
  return BoxDecoration(
    boxShadow: [
      BoxShadow(
        blurRadius: 1,
        spreadRadius: 0.5,
        offset: const Offset(1, 1),
        color: kBlack.withOpacity(0.5),
      ),
      BoxShadow(
        blurRadius: 1,
        spreadRadius: 0.5,
        offset: const Offset(-1, -1),
        color: kBlack.withOpacity(0.5),
      ),
    ],
    borderRadius: BorderRadius.circular(16),
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        const Color.fromARGB(255, 176, 92, 228),
        Colors.indigo.shade900,
      ],
    ),
  );
}
