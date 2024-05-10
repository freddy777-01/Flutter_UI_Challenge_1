// import 'dart:js';

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Ui Challenge 1"),
      // ),
      body: Column(
        children: [
          Container(
            height: 38,
            width: MediaQuery.sizeOf(context).width,
            margin:
                const EdgeInsets.only(left: 20, top: 32, right: 20, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                    'https://flutter4fun.com/wp-content/uploads/2021/09/menu.png'),
                const Text('Besom.',
                    style:
                        TextStyle(fontSize: 32, fontWeight: FontWeight.w800)),
                Image.network(
                    'https://flutter4fun.com/wp-content/uploads/2021/09/bag.png'),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: ListView.builder(
                padding: EdgeInsets.all(20),
                itemBuilder: (context, index) {
                  return JuiceWidget(
                    juiceEntity: juiceList[index],
                  );
                },
                itemCount: juiceList.length,
              ),
            ),
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24)),
                  child: Container(
                    color: Colors.white.withOpacity(0.2),
                    height: 64,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 12),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 18.0, sigmaY: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.network(
                              'https://flutter4fun.com/wp-content/uploads/2021/09/Home.png'),
                          Image.network(
                              'https://flutter4fun.com/wp-content/uploads/2021/09/Search.png'),
                          Image.network(
                              'https://flutter4fun.com/wp-content/uploads/2021/09/Heart.png'),
                          Image.network(
                              'https://flutter4fun.com/wp-content/uploads/2021/09/account.png'),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class JuiceWidget extends StatelessWidget {
  const JuiceWidget({super.key, required this.juiceEntity});
  final JuiceEntity juiceEntity;

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
    return AspectRatio(
      aspectRatio: 1.25,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.transparent, borderRadius: BorderRadius.circular(24)),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final topPadding = constraints.maxHeight * 0.2;
            final leftPadding = constraints.maxWidth * 0.1;
            final imageWidth = constraints.maxWidth * 0.35;
            return Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: topPadding),
                  decoration: BoxDecoration(
                      color: juiceEntity.color,
                      borderRadius: BorderRadius.circular(24)),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: topPadding,
                          left: leftPadding,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              juiceEntity.name,
                              style: textStyle.copyWith(fontSize: 30),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "\$",
                                    style: textStyle.copyWith(fontSize: 16),
                                  ),
                                  TextSpan(
                                    text: juiceEntity.price,
                                    style: textStyle.copyWith(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 32,
                              width: MediaQuery.sizeOf(context).width * 0.30,
                              child: MyButton(
                                onPressed: () {
                                  print("Hello");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              JuiceDetailsPage(
                                                juice: juiceEntity,
                                              )));
                                },
                                text: "Buy Now",
                                textColor: Color(0xFFDC691F),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: imageWidth,
                      // height: 700,
                      child: Image.network(
                        juiceEntity.image,
                      ),
                    )
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class JuiceDetailsPage extends StatefulWidget {
  final JuiceEntity juice;
  const JuiceDetailsPage({required this.juice});

  @override
  _JuiceDetailsPage createState() {
    return _JuiceDetailsPage();
  }
}

class _JuiceDetailsPage extends State<JuiceDetailsPage> {
  int count = 0;
  double bottomSectionHeight = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.juice.color,
        centerTitle: true,
        title: const Text(
          "Bessom",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20.0),
            child: Image.network(
              'https://flutter4fun.com/wp-content/uploads/2021/09/shop_white.png',
              width: 32,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.only(bottom: bottomSectionHeight),
            children: [
              AspectRatio(
                aspectRatio: 0.86,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final imageHeight = constraints.maxHeight * 0.7;
                    final imageHorizontalMargin = constraints.maxWidth * 0.15;
                    final imageBottomMargin = constraints.maxHeight * 0.07;
                    return Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: widget.juice.color,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(32),
                              bottomRight: Radius.circular(32),
                            ),
                          ),
                          margin: const EdgeInsets.only(bottom: 26),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: imageHorizontalMargin,
                                right: imageBottomMargin,
                                bottom: imageBottomMargin,
                              ),
                              child: Image.network(
                                'https://flutter4fun.com/wp-content/uploads/2021/09/full.png',
                                height: imageHeight,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: 130,
                            child: CounterWidget(
                              currentCount: count,
                              color: widget.juice.color,
                              onIncreaseClicked: () {
                                setState(() {
                                  count++;
                                });
                              },
                              onDecreaseCliked: () {
                                setState(() {
                                  count < 0 || count == 0 ? count = 0 : count--;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              /* Page Content */
              const Gap(40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.juice.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SimpleRatingBar(),
                      ],
                    ),
                    const Gap(30),
                    const Text(
                      'Drinking Orange Juice is not only enhances health body also strengthens muscles',
                      style: TextStyle(
                        color: Color(0xFFB0B1B4),
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Reviews",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "See All",
                          style: TextStyle(
                            color: Color(0xFFD81C33),
                            decoration: TextDecoration.underline,
                          ),
                        )
                      ],
                    ),
                    const Gap(20.0),
                    SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.10,
                        child: const ReviewList()),
                  ],
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: bottomSectionHeight,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Expanded(
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: '\$',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: '25.99',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    height: 48,
                    child: MyButton(
                      onPressed: () {
                        print("object");
                      },
                      text: 'Buy Now',
                      bgColor: widget.juice.color,
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final List<String> reviewImages = [
  'https://flutter4fun.com/wp-content/uploads/2021/09/1.png',
  'https://flutter4fun.com/wp-content/uploads/2021/09/2.png',
  'https://flutter4fun.com/wp-content/uploads/2021/09/3.png',
  'https://flutter4fun.com/wp-content/uploads/2021/09/4.png',
];
final addImageUrl =
    'https://flutter4fun.com/wp-content/uploads/2021/09/add.png';

class ReviewList extends StatelessWidget {
  const ReviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          if (index == reviewImages.length) {
            return Image.network(addImageUrl);
          }
          return Image.network(reviewImages[index]);
        },
        separatorBuilder: (_, index) => const Gap(10),
        itemCount: reviewImages.length + 1,
      ),
    );
  }
}

class SimpleRatingBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) => const Icon(
          Icons.star,
          color: Color(0xFFFFBA00),
          size: 18,
        ),
      ),
    );
  }
}

class CounterWidget extends StatelessWidget {
  final int currentCount;
  final Color color;
  final VoidCallback? onIncreaseClicked;
  final VoidCallback? onDecreaseCliked;
  final textStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18);
  const CounterWidget({
    super.key,
    required this.currentCount,
    required this.color,
    this.onIncreaseClicked,
    this.onDecreaseCliked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          GestureDetector(
            onTap: onDecreaseCliked,
            child: const Icon(
              Icons.remove,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 30,
            child: Text(
              currentCount.toString(),
              style: textStyle,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: onIncreaseClicked,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;
  final VoidCallback? onPressed;

  const MyButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.bgColor = Colors.white,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        backgroundColor: bgColor,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w700,
          fontSize: 15,
        ),
      ),
    );
  }
}

class JuiceEntity {
  final String name;
  final String image;
  final String price;
  final Color color;

  JuiceEntity({
    required this.name,
    required this.image,
    required this.price,
    required this.color,
  });
}

final juiceList = [
  JuiceEntity(
    name: 'Besom Yellow Juice',
    image: 'https://flutter4fun.com/wp-content/uploads/2021/09/juice1.png',
    price: '19.99',
    color: const Color(0xFFF3BE39),
  ),
  JuiceEntity(
    name: 'Besom Orange Juice',
    image: 'https://flutter4fun.com/wp-content/uploads/2021/09/juice2.png',
    price: '25.99',
    color: const Color(0xFFDC691F),
  ),
  JuiceEntity(
    name: 'Besom Orange Juice',
    image: 'https://flutter4fun.com/wp-content/uploads/2021/09/juice2.png',
    price: '25.99',
    color: const Color(0xFFDC691F),
  ),
];
