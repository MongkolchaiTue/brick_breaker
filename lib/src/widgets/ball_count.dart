import 'package:flutter/material.dart';

class BallCount extends StatelessWidget {
  const BallCount({
    super.key,
    required this.ballcount,
  });

  final ValueNotifier<int> ballcount;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: ballcount,
      builder: (context, ballcount, child) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(12, 6, 12, 18),
          child: Text(
            'Ball(-10x,+15x): $ballcount'.toUpperCase(),
            style: Theme.of(context).textTheme.titleLarge!,
          ),
        );
      },
    );
  }
}
