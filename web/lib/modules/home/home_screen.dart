import 'dart:convert';
import 'dart:math';

import 'package:airbagcleaner/models/airbag.dart';
import 'package:airbagcleaner/models/brand.dart';
import 'package:airbagcleaner/modules/item/item_screen.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String search = '';

  List<Airbag> all;
  Map<int, Brand> brands;

  String norm(String s) =>
      s.toLowerCase().replaceAll('-', ' ').replaceAll(' ', '');

  List<Airbag> get current {
    if (all == null) {
      return [];
    }

    final s = norm(search);

    var temp = all
        .where((e) => norm(e.model).contains(s) || norm(e.info).contains(s))
        .map((e) => e..brand = brands[e.brandId])
        .toList();

    if (s.isEmpty) {
      temp.shuffle();
    }

    return temp.sublist(0, min(50, temp.length));
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final tempBrands = List<Brand>.from(json
          .decode(
              await DefaultAssetBundle.of(context).loadString("data/brands.json"))
          .map((e) => Brand.fromJson(e))
          .toList());

      final tempAll = List<Airbag>.from(json
          .decode(await DefaultAssetBundle.of(context).loadString("data/data.json"))
          .map((e) => Airbag.fromJson(e))
          .toList());

      setState(() {
        all = tempAll;
        brands =
            Map.fromIterable(tempBrands, key: (e) => e.id, value: (e) => e);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Colors.white,
          title: Text("Airbag Cleaner", style: TextStyle(color: Colors.black)),
          actions: [
            IconButton(
              icon: FaIcon(FontAwesomeIcons.github, color: Colors.black),
              tooltip: 'Contribute',
              onPressed: () {},
            ),
          ],
        ),
        body: all == null
            ? Center(child: CircularProgressIndicator())
            : Container(
                margin: EdgeInsets.only(left: 32.0, top: 32.0, right: 32.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(),
                              labelText: 'Search',
                            ),
                            onChanged: (value) {
                              setState(() {
                                search = value;
                              });
                            },
                          ),
                        ),
                        // SizedBox(width: 8.0),
                        // Expanded(
                        //     child: Container(
                        //   height: 50.0,
                        //   child: DropdownButtonFormField<Brand>(
                        //       decoration: InputDecoration(
                        //         border: OutlineInputBorder(),
                        //       ),
                        //       value: brand,
                        //       onChanged: (Brand newValue) {
                        //         setState(() {
                        //           brand = newValue;
                        //         });
                        //       },
                        //       items: List<DropdownMenuItem<Brand>>.from(
                        //           brands.values.map<DropdownMenuItem>((e) {
                        //         return DropdownMenuItem<Brand>(
                        //           value: e,
                        //           child: Text(e.brand),
                        //         );
                        //       }).toList())),
                        // ))
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: current.length,
                        itemBuilder: (BuildContext context, int index) {
                          Airbag airbag = current[index];

                          return Card(
                            elevation: 4.0,
                            child: Container(
                              height: 128.0,
                              padding: EdgeInsets.all(24.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                color: Colors.white,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset('data/' + airbag.brand.image,
                                      width: 128),
                                  Expanded(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: AutoSizeText(airbag.brand.brand.toUpperCase(),
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold)),
                                          ),
                                          Expanded(child: AutoSizeText(airbag.model))
                                        ]),
                                  ),
                                  SizedBox(width: 8.0),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: AutoSizeText(airbag.info.toUpperCase(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 24.0)),
                                        ),
                                        Expanded(
                                          child: AutoSizeText(airbag.ci.toUpperCase(),
                                              style: TextStyle(fontSize: 16.0)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 16.0),
                                  IconButton(
                                      icon: Icon(Icons.arrow_forward),
                                      onPressed: () => {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ItemScreen(airbag)),
                                            )
                                          })
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: 8.0);
                        },
                      ),
                    )
                  ],
                ),
              ));
  }
}
