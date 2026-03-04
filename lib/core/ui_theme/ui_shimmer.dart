import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'ui_colors.dart';

class UiShimmer extends StatelessWidget {
  final int? itensShimmer;
  const UiShimmer({super.key, this.itensShimmer});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: itensShimmer ?? 1,
            itemBuilder: (context, index) => const Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                    child: ShimmerDefault(
                      width: double.infinity,
                      height: 90,
                    ),
                  ),
                 SizedBox(height: 30),
                  SizedBox(
                    height: 40,
                    child: ShimmerDefault(
                      width: double.infinity,
                      height: 90,
                    ),
                  ),
                SizedBox(height: 30),
                  SizedBox(
                    height: 40,
                    child: ShimmerDefault(
                      width: double.infinity,
                      height: 90,
                    ),
                  ),
                SizedBox(height: 30),
                  SizedBox(
                    height: 40,
                    child: ShimmerDefault(
                      width: double.infinity,
                      height: 90,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
}




class ShimmerDefault extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsets margin;
  final Widget? child;

  const ShimmerDefault({
    super.key,
    required this.width,
    required this.height,
    this.margin = EdgeInsets.zero,
    this.child,
  });

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
      baseColor: UiThemeColors.neutral40.withValues(alpha: 0.6),
      highlightColor: UiThemeColors.neutral40.withValues(alpha: 0.2),
      child: child == null
          ? Container(
              width: width,
              height: height,
              margin: margin,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            )
          : child!,
    );
}
