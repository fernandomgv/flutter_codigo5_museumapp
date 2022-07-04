import 'package:flutter/material.dart';
import 'package:flutter_codigo5_museumapp/models/museum_model.dart';
import 'package:flutter_codigo5_museumapp/pages/home_page.dart';
import 'package:flutter_codigo5_museumapp/ui/general/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../services/api_service.dart';
import 'explorer_page.dart';
import 'favorite_page.dart';

class InitPage extends StatefulWidget {
  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  int _currentIndex = 0;



  List<Widget> _pages = [
    HomePage(),
    ExplorerPage(),
    FavoritePage(),
    Text("Page 4"),
  ];



  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      appBar: AppBar(
        backgroundColor: kBrandPrimaryColor,
        title: const Text(
          "MuseumApp ",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.cast,
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          const CircleAvatar(
            radius: 16.0,
            backgroundColor: Colors.white10,
            backgroundImage: AssetImage('assets/images/fmogollon.jpg'),
          ),
          const SizedBox(
            width: 10.0,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.miniCenterFloat,
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kBrandPrimaryColor,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white54,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (int index) {
          _currentIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/bx-home-alt-2.svg',
              color: _currentIndex == 0 ? Colors.blue : Colors.white,
            ),
            label: "Inicio",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/bx-compass.svg',
              color: _currentIndex == 1 ? Colors.blue : Colors.white,
            ),
            label: "Explorar",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/bx-heart.svg',
              color: _currentIndex == 2 ? Colors.blue : Colors.white,
            ),
            label: "Favoritos",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/bx-user.svg',
              color: _currentIndex == 3 ? Colors.blue : Colors.white,
            ),
            label: "Perfil",
          ),
        ],
      ),
    );
  }
}