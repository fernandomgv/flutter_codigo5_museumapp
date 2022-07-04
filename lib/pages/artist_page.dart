import 'package:flutter/material.dart';
import 'package:flutter_codigo5_museumapp/helpers/data/data_dummy.dart';
import 'package:flutter_codigo5_museumapp/models/artisit_model.dart';
import 'package:flutter_codigo5_museumapp/ui/general/colors.dart';
import 'package:flutter_codigo5_museumapp/ui/general/general_widget.dart';
import 'package:flutter_codigo5_museumapp/ui/widgets/item_artist_grid_widget.dart';
import 'package:flutter_codigo5_museumapp/ui/widgets/my_app_bar_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/api_service.dart';

class ArtistPage extends StatefulWidget {
  const ArtistPage({Key? key}) : super(key: key);

  @override
  State<ArtistPage> createState() => _ArtistPageState();
}

class _ArtistPageState extends State<ArtistPage> {

  APIService apiService = APIService();
  List<ArtistModel> artist = [];
  List<ArtistModel> artistAZ = [];
  List<ArtistModel> artistDate = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() {
    apiService.getArtists().then((value) {
      artist = value;
      artistAZ.addAll( artist);
      artistAZ.sort((a,b) => a.name.compareTo(b.name));
      artistDate.addAll(artist);
      artistDate.sort((a,b) => a.birthDate.compareTo(b.birthDate));
      setState(() {

      });
    }).catchError((error) {
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 64.0),
        child: MyAppBar(),
      ),
      body: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              // SliverAppBar(
              //   expandedHeight: 200,
              //   collapsedHeight: 150,
              //   title: Text("AppBar 1"),
              //   centerTitle: true,
              // ),
              SliverAppBar(
                backgroundColor: kBrandPrimaryColor,
                leading: SizedBox(),
                expandedHeight: 200,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Container(
                    height: 100,
                    alignment: Alignment.center,
                    color: Colors.transparent,
                    child: Text(
                      "Artistas",
                      style: GoogleFonts.dmSans(),
                    ),
                  ),
                  centerTitle: true,
                ),
                bottom: const TabBar(
                  indicatorWeight: 4,
                  indicatorColor: Colors.blueAccent,
                  tabs: [
                    Tab(
                      text: "Todos",
                    ),
                    Tab(
                      text: "A-Z",
                    ),
                    Tab(
                      text: "Tiempo",
                    ),
                  ],
                ),
              )
            ];
          },
          body: TabBarView(
            children: [
              // GridView.count(
              //   crossAxisCount: 3,
              //   mainAxisSpacing: 6.0,
              //   crossAxisSpacing: 6.0,
              //   children: [
              //     Container(
              //       color: Colors.indigo,
              //     ),
              //     Container(
              //       color: Colors.red,
              //     ),
              //     Container(
              //       color: Colors.green,
              //     ),
              //   ],
              // ),
              // GridView(
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 4,
              //   ),
              //   children: [
              //     Container(
              //       color: Colors.indigo,
              //     ),
              //     Container(
              //       color: Colors.red,
              //     ),
              //     Container(
              //       color: Colors.green,
              //     ),
              //     Container(
              //       color: Colors.indigo,
              //     ),
              //     Container(
              //       color: Colors.red,
              //     ),
              //     Container(
              //       color: Colors.green,
              //     ),
              //   ],
              // ),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 6.0,
                  mainAxisSpacing: 6.0,
                ),
                itemCount: artist.length, //imagesDummy.length,
                itemBuilder: (context, index) {
                  return ItemGridWidget(artist: artist[index]);
                },
              ),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 6.0,
                  mainAxisSpacing: 6.0,
                ),
                itemCount: artistAZ.length , //imagesDummy.length,
                itemBuilder: (context, index) {
                  return ItemGridWidget(artist: artistAZ[index]);
                },
              ),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 6.0,
                  mainAxisSpacing: 6.0,
                ),
                itemCount: artistDate.length , //imagesDummy.length,
                itemBuilder: (context, index) {
                  return ItemGridWidget(artist: artistDate[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}