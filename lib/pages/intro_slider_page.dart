import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_codigo5_museumapp/ui/general/colors.dart';
import 'package:flutter_codigo5_museumapp/ui/general/general_widget.dart';
import 'package:flutter_codigo5_museumapp/ui/responsive/responsive.dart';

class IntroSliderPage extends StatefulWidget {
  const IntroSliderPage({Key? key}) : super(key: key);

  @override
  State<IntroSliderPage> createState() => _IntroSliderPageState();
}

class _IntroSliderPageState extends State<IntroSliderPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _pageController.addListener(() {
    //   print(_pageController.page);
    // });

    // Timer.periodic(
    //   const Duration(seconds: 5),
    //   (timer) {
    //     print(_currentPage);
    //     if (_currentPage < 4) {
    //       _currentPage++;
    //       _pageController.animateToPage(
    //         _currentPage,
    //         duration: const Duration(
    //           milliseconds: 400,
    //         ),
    //         curve: Curves.easeIn,
    //       );
    //       setState((){});
    //     }
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              onPageChanged: (int value) {
                _currentPage = value;
                setState(() {});
              },
              children: [
                Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      "assets/images/slider3.jpeg",
                      fit: BoxFit.cover,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 26.0),
                            height: ResponsiveUI.pHeight(context, 0.38),
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40.0),
                                topRight: Radius.circular(40.0),
                              ),
                            ),
                            child: Column(
                              children: [
                                divider20,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      height: 8,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: kBrandPrimaryColor,
                                        borderRadius:
                                        BorderRadius.circular(20.0),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      height: 8,
                                      width: 8,
                                      decoration: BoxDecoration(
                                        color: kBrandPrimaryColor
                                            .withOpacity(0.25),
                                        borderRadius:
                                        BorderRadius.circular(20.0),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      height: 8,
                                      width: 8,
                                      decoration: BoxDecoration(
                                        color: kBrandPrimaryColor
                                            .withOpacity(0.25),
                                        borderRadius:
                                        BorderRadius.circular(20.0),
                                      ),
                                    ),
                                  ],
                                ),
                                divider20,
                                Text(
                                  "Lorem ipsum dolor sit amet",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                    color: kBrandPrimaryColor,
                                  ),
                                ),
                                divider20,
                                Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
                                      color:
                                      kBrandPrimaryColor.withOpacity(0.6)),
                                ),
                                divider30,
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Omitir"),
                                    dividerWidth12,
                                    Container(
                                      padding: const EdgeInsets.all(16.0),
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Color(0xfff72585),
                                                Color(0xff480ca8),
                                              ])),
                                      child: Container(
                                        padding: const EdgeInsets.all(2.0),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.chevron_right,
                                          color: kBrandPrimaryColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      "assets/images/slider3.jpeg",
                      fit: BoxFit.cover,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 26.0),
                            height: ResponsiveUI.pHeight(context, 0.38),
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40.0),
                                topRight: Radius.circular(40.0),
                              ),
                            ),
                            child: Column(
                              children: [
                                divider20,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      height: 8,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: kBrandPrimaryColor,
                                        borderRadius:
                                        BorderRadius.circular(20.0),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      height: 8,
                                      width: 8,
                                      decoration: BoxDecoration(
                                        color: kBrandPrimaryColor
                                            .withOpacity(0.25),
                                        borderRadius:
                                        BorderRadius.circular(20.0),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      height: 8,
                                      width: 8,
                                      decoration: BoxDecoration(
                                        color: kBrandPrimaryColor
                                            .withOpacity(0.25),
                                        borderRadius:
                                        BorderRadius.circular(20.0),
                                      ),
                                    ),
                                  ],
                                ),
                                divider20,
                                Text(
                                  "Lorem ipsum dolor sit amet",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                    color: kBrandPrimaryColor,
                                  ),
                                ),
                                divider20,
                                Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
                                      color:
                                      kBrandPrimaryColor.withOpacity(0.6)),
                                ),
                                divider30,
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Omitir"),
                                    dividerWidth12,
                                    Container(
                                      padding: const EdgeInsets.all(16.0),
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Color(0xfff72585),
                                                Color(0xff480ca8),
                                              ])),
                                      child: Container(
                                        padding: const EdgeInsets.all(2.0),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.chevron_right,
                                          color: kBrandPrimaryColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      "assets/images/slider3.jpeg",
                      fit: BoxFit.cover,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 26.0),
                            height: ResponsiveUI.pHeight(context, 0.38),
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40.0),
                                topRight: Radius.circular(40.0),
                              ),
                            ),
                            child: Column(
                              children: [
                                divider20,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      height: 8,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: kBrandPrimaryColor,
                                        borderRadius:
                                        BorderRadius.circular(20.0),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      height: 8,
                                      width: 8,
                                      decoration: BoxDecoration(
                                        color: kBrandPrimaryColor
                                            .withOpacity(0.25),
                                        borderRadius:
                                        BorderRadius.circular(20.0),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      height: 8,
                                      width: 8,
                                      decoration: BoxDecoration(
                                        color: kBrandPrimaryColor
                                            .withOpacity(0.25),
                                        borderRadius:
                                        BorderRadius.circular(20.0),
                                      ),
                                    ),
                                  ],
                                ),
                                divider20,
                                Text(
                                  "Lorem ipsum dolor sit amet",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                    color: kBrandPrimaryColor,
                                  ),
                                ),
                                divider20,
                                Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
                                      color:
                                      kBrandPrimaryColor.withOpacity(0.6)),
                                ),
                                divider30,
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Omitir"),
                                    dividerWidth12,
                                    Container(
                                      padding: const EdgeInsets.all(16.0),
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Color(0xfff72585),
                                                Color(0xff480ca8),
                                              ])),
                                      child: Container(
                                        padding: const EdgeInsets.all(2.0),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.chevron_right,
                                          color: kBrandPrimaryColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     Container(
          //       height: 18.0,
          //       width: 18.0,
          //       decoration: BoxDecoration(
          //         color: _currentPage == 0 ? Colors.red : Colors.black26,
          //         shape: BoxShape.circle,
          //       ),
          //     ),
          //     Container(
          //       height: 18.0,
          //       width: 18.0,
          //       decoration: BoxDecoration(
          //         color: _currentPage == 1 ? Colors.red : Colors.black26,
          //         shape: BoxShape.circle,
          //       ),
          //     ),
          //     Container(
          //       height: 18.0,
          //       width: 18.0,
          //       decoration: BoxDecoration(
          //         color: _currentPage == 2 ? Colors.red : Colors.black26,
          //         shape: BoxShape.circle,
          //       ),
          //     ),
          //     AnimatedContainer(
          //       duration: Duration(milliseconds: 300),
          //       height: 18.0,
          //       width: _currentPage == 3 ? 40 : 18.0,
          //       decoration: BoxDecoration(
          //         color: _currentPage == 3 ? Colors.red : Colors.black26,
          //         borderRadius: BorderRadius.circular(20.0),
          //       ),
          //     ),
          //     Container(
          //       height: 18.0,
          //       width: 18.0,
          //       decoration: BoxDecoration(
          //         color: _currentPage == 4 ? Colors.red : Colors.black26,
          //         shape: BoxShape.circle,
          //       ),
          //     ),
          //
          //   ],
          // ),
          // ElevatedButton(
          //   onPressed: () {},
          //   child: Text("Iniciar ahora"),
          // ),
        ],
      ),
    );
  }
}