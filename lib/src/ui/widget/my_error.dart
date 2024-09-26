import 'package:flutter/material.dart';
import 'package:ui_articles/src/ui/widget/my_text.dart';

class MyErrorWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  const MyErrorWidget({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: onPressed,
            child: text18Bold('Try Again'),
          ),
        ],
      ),
    );
  }
}
