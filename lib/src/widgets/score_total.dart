import 'package:flutter/material.dart';

class ScoreTotal extends StatelessWidget {
  const ScoreTotal({
    super.key,
    required this.total,
  });

  final ValueNotifier<int> total;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: total,
      builder: (context, total, child) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(12, 6, 12, 18),
          child: Text(
            'Score Total: $total'.toUpperCase(),
            style: Theme.of(context).textTheme.titleLarge!,
          ),
        );
      },
    );
  }
}
