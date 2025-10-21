import 'package:fashion_store/app/home/views/widgets/top_pick_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopPicksSection extends StatelessWidget {
  final String title;
  final RxList topPicks;

  const TopPicksSection({
    super.key,
    required this.title,
    required this.topPicks,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (topPicks.isEmpty) return const SizedBox.shrink();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              title.toUpperCase(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 380,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: topPicks.length,
              itemBuilder: (context, index) {
                final product = topPicks[index];
                return TopPickCard(product: product, rank: index + 1);
              },
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              topPicks.length.clamp(0, 7),
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == 0 ? Colors.black : Colors.grey[400],
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
