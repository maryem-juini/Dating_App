import 'package:flutter_riverpod/flutter_riverpod.dart';

final girlsProvider = StateProvider<List<Map<String, dynamic>>>((ref) {
  return [
    {
      'name': 'Teresa Evans',
      'imagePath': 'assets/girl1.png',
      'details': ['Mini Golf ⛳', 'Tonight 7:30 PM', 'Madeira Beach Park'],
      'matchPercentage': 81.0,
      'invited': false,
    },
    {
      'name': 'Emily Johnson',
      'imagePath': 'assets/girl2.jpeg',
      'details': ['Dinner 🍽️', 'Tomorrow 8:00 PM', 'Downtown Restaurant'],
      'matchPercentage': 65.0,
      'invited': false,
    },
    {
      'name': 'Sophia Brown',
      'imagePath': 'assets/girl3.jpg',
      'details': ['Coffee ☕', 'Saturday 10:00 AM', 'Central Park Cafe'],
      'matchPercentage': 75.0,
      'invited': false,
    },
    {
      'name': 'Jessica White',
      'imagePath': 'assets/girl4.jpg',
      'details': ['Movie Night 🎬', 'Friday 9:00 PM', 'City Cinema'],
      'matchPercentage': 60.0,
      'invited': false,
    },
    {
      'name': 'Olivia Green',
      'imagePath': 'assets/girl5.jpg',
      'details': ['Hiking 🌲', 'Sunday 7:00 AM', 'Mountain Trail'],
      'matchPercentage': 70.0,
      'invited': false,
    },
  ];
});

void inviteGirl(WidgetRef ref, int index) {
  ref.read(girlsProvider.notifier).update((girls) {
    girls[index]['invited'] = true;
    return girls;
  });
}
