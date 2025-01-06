class SuggestionsModel {
  int? id;
  String? title;
  String? imageType;

  SuggestionsModel({this.id, this.title, this.imageType});

  factory SuggestionsModel.fromJson(Map<String, dynamic> json) {
    return SuggestionsModel(
      id: json['id'],
      title: json['title'],
      imageType: json['imageType'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'imageType': imageType,
      };
}
