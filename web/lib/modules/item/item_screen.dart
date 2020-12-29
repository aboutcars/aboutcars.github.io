import 'package:airbagcleaner/models/airbag.dart';
import 'package:airbagcleaner/modules/dropzone/dropzone_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ItemScreen extends StatelessWidget {

  final Airbag airbag;

  ItemScreen(this.airbag);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        centerTitle: false,
        backgroundColor: Colors.white,
        title: Text("Airbag Cleaner", style: TextStyle(color: Colors.black)),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 32.0, top: 32.0, right: 32.0),
        child: ListView(
          children: [
            Row(
              children: [
                Image.asset('data/'+airbag.brand.image, width: 128),
                SizedBox(width: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(text: 'Brand: '),
                          TextSpan(
                              text: airbag.brand.brand.toUpperCase(),
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(text: 'Model: '),
                          TextSpan(
                              text: airbag.model.toUpperCase(),
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
                              text: airbag.ci.toUpperCase(),
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
                              text: airbag.info.toUpperCase(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.0)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 32.0),
            Text("Images",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold)),
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
            Text("Upload Crash File",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            DropZoneWidget(airbag.parser),
            SizedBox(height: 32.0)
          ],
        ),
      ),
    );
  }
}
