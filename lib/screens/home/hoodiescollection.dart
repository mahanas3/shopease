import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_ease/custom_widget/custom_button.dart';
import 'package:shop_ease/provider/favourite_provider.dart';
import 'package:shop_ease/utilities/dimensions.dart';

class NewHoodiesCollection extends StatefulWidget {
  const NewHoodiesCollection({super.key});

  @override
  State<NewHoodiesCollection> createState() => _NewHoodiesCollextionState();
}

class _NewHoodiesCollextionState extends State<NewHoodiesCollection> {
  @override
  Widget build(BuildContext context) {
    List<String> bagImages = [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSlzylCuysWZU1XSYYbpWKWsu2nDs8E6p2sw&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4tj3_Dx14aZbO4pZaW8TYumnVBmez6zYaZQ&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9YYaMn9EOQAd6H8sLHH6qYd05DA9akssgBCxgeaYRkBMz612QJ_e-BdlNc1npALGH8Cg&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpuamFu8iN9ZhnZRbBEYYx_aAoz7MedYlnzQ&usqp=CAU'
    ];
    List name = [
      'cap hoodies',
      'cap hoodies',
      'cap hoodies',
      'cap hoodies',
    ];

    List price = ['9\$', '20\$', '50\$', '25\$'];

    return Scaffold(
      backgroundColor: const Color(0x000000ff),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: bagImages.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20.0, // spacing between rows
              crossAxisSpacing: 15.0,
              mainAxisExtent: 240),
          itemBuilder: (BuildContext context, int index) {
            return Stack(children: [
              Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(20),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)),
                      child: Stack(children: [
                        Image(
                          image: NetworkImage(bagImages[index]),
                          fit: BoxFit.fill,
                          height: Dimensions.heightCalc(context, 150),
                          width: Dimensions.widthCalc(context, 150),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 70, top: 10),
                          child: CustomButton(text: '-20%', onPressed: () {}),
                        ),
                      ]),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Icon(Icons.star, color: Color(0xffFFBA49)),
                          Icon(Icons.star, color: Color(0xffFFBA49)),
                          Icon(Icons.star, color: Color(0xffFFBA49)),
                          Icon(Icons.star, color: Color(0xffFFBA49)),
                          Icon(Icons.star, color: Color(0xffFFBA49)),
                          Text(
                            '(10)',
                            style: TextStyle(fontFamily: 'Metropolis2'),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          name[index],
                          style: TextStyle(
                              fontFamily: 'Metropolis',
                              fontSize: Dimensions.heightCalc(context, 16)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 13),
                      child: Align(alignment: Alignment.topLeft,
                        child: Text(
                          price[index],
                          style: TextStyle(
                              fontFamily: 'Metropolis',
                              fontSize: Dimensions.heightCalc(context, 16)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 210, left: 120),
                child: Container(
                  width: Dimensions.widthCalc(context, 100),
                  height: Dimensions.heightCalc(context, 90),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: InkWell(
                    onTap: () {
                      context.read<FavouriteProvider>().favourite(
                          bagImages[index], name[index], price[index], context);
                    },
                    child: const Icon(
                      Icons.favorite_border,
                      size: 25,
                      color: Color(0xffDB3022),
                    ),
                  ),
                ),
              )
            ]);
          },
        ),
      ),
    );
  }
}
