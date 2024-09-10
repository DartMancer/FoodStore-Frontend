import 'package:flutter/material.dart';

import 'skeleton_graph_info.dart';
import 'skeleton_graph_stroke.dart';
import 'skeleton_graph_title.dart';

class GraphShimmer extends StatelessWidget {
  const GraphShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SkeletonGraphInfo(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SkeletonGraphTitle(),
            SkeletonGraphStroke(),
            SkeletonGraphStroke(),
            SkeletonGraphStroke(),
            SkeletonGraphStroke(),
            SkeletonGraphStroke(),
          ],
        )
      ],
    );
  }
}
