import 'package:bretify_mvp/features/home/cubit/cubit_indicator.dart';

import 'package:bretify_mvp/features/home/widgets/my_floating_btn.dart';
import 'package:bretify_mvp/features/home/widgets/my_map.dart';
import 'package:bretify_mvp/features/home/widgets/people_around_card.dart';
import 'package:bretify_mvp/shared/widgets/floating_menu_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CubitIndicator(false),
      child: const Scaffold(
        body: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              MapWidget(),
              MyFloatingButton(
                btnIcon: Icons.search,
                heroTag: "btn1",
                btnPosition: Alignment(-0.9, -0.9),
              ),
              MyFloatingButton(
                btnIcon: Icons.settings,
                heroTag: "btn2",
                btnPosition: Alignment(0.9, -0.9),
              ),
              LeftButtons(),
              PeopleAroundCard(),
              Positioned(
                bottom: 8,
                child: MyNavigationBar(initialIndex: 1),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LeftButtons extends StatelessWidget {
  const LeftButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double _heightSpacing = 8;

    return Align(
      alignment: const Alignment(-0.9, 0),
      child: IntrinsicWidth(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const MyFloatingButton(
              btnIcon: Icons.add,
              heroTag: "btn3",
            ),
            SizedBox(height: _heightSpacing),
            const MyFloatingButton(
              btnIcon: Icons.delete,
              heroTag: "btn4",
            ),
            SizedBox(height: _heightSpacing),
            const MyFloatingButton(
              btnIcon: Icons.location_on_outlined,
              heroTag: "btn5",
            ),
          ],
        ),
      ),
    );
  }
}
