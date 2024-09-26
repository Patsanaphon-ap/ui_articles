import 'package:flutter/material.dart';
import 'package:ui_articles/src/ui/widget/my_text.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 18),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(
          width: .5,
          color: Colors.grey,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.search_outlined,
                size: 22,
              ),
              const SizedBox(
                width: 12,
              ),
              text16Normal(
                'Search for a topic',
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
            ],
          ),
          const Icon(
            Icons.chevron_right_rounded,
            size: 24,
          ),
        ],
      ),
    );
  }
}
