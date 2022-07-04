import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_codigo5_museumapp/models/artisit_model.dart';
import 'package:flutter_codigo5_museumapp/models/museum_model.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

class APIService {
  Logger logger = Logger();

  Future<List<MuseumModel>> getMuseums() async {
    try {
      //String _path = "http://192.168.8.184:8000/API/museum/";
      String _path = "http://192.168.8.103:8000/API/museum/";
      //String _path = "http://172.16.47.41:8000/API/museum/";
      Uri _uri = Uri.parse(_path);
      http.Response response = await http.get(_uri);
      if(response.statusCode == 200){
        String source = const Utf8Decoder().convert(response.bodyBytes);
        List museums = json.decode(source);
        List<MuseumModel> museumsModelList = museums.map((e) => MuseumModel.fromJson(e)).toList();
        return museumsModelList;
      }
      return [];

    } on TimeoutException catch (error) {
      //
      return Future.error("Error: TimeoutException");
    } on SocketException catch (error) {
      //
      return Future.error("Error: SocketException");
    } on FormatException catch (error) {
      //
      return Future.error("Error: FormatException");
    } on Error catch (error) {
      print(error);
      return Future.error("Error");
    }
  }
  Future<List<ArtistModel>> getArtists() async {
    try {
      //String _path = "http://192.168.8.184:8000/API/artist/";
      String _path = "http://192.168.8.103:8000/API/artist/";
      //String _path = "http://172.16.47.41:8000/API/artist/";
      Uri _uri = Uri.parse(_path);
      http.Response response = await http.get(_uri);
      if(response.statusCode == 200){
        String source = const Utf8Decoder().convert(response.bodyBytes);
        List artists = json.decode(source);
        List<ArtistModel> artistModellList = artists.map((e) => ArtistModel.fromJson(e)).toList();
        return artistModellList;
      }
      return [];

    } on TimeoutException catch (error) {
      //
      return Future.error("Error: TimeoutException");
    } on SocketException catch (error) {
      //
      return Future.error("Error: SocketException");
    } on FormatException catch (error) {
      //
      return Future.error("Error: FormatException");
    } on Error catch (error) {
      print(error);
      return Future.error("Error");
    }
  }
}