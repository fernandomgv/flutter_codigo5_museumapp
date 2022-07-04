import 'package:flutter/material.dart';
import 'package:flutter_codigo5_museumapp/ui/general/colors.dart';

class MyAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(double.infinity, 64.0),
      child: AppBar(
        backgroundColor: kBrandPrimaryColor,
        title: const Text(
          "MuseumApp ",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
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
    );
  }
}