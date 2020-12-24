import 'package:airbagcleaner/modules/dropzone/dropzone_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ItemScreen extends StatefulWidget {
  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        centerTitle: false,
        backgroundColor: Colors.white,
        title: Text("Airbag Cleaner", style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: Icon(Icons.plus_one, color: Colors.black),
            tooltip: 'Contribute',
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(left: 32.0, top: 32.0, right: 32.0),
        child: ListView(
          children: [
            Text("Info", style: TextStyle(color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(text: 'Brand: '),
                  TextSpan(
                      text: 'Honda'.toUpperCase(),
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(text: 'Car: '),
                  TextSpan(
                      text: 'Civic'.toUpperCase(),
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(text: 'Year: '),
                  TextSpan(
                      text: '2015'.toUpperCase(),
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(text: 'Chip Info: '),
                  TextSpan(
                      text: '95320'.toUpperCase(),
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(text: 'COD: '),
                  TextSpan(
                      text: '1T454-454-FFFF-EEEE'.toUpperCase(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0)),
                ],
              ),
            ),
            SizedBox(height: 32.0),
            Text("Images", style: TextStyle(color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            CarouselSlider(
              options: CarouselOptions(height: 400.0),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(4.0)));
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 32.0),
            Text("Upload Crash File", style: TextStyle(color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            DropZoneWidget(),
            SizedBox(height: 32.0)
          ],
        ),
      ),
    );
  }
}
