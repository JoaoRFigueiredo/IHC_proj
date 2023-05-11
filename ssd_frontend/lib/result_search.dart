import 'package:flutter/material.dart';

class Restaurant {
  String name;
  String district;
  String municipality;
  String cuisine;

  Restaurant(
      {required this.name,
      required this.district,
      required this.municipality,
      required this.cuisine});
}

class ResultSearch extends StatefulWidget {
  @override
  _ResultSearchState createState() => _ResultSearchState();
}

class _ResultSearchState extends State<ResultSearch> {
  final List<Restaurant> restaurants = [    Restaurant(name: 'Restaurant 1', district: 'Aveiro', municipality: 'Aveiro', cuisine: 'Type 1'),    Restaurant(name: 'Restaurant 2', district: 'Aveiro', municipality: 'Aveiro', cuisine: 'Type 2'),    Restaurant(name: 'Restaurant 3', district: 'Aveiro', municipality: 'Aveiro', cuisine: 'Type 3'),    Restaurant(name: 'Restaurant 4', district: 'Aveiro', municipality: 'Aveiro', cuisine: 'Type 4'),    Restaurant(name: 'Restaurant 5', district: 'Aveiro', municipality: 'Aveiro', cuisine: 'Type 5'),  ];
  
  Set<int> favorites = Set<int>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurants in Aveiro'),
      ),
      body: Row(
        children: [
          Container(
            width: 200,
            color: Colors.grey[300],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Aveiro - Distrito',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Aveiro - Concelho',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Gastronomia - Tipo',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: restaurants.map((restaurant) {
                  bool isFavorite = favorites.contains(restaurant.hashCode);
                  return Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[300],
                        ),
                        child: Center(
                          child: Text(restaurant.name),
                        ),
                      ),
                      Positioned(
                        right: 8,
                        top: 8,
                        child: IconButton(
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_outline,
                            color: isFavorite ? Colors.red : null,
                          ),
                          onPressed: () {
                            setState(() {
                              if (isFavorite) {
                                favorites.remove(restaurant.hashCode);
                              } else {
                                favorites.add(restaurant.hashCode);
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

