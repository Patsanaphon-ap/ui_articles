import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThumbnailWidget extends StatelessWidget {
  final String thumbnailImage;
  final VoidCallback? onTap;
  const ThumbnailWidget({
    super.key,
    this.onTap,
    required this.thumbnailImage,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: Get.height * 0.25,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 4),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(18)),
                child: Image.network(
                  thumbnailImage,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    // Image loading widget
                    if (loadingProgress == null) return child;
                    return const Center(child: CircularProgressIndicator());
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(Icons.error),
                    ); // Placeholder icon or widget
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
