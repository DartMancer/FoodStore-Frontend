import 'package:flutter/material.dart';

import 'skeleton_data.dart';

class RankingProductShimmer extends StatelessWidget {
  const RankingProductShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    return SizedBox(
      width: width * 0.25,
      height: width * 0.25,
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return const Stack(
            alignment: Alignment.center,
            children: [SkeletonRankData()],
          );
        },
      ),
    );
  }
}
