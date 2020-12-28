class Brand {
  int id;
  String brand;
  String image;

  Brand(this.id, this.brand, this.image);

  Brand.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        brand = json['brand'],
        image = json['image'];
}