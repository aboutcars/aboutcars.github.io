import 'package:airbagcleaner/models/brand.dart';
import 'package:airbagcleaner/modules/parser/parser.dart';

class Airbag {
  int brandId;
  Brand brand;
  String model;
  String info;
  String ci;
  dynamic seq;

  Airbag(this.brandId, this.model, this.info, this.ci, this.seq);

  Airbag.fromJson(Map<String, dynamic> json)
      : brandId = json['brand_id'],
        model = json['model'],
        info = json['info'],
        ci = json['ci'],
        seq = json['seq'];

  Parser get parser => Parser(seq);
}
