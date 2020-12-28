import 'dart:convert';
import 'dart:math';

import 'package:airbagcleaner/models/airbag.dart';
import 'package:airbagcleaner/modules/item/item_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String search = '';
  String brand = 'One';
  String model = 'One';

  List<Airbag> all;

  String norm(String s) =>
      s.toLowerCase().replaceAll('-', ' ').replaceAll(' ', '');

  List<Airbag> get current {
    if (all == null) {
      return [];
    }

    final s = norm(search);

    final temp = all.where((e) => norm(e.brand).contains(s) ||
          norm(e.model).contains(s) ||
          norm(e.info).contains(s)).toList();

    return temp.sublist(0, min(50, temp.length));
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final temp = List<Airbag>.from(json
          .decode(await DefaultAssetBundle.of(context).loadString("data.json"))
          .map((e) => Airbag.fromJson(e))
          .toList());

      setState(() {
        all = temp;
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
              icon: Icon(Icons.plus_one, color: Colors.black),
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
                              labelText: 'Busca',
                            ),
                            onChanged: (value) {
                              setState(() {
                                search = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: Container(
                            height: 50.0,
                            child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                value: brand,
                                onChanged: (String newValue) {
                                  setState(() {
                                    brand = newValue;
                                  });
                                },
                                items: <String>[
                                  'One',
                                  'Two',
                                  'Free',
                                  'Four'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList()),
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: Container(
                            height: 50.0,
                            child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                value: model,
                                onChanged: (String newValue) {
                                  setState(() {
                                    model = newValue;
                                  });
                                },
                                isExpanded: true,
                                items: <String>[
                                  'One',
                                  'Two',
                                  'Free',
                                  'Four'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList()),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: current.length,
                        itemBuilder: (BuildContext context, int index) {
                          Airbag airbag = current[index];

                          return InkWell(
                            borderRadius: BorderRadius.circular(4.0),
                            child: Container(
                              height: 100.0,
                              margin: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 4.0, // soften the shadow
                                  ),
                                ],
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Text(airbag.brand),
                                  Text(airbag.model),
                                  Text(airbag.info),
                                  Text(airbag.ci)
                                ],
                              ),
                            ),
                            onTap: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ItemScreen()),
                              );
                            },
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
