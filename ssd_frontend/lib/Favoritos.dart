import 'package:flutter/material.dart';
import 'package:ssd_frontend/Interesses.dart';
import 'package:ssd_frontend/AveiroInteressesPage.dart';
import 'package:ssd_frontend/AboutUS.dart';
import 'package:ssd_frontend/registo_empresas/registo.dart';
import 'package:ssd_frontend/registo_empresas/signUp_pessoa.dart';
import 'features_empresa/features_empresa.dart';
import 'login/login_turista.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 50);
  //Size get preferredSize => MediaQuery.of(context).size;
  @override
  Widget build(BuildContext context) {
    return Container(

      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      // padding: const EdgeInsets.fromLTRB(10, 20, 20, 20), // ajuste aqui
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(46),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -2),
            blurRadius: 40,
            color: Colors.black.withOpacity(0.16),
          ),
        ],
      ),


      child: Row(
        children: [

          Container(
            width: 40,
            alignment: Alignment.centerLeft,
            child: PopupMenuButton<String>(

              onSelected: (value) {
                switch (value) {
                  case 'Favoritos':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Favoritos()),
                    );
                    break;
                  case 'AboutUS':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AboutUS()),
                    );
                    break;
                  case 'interesses':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Interesses()),
                    );
                    break;
                  case 'Login':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginTurista()),
                    );
                    break;
                  case 'Registro':
                  // Adicione a navegação para a página de registro aqui
                    break;
                }
              },

              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'favoritos',
                  child: Text('Favoritos'),
                ),
                const PopupMenuItem<String>(
                  value: 'interesses',
                  child: Text('Interesses'),
                ),
                const PopupMenuItem<String>(
                  value: 'Login',
                  child: Text('Login'),
                ),
                const PopupMenuItem<String>(
                  value: 'Registro',
                  child: Text('Criar Conta'),
                ),
                const PopupMenuItem<String>(
                  value: 'AboutUS',
                  child: Text('LusiTravel'),
                ),
              ],
              child: const Icon(Icons.menu), // ícone do menu

            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Image.asset(
                "assets/icons/icon_app.png",
                height: 50,
                width: 40,
                alignment: Alignment.topLeft,
              ),
            ),
          ),





          const SizedBox(width: 5),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Pesquisar",
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search),
                ),
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),


          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Favoritos(),
                ),
              );
            },
            child: const Text(
              "Favoritos",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(width: 10), // Adicionado aqui


          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Interesses(),
                ),
              );
            },
            child: const Text(
              "Interesses",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),

          const SizedBox(
            width: 5,
          ),
          const SizedBox(
            width: 5,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const LoginTurista())
                );
              },
              child: const Text(
                "Login",
                style: TextStyle(
                  fontSize: 18,
                ),
              )),
          const SizedBox(
            width: 5,
          ),

        ],
      ),
    );
  }
}

class Restaurant {
  final String name;
  final String district;
  final String city;
  final String cuisineType;
  final String image;
  final double distance;

  Restaurant({
    required this.name,
    required this.district,
    required this.city,
    required this.cuisineType,
    required this.image,
    required this.distance,
  });
}

class Favoritos extends StatefulWidget {
  @override
  FavoritosState createState() => FavoritosState();
}

class FavoritosState extends State<Favoritos> {
  final List<Restaurant> restaurants = [
    Restaurant(
      name: 'Un Poco Loco',
      distance: 1.2,
      image: 'assets/images_restaurants/res6.jpg',
      city: 'Aveiro',
      district: 'Aveiro',
      cuisineType: 'Mexican Cuisine',
    ),
  ];

  Set<int> favorites = Set<int>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      children: restaurants.map((restaurant) {
                        bool isFavorite = true;
                        return GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    LimitedBox(
                                      maxHeight:
                                          MediaQuery.of(context).size.height *
                                              0.7,
                                      maxWidth:
                                          MediaQuery.of(context).size.width *
                                              0.7,
                                      child: Image.asset(
                                        restaurant.image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(height: 16.0),
                                    Text(
                                      restaurant.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    const SizedBox(height: 8.0),
                                    Text(
                                      'District: ${restaurant.district}',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    const SizedBox(height: 8.0),
                                    Text(
                                      'City: ${restaurant.city}',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    const SizedBox(height: 8.0),
                                    Text(
                                      'Cuisine Type: ${restaurant.cuisineType}',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    const SizedBox(height: 16.0),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Close'),
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
                                    maxHeight:
                                        MediaQuery.of(context).size.height *
                                            0.4,
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
                                    style: const TextStyle(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${restaurant.distance} km',
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          isFavorite
                                              ? Icons.favorite
                                              : Icons.favorite_outline,
                                          color: isFavorite ? Colors.red : null,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            isFavorite = !isFavorite;
                                            if (isFavorite) {
                                              favorites
                                                  .add(restaurant.hashCode);
                                            } else {
                                              favorites
                                                  .remove(restaurant.hashCode);
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
                    )),
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
