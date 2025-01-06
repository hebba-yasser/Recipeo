import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../manager/confetti_cubit/confetti_cubit.dart';

class CelebrationSection extends StatelessWidget {
  const CelebrationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfettiCubit, ConfettiState>(
      builder: (context, state) {
        return Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: ConfettiWidget(
                confettiController:
                    BlocProvider.of<ConfettiCubit>(context).confettiController,
                shouldLoop: false,
                blastDirectionality: BlastDirectionality.explosive,
                blastDirection: pi / 2,
                emissionFrequency: 0.05,
                numberOfParticles: 50,
                gravity: 0.1,
                maxBlastForce: 100,
                minBlastForce: 80,
                colors: const [
                  kprimaryColor,
                  Colors.red,
                  Colors.pink,
                  Colors.orange,
                  Colors.purple,
                  Colors.lightBlue,
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ConfettiWidget(
                confettiController:
                    BlocProvider.of<ConfettiCubit>(context).confettiController2,
                shouldLoop: false,
                blastDirectionality: BlastDirectionality.explosive,
                blastDirection: pi / 2,
                emissionFrequency: 0.05,
                numberOfParticles: 50,
                gravity: 0.1,
                maxBlastForce: 100,
                minBlastForce: 20,
                colors: const [
                  kprimaryColor,
                  Colors.red,
                  Colors.pink,
                  Colors.orange,
                  Colors.purple,
                  Colors.lightBlue,
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ConfettiWidget(
                confettiController:
                    BlocProvider.of<ConfettiCubit>(context).confettiController3,
                shouldLoop: false,
                blastDirectionality: BlastDirectionality.explosive,
                blastDirection: pi / 2,
                emissionFrequency: 0.05,
                numberOfParticles: 50,
                gravity: 0.1,
                maxBlastForce: 100,
                minBlastForce: 20,
                colors: const [
                  kprimaryColor,
                  Colors.red,
                  Colors.pink,
                  Colors.orange,
                  Colors.purple,
                  Colors.lightBlue,
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
