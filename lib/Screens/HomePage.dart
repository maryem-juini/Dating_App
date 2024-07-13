import 'package:dating_app/Screens/DateFinder.dart';
import 'package:dating_app/Screens/Footer/BottomPage.dart';
import 'package:dating_app/Screens/Header/HeaderPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dating_app/Providers/LocationProvider.dart';
import 'package:searchfield/searchfield.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        ref.read(filteredPlacesProvider.notifier).state =
            ref.read(placesProvider);
      } else {
        ref.read(filteredPlacesProvider.notifier).state = [];
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _filterPlaces(String query) {
    final List<String> places = ref.read(placesProvider);
    final List<String> filteredList = places
        .where((place) => place.toLowerCase().contains(query.toLowerCase()))
        .toList();
    ref.read(filteredPlacesProvider.notifier).state = filteredList;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final filteredPlaces = ref.watch(filteredPlacesProvider);

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
          bottomNavigationBar: BottomPage(selectedIndex: 0),
          appBar: HeaderPage(),
          body: Container(
            margin: const EdgeInsets.all(35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.2),
                const Text(
                  "Where to ?",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: SearchField<String>(
                        controller: _searchController,
                        suggestions: ref.read(placesProvider)
                            .map((place) => SearchFieldListItem<String>(
                                place,
                                item: place,
                              ))
                            .toList(),
                        onSuggestionTap: (SearchFieldListItem<String> suggestion) {
                          setState(() {
                            _searchController.text = suggestion.item!;
                          });
                        },
                        searchStyle: TextStyle(color: Colors.white),
                        searchInputDecoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                          prefixIcon: Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                          labelText: 'Location',
                          labelStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.transparent,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.white, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.white, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_forward_outlined, color: Colors.white, size: 30),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DateFinderScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.02),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredPlaces.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          filteredPlaces[index],
                          style: const TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          setState(() {
                            _searchController.text = filteredPlaces[index];
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
