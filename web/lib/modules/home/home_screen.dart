import 'dart:convert';

import 'package:airbagcleaner/models/airbag.dart';
import 'package:airbagcleaner/modules/item/item_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String currentBrand = 'One';
  String currentModel = 'One';

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
        body: Container(
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
                          value: currentBrand,
                          onChanged: (String newValue) {
                            setState(() {
                              currentBrand = newValue;
                            });
                          },
                          items: <String>['One', 'Two', 'Free', 'Four']
                              .map<DropdownMenuItem<String>>((String value) {
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
                          value: currentModel,
                          onChanged: (String newValue) {
                            setState(() {
                              currentModel = newValue;
                            });
                          },
                          isExpanded: true,
                          items: <String>['One', 'Two', 'Free', 'Four']
                              .map<DropdownMenuItem<String>>((String value) {
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
                  itemCount: 32,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      borderRadius: BorderRadius.circular(4.0),
                      child: Container(
                          height: 100.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color: Colors.grey,
                          )),
                      onTap: () async {
                        String data = await DefaultAssetBundle.of(context).loadString("data.json");
                        List<dynamic> data2 = json.decode(data);
                        List<Airbag> airbags = data2.map((e) => Airbag.fromJson(e)).toList();

                        print(airbags[0]);

                        // Response response = await Dio().get("data.json");
                        // print(response);

                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => ItemScreen()),
                        // );
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
