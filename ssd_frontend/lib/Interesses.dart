import 'package:flutter/material.dart';
class Interesses extends StatelessWidget {
  const Interesses({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interesses'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Escolha o seu distrito de interesse\n",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              width: 300,
              height: 150,
              child: ElevatedButton(
                onPressed: () {
                  // Adicione o código para o onPressed aqui
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.grey),
                  ),
                  alignment: Alignment.center,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/main_images/cafe.jpeg',
                      width: 300,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Botão 1',
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            //box2

            SizedBox(height: 20),
            SizedBox(
              width: 300,
              height: 150,
              child: ElevatedButton(
                onPressed: () {
                  // Adicione o código para o onPressed aqui
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.grey),
                  ),
                  alignment: Alignment.center,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/main_images/cafe.jpeg',
                      width: 300,
                      height: 120,
                     fit: BoxFit.cover,
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Botão 2',
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            //box3

            SizedBox(height: 20),
            SizedBox(
              width: 300,
              height: 150,
              child: ElevatedButton(
                onPressed: () {
                  // Adicione o código para o onPressed aqui
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.grey),
                  ),
                  alignment: Alignment.center,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/main_images/cafe.jpeg',
                      width: 300,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Botão 3',
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            //box4
            SizedBox(height: 20),
            SizedBox(
              width: 300,
              height: 150,
              child: ElevatedButton(
                onPressed: () {
                  // Adicione o código para o onPressed aqui
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.grey),
                  ),
                  alignment: Alignment.center,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/main_images/cafe.jpeg',
                      width: 300,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Botão 4',
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}