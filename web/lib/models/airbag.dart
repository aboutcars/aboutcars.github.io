import 'package:airbagcleaner/modules/parser/parser.dart';

class Airbag {
  String brand;
  String model;
  String info;
  String ci;
  dynamic seq;

  Airbag(this.brand, this.model, this.info, this.ci, this.seq);

  Airbag.fromJson(Map<String, dynamic> json)
    : brand = json['brand'],
      model = json['model'],
      info = json['info'],
      ci = json['ci'],
      seq = json['seq'];

  Parser get parser => Parser(seq);
}