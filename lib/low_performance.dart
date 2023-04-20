import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_performance_sample/components/icon_button.dart';
import 'package:riverpod_performance_sample/components/number_container.dart';

import 'providers.dart';

class LowPerformanceSample extends ConsumerWidget {
  const LowPerformanceSample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('build LowPerformanceSample');
    final count1 = ref.watch(count1Provider);
    final count2 = ref.watch(count2Provider);
    final product = ref.watch(productProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MyIconButton(
              Icons.remove,
              onPressed: () => ref.read(count1Provider.notifier).state--,
            ),
            NumberContainer(
              number: count1,
              color: Colors.red,
              isDark: true,
            ),
            MyIconButton(
              Icons.add,
              onPressed: () => ref.read(count1Provider.notifier).state++,
            ),
          ],
        ),
        const SizedBox(width: 16),
        const Text('×', style: TextStyle(fontSize: 32)),
        const SizedBox(width: 16),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MyIconButton(
              Icons.remove,
              onPressed: () => ref.read(count2Provider.notifier).state--,
            ),
            NumberContainer(
              number: count2,
              color: Colors.yellow,
            ),
            MyIconButton(
              Icons.add,
              onPressed: () => ref.read(count2Provider.notifier).state++,
            ),
          ],
        ),
        const SizedBox(width: 16),
        const Text('=', style: TextStyle(fontSize: 32)),
        const SizedBox(width: 16),
        NumberContainer(
          number: product,
          color: Colors.green,
          isDark: true,
        ),
      ],
    );
  }
}
