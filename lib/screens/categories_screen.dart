import 'package:flutter/material.dart';
import 'package:ecommerce/widgets/categories_widget.dart';
import 'package:ecommerce/widgets/text_widget.dart';

class CategoriesScreen extends StatelessWidget {
   CategoriesScreen({Key? key}) : super(key: key);

  List<Color> gridColors = [
    const Color(0xff53B175),
    const Color(0xffF8A44C),
    const Color(0xffF7A593),
    const Color(0xffD3B0E0),
    const Color(0xffFDE598),
    const Color(0xffB7DFF5),
  ];

List<Map<String, dynamic>> catInfo = [
    {
      'imgPath': 'assets/images/categories/mini_small_car.jpg',
      'catText': 'Mini/small',
    },
    {
      'imgPath': 'assets/images/categories/convertible.jpg',
      'catText': 'Convertible',
    },
    {
      'imgPath': 'assets/images/categories/suvi.jpg',
      'catText': 'Suv',
    },
    {
      'imgPath': 'assets/images/categories/4x4.jpg',
      'catText': '4x4',
    },
    {
      'imgPath': 'assets/images/categories/sedan.jpg',
      'catText': 'Sedan',
    },
     {
      'imgPath': 'assets/images/categories/luxury.jpeg',
      'catText': 'Luxury',
    },
  ];
  @override
  Widget build(BuildContext context) {

    Color color = Colors.white;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: TextWidget(
            text: 'Categories',
            color: color,
            textSize: 24,
            isTitle: true,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 240 / 250,
            crossAxisSpacing: 10, // Vertical spacing
            mainAxisSpacing: 10, // Horizontal spacing 
            children: List.generate(6, (index) {
              return CategoriesWidget(
                catText: catInfo[index]['catText'],
                imgPath: catInfo[index]['imgPath'],
                passedColor: gridColors[index],
              );
            }),
          ),
        ));
  }
}
