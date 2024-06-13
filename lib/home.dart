import 'package:flutter/material.dart';
//import 'package:resepku_app/homeold.dart';
import 'package:resepku_app/indo.dart';
import 'package:resepku_app/japan.dart';
import 'package:resepku_app/western.dart';
import 'recipe_card.dart';
//import 'indo.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

List<String> judul = <String>[
  'Makanan Indonesia',
  'Makanan Western',
  'Makanan Jepang'
];
List<String> rate = <String>['4.5', '4.3', '4.5'];
List<String> waktu = <String>['10-15 Menit', '10-25 Menit', '10-20 Menit'];
List<String> gambar = <String>[
  'https://raw.githubusercontent.com/0xricoard/simple-recipe-app-flutter/master/assets/images/nasgor.jpg',
  'https://raw.githubusercontent.com/0xricoard/simple-recipe-app-flutter/master/assets/images/steak.jpg',
  'https://raw.githubusercontent.com/0xricoard/simple-recipe-app-flutter/master/assets/images/sushi.jpg'
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.restaurant_menu),
              SizedBox(width: 10),
              Text('Resepku App'),
            ],
          ),
        ),
        //agar bisa discroll untuk perangkat layar kecil
        body: SingleChildScrollView(
          child: Column(
            children: [
              // menambahkan teks Daftar Resep
              Center(
                child: Text(
                  'Daftar Resep',
                  style: TextStyle(
                    fontSize: 33,
                    color: Colors.black38,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: judul.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      if (index == 0) {
                        //  navigasi ke halaman Makanan Indonesia
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Indo()));
                      } else if (index == 1) {
                        //  navigasi ke halaman Makanan Western
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Western()));
                      } else if (index == 2) {
                        // navigasi ke halaman Makanan Jepang
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Japan()));
                      }
                    },
                    //mengambil data array dan style dari recipe_card
                    child: RecipeCard(
                        title: judul[index],
                        cookTime: waktu[index],
                        rating: rate[index],
                        thumbnailUrl: gambar[index]),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
