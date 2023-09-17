class DiscountImageModel {
  DiscountImageModel({
    required this.Image_Link,
    required this.key,
  });
  late final String Image_Link;
  late final int key;

  DiscountImageModel.fromJson(Map<String, dynamic> json){
    Image_Link = json['Image_Link'];
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Image_Link'] = Image_Link;
    _data['key'] = key;
    return _data;
  }
}