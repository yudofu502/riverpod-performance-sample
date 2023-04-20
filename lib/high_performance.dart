import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_performance_sample/components/icon_button.dart';
import 'package:riverpod_performance_sample/components/number_container.dart';

import 'providers.dart';

class HighPerformanceSample extends ConsumerWidget {
  const HighPerformanceSample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('build HighPerformanceSample');

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const _Count1Widget(),
        const SizedBox(width: 16),
        const Text('×', style: TextStyle(fontSize: 32)),
        const SizedBox(width: 16),
        const _Count2Widget(),
        const SizedBox(width: 16),
        const Text('=', style: TextStyle(fontSize: 32)),
        const SizedBox(width: 16),
        Consumer(
          builder: (context, ref, child) {
            final product = ref.watch(productProvider);
            return NumberContainer(
              number: product,
              color: Colors.green,
              isDark: true,
            );
          },
        ),
      ],
    );
  }
}

class _Count1Widget extends ConsumerWidget {
  const _Count1Widget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('build _Count1Widget');
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        MyIconButton(
          Icons.remove,
          onPressed: () => ref.read(count1Provider.notifier).state--,
        ),
        Consumer(
          builder: (context, ref, child) {
            final count1 = ref.watch(count1Provider);
            return NumberContainer(
              number: count1,
              color: Colors.red,
              isDark: true,
            );
          },
        ),
        MyIconButton(
          Icons.add,
          onPressed: () => ref.read(count1Provider.notifier).state++,
        ),
      ],
    );
  }
}

class _Count2Widget extends ConsumerWidget {
  const _Count2Widget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('build _Count2Widget');
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        MyIconButton(
          Icons.remove,
          onPressed: () => ref.read(count2Provider.notifier).state--,
        ),
        Consumer(
          builder: (context, ref, child) {
            final count2 = ref.watch(count2Provider);
            return NumberContainer(
              number: count2,
              color: Colors.yellow,
            );
          },
        ),
        MyIconButton(
          Icons.add,
          onPressed: () => ref.read(count2Provider.notifier).state++,
        ),
      ],
    );
  }
}
