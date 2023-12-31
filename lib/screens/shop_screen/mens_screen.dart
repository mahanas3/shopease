import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_ease/provider/shop_provider.dart';
import 'package:shop_ease/utilities/dimensions.dart';
import '../../provider/home_provider.dart';

class MensPage extends StatefulWidget {
  const MensPage({super.key});

  @override
  State<MensPage> createState() => _MensPageState();
}

class _MensPageState extends State<MensPage> {
  @override
  Widget build(BuildContext context) {
    List names = ['Shirt', 'Hoodies', 'Footwear', 'Watch'];

    List mensImages = [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbqTS_sjzrFCOfuZpjp7n4UksZC1Dybrhaxw&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoGW3SGvZ-23rL9KZvI2WZtJGakEiA2I5FDw&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-9falxasiXfO-jTTc0FwaESvUJ-tP7etB9Q&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbSPTvxKTL18uWYnbvV_-333ZLS8P6GFjNbw&usqp=CAU'
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 29, right: 29),
              child: Stack(children: [
                Container(
                  height: Dimensions.heightCalc(context, 90),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color(0xffDB3022),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 60),
                  child: Column(
                    children: [
                      Text(
                        'SUMMER SALES',
                        style: TextStyle(
                            fontSize: Dimensions.heightCalc(context, 24),
                            fontFamily: 'Metropolis',
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Up to 50% off',
                        style: TextStyle(
                            fontFamily: 'Metropolis',
                            fontSize: Dimensions.heightCalc(context, 14),
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.read<ShopProvider>().womenNew(context);
                  },
                  child: Image(
                    image: const AssetImage('assets/images/neww.png'),
                    height: Dimensions.heightCalc(context, 80),
                    width: Dimensions.widthCalc(context, 80),
                  ),
                )
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      elevation: 5,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      child: InkWell(
                        onTap: () {
                          context.read<HomeProvider>().tops(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Image(
                                  image: NetworkImage(mensImages[index]),
                                  height: Dimensions.heightCalc(context, 90),
                                  width: Dimensions.widthCalc(context, 120),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                width: Dimensions.widthCalc(context, 40),
                              ),
                              Container(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      names[index],
                                      style: TextStyle(
                                          fontFamily: 'Metropolis',
                                          fontSize: Dimensions.heightCalc(
                                              context, 20)),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ));
                },
                separatorBuilder: (BuildContext context, int index) =>
                     SizedBox(
                  height: Dimensions.heightCalc(context, 10),
                ),
                itemCount: mensImages.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
