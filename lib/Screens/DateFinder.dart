import 'package:dating_app/Screens/Components/CategoryButton.dart';
import 'package:dating_app/Screens/Footer/BottomPage.dart';
import 'package:dating_app/Screens/Header/HeaderPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dating_app/Providers/CategoryProvider.dart';

class DateFinderScreen extends ConsumerStatefulWidget {
  const DateFinderScreen({super.key});

  @override
  _DateFinderScreenState createState() => _DateFinderScreenState();
}

class _DateFinderScreenState extends ConsumerState<DateFinderScreen> {
  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(categoriesProvider);
    final icons = ref.watch(categoryIconProvider);
    final selected = ref.watch(selectedProvider);

    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/home-page-bg.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: HeaderPage(),
          bottomNavigationBar: BottomPage(selectedIndex: 0),
          body: Center(
            child: Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              backgroundColor: const Color(0xFF161616),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                height: 470,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Schedule a date',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.white),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Popular Date Locations in Boston',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: CategoryButton(
                              label: categories[index],
                              icon: icons[index],
                              isSelected: selected[index],
                              onTap: () => ref.read(selectedProvider.notifier).toggleSelected(index),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      'Timeframe',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      children: [
                        Icon(Icons.calendar_today, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          '7:00pm - 9:00pm',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Find Date'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          minimumSize: const Size(350, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
