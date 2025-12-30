import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PullRequestShimmer extends StatelessWidget {
  const PullRequestShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final baseColor = theme.brightness == Brightness.dark
        ? Colors.grey.shade800
        : Colors.grey.shade300;
    final highlightColor = theme.brightness == Brightness.dark
        ? Colors.grey.shade700
        : Colors.grey.shade100;

    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _box(height: 18, width: double.infinity),
              const SizedBox(height: 10),
              _box(height: 14, width: double.infinity),
              const SizedBox(height: 6),
              _box(height: 14, width: double.infinity),
              const SizedBox(height: 6),
              _box(height: 14, width: 200),

              const SizedBox(height: 16),
              Row(
                children: [
                  _box(height: 14, width: 80),
                  const Spacer(),
                  _box(height: 12, width: 60),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _box({required double height, required double width}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
