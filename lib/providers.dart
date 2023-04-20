import 'package:flutter_riverpod/flutter_riverpod.dart';

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

final currentTabProvider = StateProvider<int>((ref) {
  return 0;
});
