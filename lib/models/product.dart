import 'package:equatable/equatable.dart'; 

class Product extends Equatable {
  final int id;
  final String name;
  final String summary;
  final String logo;

  Product({this.id, this.name, this.summary, this.logo});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      name: json["name"],
      summary: json["summary"],
      logo: json["logo"],
    );
  }

  @override
  List<Object> get props => [id, name, summary, logo];
}
