import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_performance_sample/high_performance.dart';
import 'package:riverpod_performance_sample/providers.dart';

final count1Provider = StateProvider<int>((ref) {
  return 0;
});

final count2Provider = StateProvider<int>((ref) {
  return 0;
});

final productProvider = Provider<int>((ref) {
  final count1 = ref.watch(count1Provider);
  final count2 = ref.watch(count2Provider);
  return count1 * count2;
});

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('build MyHomePage');
    final currentTab = ref.watch(currentTabProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: IndexedStack(
        index: currentTab,
        children: const [
          HighPerformanceSample(),
          HighPerformanceSample(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => {
          ref.read(currentTabProvider.notifier).state = value,
        },
        currentIndex: currentTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.thumb_up),
            label: 'High Performance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.thumb_down),
            label: 'Low Performance',
          ),
        ],
      ),
    );
  }
}
