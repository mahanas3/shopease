import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_ease/custom_widget/custom_button.dart';
import 'package:shop_ease/utilities/dimensions.dart';
import '../../provider/home_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List images = [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPotkZ1XfMHjClco1HUDPKee9WqzWMKeJOpQ&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfPScQVRZCpNlp4Kvjpc8WeqFLObhOlqvFhg&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRbUecMxNIuamxf6pbfXxWXh_At5ty9awGOmKdXaJFaetxyrlpL_rh5puM5BS_jcVrb4g&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKallmlRToe2LqYrer_Xw7kIaIDuFiwjvSXg&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQWr2xjeQq2Kt_HseDDNLQstgxaWFuxA6vAA&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOLn53rBZdOjztUVXB_XOO8Ik2bs-gu6UjeA&usqp=CAU'
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Container(
                height: Dimensions.heightCalc(context, 400),
                child: const Image(
                  image: NetworkImage(
                      'https://thumbs.dreamstime.com/b/smiling-woman-red-dress-shopping-bags-sale-gifts-holidays-concept-sunglasses-43723994.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 230, left: 20),
                child: Text(
                  'Fashion ',
                  style: TextStyle(
                      fontFamily: 'Metropolis',
                      fontSize: Dimensions.heightCalc(context, 48),
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 280, left: 20),
                child: Text(
                  'Sale',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: Dimensions.heightCalc(context, 48),
                      fontFamily: 'Metropolis'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 340, left: 17),
                child: SizedBox(
                    height: Dimensions.heightCalc(context, 36),
                    width: Dimensions.widthCalc(context, 160),
                    child: CustomButton(
                        text: 'Check',
                        onPressed: () {
                          context.read<HomeProvider>().check(context);
                        })),
              )
            ]),
            const Padding(
              padding: EdgeInsets.only(top: 20, right: 240),
              child: Text(
                'New',
                style: TextStyle(fontFamily: 'Metropolis', fontSize: 34),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 145, top: 10),
              child: Text(
                'You’ve never seen it before!',
                style: TextStyle(
                    fontFamily: 'Metropolis2', color: Color(0xff9B9B9B)),
              ),
            ),
            SizedBox(
              height: Dimensions.heightCalc(context, 20),
            ),
            Container(
              height: Dimensions.heightCalc(context, 200),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Stack(children: [
                    Container(
                      width: Dimensions.widthCalc(context, 150),
                      decoration: BoxDecoration(
                          color: const Color(0xff9B9B9B),
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: NetworkImage(images[index]),
                              fit: BoxFit.fill)),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<HomeProvider>().newButton(context);
                      },
                      child: Container(
                        height: Dimensions.heightCalc(context, 40),
                        width: Dimensions.widthCalc(context, 60),
                        child: const Card(
                            color: Colors.black87,
                            shape: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Padding(
                              padding: EdgeInsets.only(top: 10, left: 10),
                              child: Text(
                                'New',
                                style: TextStyle(
                                    fontFamily: 'Metropolis',
                                    color: Colors.white),
                              ),
                            )),
                      ),
                    ),
                  ]);
                },
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  width: Dimensions.widthCalc(context, 30),
                ),
                itemCount: images.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
