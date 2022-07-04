
import 'package:flutter/material.dart';
import 'package:flutter_codigo5_museumapp/models/museum_model.dart';
import 'package:flutter_codigo5_museumapp/ui/general/general_widget.dart';

class ItemSlider2Widget extends StatelessWidget {

  MuseumModel museumModel;

  ItemSlider2Widget({required this.museumModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      margin: const EdgeInsets.only(right: 36.0),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 170,
                width: 170,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      museumModel.image,
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                bottom: -20,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.all(7.0,),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle
                    ),
                    child: Icon(
                      Icons.person,
                      color: Color(0xffD6A527),
                      size: 32,
                    ),
                  ),
                ),
              ),
            ],
          ),
          divider30,
          Text(
            "EXPLORAR",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12.0,
            ),
          ),
          divider6,
          Text(
            museumModel.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
            ),
          ),
          divider6,
          Text(
            museumModel.adress,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}