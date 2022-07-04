import 'package:flutter/material.dart';
import 'package:flutter_codigo5_museumapp/ui/general/colors.dart';
import 'package:flutter_codigo5_museumapp/ui/general/general_widget.dart';
import 'package:flutter_codigo5_museumapp/ui/responsive/responsive.dart';
import 'package:flutter_codigo5_museumapp/ui/widgets/my_app_bar_widget.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

import '../models/artisit_model.dart';

class ArtistDetailPage extends StatefulWidget {

  ArtistModel artist;

  ArtistDetailPage({
    required this.artist
});

  @override
  State<ArtistDetailPage> createState() => _ArtistDetailPageState();
}

class _ArtistDetailPageState extends State<ArtistDetailPage> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: ResponsiveUI.pHeight(context, 0.45),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        widget.artist.image,
                      ),
                    ),
                  ),
                ),
                PreferredSize(
                  preferredSize: const Size(double.infinity, 64.0),
                  child: MyAppBar(),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  divider40,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.artist.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.0,
                        ),
                      ),
                    ],
                  ),
                  divider12,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text( DateFormat.yMMMEd().format(widget.artist.birthDate)
                        ,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                  divider30,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.white,
                        ),
                      ),
                      dividerWidth12,
                      dividerWidth6,
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.share,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  divider30,
                  Text(
                    widget.artist.biography,
                    maxLines: !isExpanded ? 3 : null,
                    overflow: !isExpanded
                        ? TextOverflow.ellipsis
                        : TextOverflow.visible,
                    style: TextStyle(
                      height: 1.4,
                      color: Colors.white,
                    ),
                  ),
                  divider6,
                  GestureDetector(
                    onTap: () {
                      isExpanded = !isExpanded;
                      setState(() {});
                    },
                    child: Text(
                      !isExpanded ? "Más información" : "Menos información",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  divider30,

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white12,
                        width: 1.2,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "EXHICIÓN ONLINE",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 13.0,
                                ),
                              ),
                              Text(
                                "Artista destacado",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                              Text(
                                "Lorem ipsum dolor sit amet",
                                style: TextStyle(
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.image_rounded,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),

                  // AnimatedContainer(
                  //   duration: Duration(milliseconds: 1200),
                  //   height: 100,
                  //   color: Colors.red,
                  //   child: Text(
                  //     '''Nació el 30 de marzo de 1853. Hijo de un austero y humilde pastor protestante neerlandés llamado Theodorus y de su mujer Anna Cornelia, Vincent recibió el mismo nombre que le habían puesto a un hermano que nació muerto exactamente un año antes. El 1 de mayo de 1857 nació su hermano Theo y ambos tuvieron cuatro hermanos más: Cornelius Vincent, Elisabetha Huberta, Anna Cornelia y Wilhelmina Jacoba.''',
                  //     // overflow: TextOverflow.ellipsis,
                  //     // maxLines: 3,
                  //     style: TextStyle(
                  //       color: Colors.yellow,
                  //     ),
                  //   ),
                  // ),
                  divider30,
                  divider30,
                  divider30,
                  divider30,
                  divider30,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}