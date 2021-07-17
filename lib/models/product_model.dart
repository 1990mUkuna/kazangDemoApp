import 'package:equatable/equatable.dart'; 

class ProductModel extends Equatable {
  final int id;
  final String name;
  final String summary;
  final String logo;

  ProductModel({this.id, this.name, this.summary, this.logo});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      name: json["name"],
      summary: json["summary"],
      logo: json["logo"],
    );
  }

  @override
  List<Object> get props => [id, name, summary, logo];
}
