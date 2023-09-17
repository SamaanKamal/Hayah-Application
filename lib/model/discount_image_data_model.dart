class DiscountImageDataModel {
  DiscountImageDataModel({
    required this.DiscountID,
    required this.DiscountNumber,
    required this.LabName,
    required this.percentage,
  });
  late final int DiscountID;
  late final int DiscountNumber;
  late final String LabName;
  late final int percentage;

  DiscountImageDataModel.fromJson(Map<String, dynamic> json){
    DiscountID = json['DiscountID'];
    DiscountNumber = json['DiscountNumber'];
    LabName = json['LabName'];
    percentage = json['percentage'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['DiscountID'] = DiscountID;
    _data['DiscountNumber'] = DiscountNumber;
    _data['LabName'] = LabName;
    _data['percentage'] = percentage;
    return _data;
  }
}