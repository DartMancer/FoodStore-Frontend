import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_store/core/core.dart';
import 'package:food_store/pages/main/main_screen/main_screen.dart';

class RaitingBlock extends StatefulWidget {
  const RaitingBlock({super.key, required this.bloc});

  final MainScreenBloc bloc;

  @override
  State<RaitingBlock> createState() => _RaitingBlockState();
}

class _RaitingBlockState extends State<RaitingBlock> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;

    return Stack(
      children: [
        Container(
          width: width * 0.25,
          height: width * 0.4,
          decoration: BoxDecoration(
            color: elementsClr,
            borderRadius: BorderRadius.circular(width * 0.01),
          ),
        ),
        SizedBox(
          width: width * 0.25,
          height: width * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: width * 0.001),
              const MainScreenBlocksTitle(title: 'Рейтинг'),
              BlocBuilder<MainScreenBloc, MainScreenState>(
                bloc: widget.bloc,
                builder: (context, state) {
                  if (state is MainScreenLoaded) {
                    return RatingInformation(state: state);
                  }

                  return const RankingProductShimmer();
                },
              ),
              DetailedButton(onPressed: () {}),
              SizedBox(height: width * 0.02),
            ],
          ),
        )
      ],
    );
  }
}
