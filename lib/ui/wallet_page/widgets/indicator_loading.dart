import 'package:flutter/material.dart';

class IndicatorLoading extends StatelessWidget {
  const IndicatorLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
