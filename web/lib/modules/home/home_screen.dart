import 'package:airbagcleaner/modules/dropzone/dropzone_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String currentBrand = 'One';
  String currentModel = 'One';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          height: 400.0,
          width: 400.0,
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DropdownButton(
                  value: currentBrand,
                  onChanged: (String newValue) {
                    setState(() {
                      currentBrand = newValue;
                    });
                  },
                  isExpanded: true,
                  iconSize: 30.0,
                  items: <String>['One', 'Two', 'Free', 'Four']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList()),
              SizedBox(height: 8.0),
              DropdownButton(
                  value: currentModel,
                  onChanged: (String newValue) {
                    setState(() {
                      currentModel = newValue;
                    });
                  },
                  isExpanded: true,
                  iconSize: 30.0,
                  items: <String>['One', 'Two', 'Free', 'Four']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList()),
              SizedBox(height: 16.0),
              DropZoneWidget(),
              SizedBox(height: 16.0),
              RaisedButton(onPressed: () {}, child: Text("Remover"))
            ],
          ),
        ),
      ),
    );
  }
}
