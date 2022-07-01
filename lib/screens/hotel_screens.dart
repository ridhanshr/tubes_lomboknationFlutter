import 'package:flutter/material.dart';
import 'package:tubes_lomboknation/models/hotels_json_model.dart';

class hotelDetailPage extends StatelessWidget {
  hotelDetailPage({Key? key, required this.hotel}) : super(key: key);

  HotelJsonModel hotel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(hotel.judul),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network(
              'https://picsum.photos/200',
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Text(
              hotel.judul,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(hotel.deskripsi),
          ],
        ),
      ),
    );
  }
}
