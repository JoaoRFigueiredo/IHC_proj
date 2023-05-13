import 'package:flutter/material.dart';

class Restaurant {
  final int id;
  final String name;
  final String district;
  final String city;
  final String cuisineType;
  final String image;
  final double distance;

  Restaurant({
    required this.id,
    required this.name,
    required this.district,
    required this.city,
    required this.cuisineType,
    required this.image,
    required this.distance,
  });
}

class ResultSearch extends StatefulWidget {
  @override
  _ResultSearchState createState() => _ResultSearchState();
}

class _ResultSearchState extends State<ResultSearch> {
  final List<Restaurant> restaurants = [
    Restaurant(
      id: 1,
      name: 'Sal na Brasa',
      distance: 1.2,
      image: 'assets/images_restaurants/res3.jpg',
      city: 'Aveiro',
      district: 'Aveiro',
      cuisineType: 'Example Cuisine',
    ),
    Restaurant(
      id: 2,
      name: 'O Forno da Mimi',
      distance: 1.5,
      image: 'assets/images_restaurants/res1.jpg',
      city: 'Aveiro',
      district: 'Aveiro',
      cuisineType: 'Pizza',
    ),
    Restaurant(
      id: 3,
      name: 'Esplanada Santa Joana',
      distance: 1.7,
      image: 'assets/images_restaurants/res2.jpg',
      city: 'Aveiro',
      district: 'Aveiro',
      cuisineType: 'Portuguese Cuisine',
    ),
    Restaurant(
      id: 4,
      name: 'Retiro da Avo Maria',
      distance: 2.0,
      image: 'assets/images_restaurants/res4.jpg',
      city: 'Aveiro',
      district: 'Aveiro',
      cuisineType: 'Portuguese Cuisine',
    ),
    Restaurant(
      id: 5,
      name: 'O Mercantel',
      distance: 2.5,
      image: 'assets/images_restaurants/res5.jpg',
      city: 'Aveiro',
      district: 'Aveiro',
      cuisineType: 'Seafood',
    ),
    Restaurant(
      id: 6,
      name: 'Un Poco Loco',
      distance: 1.0,
      image: 'assets/images_restaurants/res6.jpg',
      city: 'Aveiro',
      district: 'Aveiro',
      cuisineType: 'Tacos',
    ),
  ];

  Set<int> favorites = Set<int>();
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurants in Aveiro'),
      ),
        body: SingleChildScrollView(
    child: Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            color: Colors.grey[300],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                Text(
                  'Aveiro - Distrito',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Aveiro - Concelho',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Gastronomia - Tipo',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                   isFavorite = favorites.contains(restaurant.id);
                  return GestureDetector(
  onTap: () {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LimitedBox(
              maxHeight: MediaQuery.of(context).size.height * 0.7,
              maxWidth: MediaQuery.of(context).size.width * 0.7,
              child: Image.asset(
                restaurant.image,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              restaurant.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Distrito: ${restaurant.district}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8.0),
            Text(
              'Concelho: ${restaurant.city}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8.0),
            Text(
              'Tipo: ${restaurant.cuisineType}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        ),
      ),
    );
  },
  child: Card(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: LimitedBox(
            maxHeight: MediaQuery.of(context).size.height * 0.4,
            child: Image.asset(
              restaurant.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            restaurant.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 4.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${restaurant.distance} km',
                style: TextStyle(fontSize: 14),
              ),
              IconButton(
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_outline,
                            color: isFavorite ? Colors.red : null,
                          ),
  onPressed: () {
  setState(() {
    if (favorites.contains(restaurant.id)) {
      favorites.remove(restaurant.id);
    } else {
      favorites.add(restaurant.id);
    }
  });
},
),

            ],
          ),
        ),
      ],
    ),
  ),
);
}).toList(),
)
),
),
],
),
    ),
  ),
  resizeToAvoidBottomInset: false,
);
}
}