import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tubes_lomboknation/models/hotels_json_model.dart';
import 'package:http/http.dart' as http;

Future<List<HotelJsonModel>> fetchHotelAPI(http.Client client) async {
  final response =
      await client.get(Uri.parse('https://api.npoint.io/8a11564f0e986c7a75c4'));
  return compute(parseHotelJson, response.body);
}

List<HotelJsonModel> parseHotelJson(String responseBody) {
  // parse json into a list of hotel json model objects
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed
      .map<HotelJsonModel>((json) => HotelJsonModel.fromJson(json))
      .toList();
}

class HotelCarousel extends StatelessWidget {
  HotelCarousel({Key? key}) : super(key: key);

  var _jsonItems = fetchHotelAPI(http.Client());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<HotelJsonModel>>(
        future: fetchHotelAPI(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('An error has occured!'));
          } else if (snapshot.hasData) {
            return hotelList(hotels: snapshot.data!);
          } else {
            return const Center(
              child: Text('Data not loaded!'),
            );
          }
        });
  }
}

class hotelList extends StatelessWidget {
  const hotelList({Key? key, required this.hotels}) : super(key: key);

  final List<HotelJsonModel> hotels;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width * 0.8,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0.0, 2.0),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Stack(
                children: <Widget>[
                  Image.network(
                    'https://picsum.photos/200',
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width * 0.8,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    left: 10.0,
                    bottom: 10.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          hotels[index].judul,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          hotels[index].lokasi,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
