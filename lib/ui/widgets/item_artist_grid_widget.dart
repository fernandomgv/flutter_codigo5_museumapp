import 'package:flutter/material.dart';
import 'package:flutter_codigo5_museumapp/models/artisit_model.dart';
import 'package:flutter_codigo5_museumapp/pages/artist_detail_page.dart';
import 'package:flutter_codigo5_museumapp/ui/general/colors.dart';

class ItemGridWidget extends StatelessWidget {
 ArtistModel artist;

  ItemGridWidget({
    required this.artist,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ArtistDetailPage(artist: artist,)));
      },
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                artist.image,
              ),
            )),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [
                    kBrandPrimaryColor.withOpacity(0.7),
                    kBrandPrimaryColor.withOpacity(0.05),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    artist.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 13.0,
                    ),
                  ),
                  Text(
                    "234 items",
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}