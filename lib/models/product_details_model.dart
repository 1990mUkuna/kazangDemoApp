import 'package:equatable/equatable.dart'; 

class ProductDetailsModel extends Equatable {
    final int id;
    final String name;
    final String summary;
    final String description;
    final String logo;
    final List<String> gallery;

  ProductDetailsModel({
    this.id,
    this.name,
    this.description,
    this.summary,
    this.gallery,
    this.logo
    
    });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      id: json["id"],
        name: json["name"],
        summary: json["summary"],
        description: json["description"],
        logo: json["logo"],
        gallery: List<String>.from(json["gallery"].map((x) => x)),
    );
  }

  @override
  List<Object> get props => [id, name, summary, logo];
}
