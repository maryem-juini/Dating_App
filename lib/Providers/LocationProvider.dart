import 'package:flutter_riverpod/flutter_riverpod.dart';

final placesProvider = Provider<List<String>>((ref) {
  return [
    'New York',
    'Los Angeles',
    'Chicago',
    'Houston',
    'Phoenix',
    'Philadelphia',
    'San Antonio',
    'San Diego',
    'Dallas',
    'San Jose',
  ];
});

final filteredPlacesProvider = StateProvider<List<String>>((ref) {
  return [];
});
