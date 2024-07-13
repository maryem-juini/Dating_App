import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoriesProvider = Provider<List<String>>((ref) {
  return [
    'All',
    'Food',
    'Drinks',
    'Mini Golf',
    'Movies',
    'Parks',
    'Museum',
  ];
});

final categoryIconProvider = Provider<List<IconData>>((ref) {
  return [
    Icons.all_inclusive,
    Icons.restaurant,
    Icons.local_bar,
    Icons.golf_course,
    Icons.movie,
    Icons.park,
    Icons.museum,
  ];
});

final selectedProvider = StateNotifierProvider<SelectedNotifier, List<bool>>((ref) {
  return SelectedNotifier();
});

class SelectedNotifier extends StateNotifier<List<bool>> {
  SelectedNotifier() : super(List.generate(7, (index) => false));

  void toggleSelected(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index) !state[i] else state[i],
    ];
  }
}