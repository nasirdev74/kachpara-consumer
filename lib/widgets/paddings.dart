import 'package:flutter/material.dart';

class VerticallSmallSpace extends StatelessWidget {
  const VerticallSmallSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 8,
    );
  }
}

class VerticallBigSpace extends StatelessWidget {
  const VerticallBigSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20,
    );
  }
}
