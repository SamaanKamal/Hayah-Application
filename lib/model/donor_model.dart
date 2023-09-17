class DonorModel {
  DonorModel({
    required this.address,
    required this.age,
    required this.bloodType,
    required this.email,
    required this.fname,
    required this.gender,
    required this.id,
    required this.lname,
    required this.message,
    required this.phone,
    required this.success,
  });

  String? address;
  int? age;
  String? bloodType;
  String? email;
  String? fname;
  String? gender;
  int? id;
  String? lname;
  String? message;
  String? phone;
  bool? success;

  DonorModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    age = json['age'];
    bloodType = json['blood_type'];
    email = json['email'];
    fname = json['fname'];
    gender = json['gender'];
    id = json['id'];
    lname = json['lname'];
    message = json['message'];
    phone = json['phone'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['address'] = address;
    _data['age'] = age;
    _data['blood_type'] = bloodType;
    _data['email'] = email;
    _data['fname'] = fname;
    _data['gender'] = gender;
    _data['id'] = id;
    _data['lname'] = lname;
    _data['message'] = message;
    _data['phone'] = phone;
    _data['success'] = success;
    return _data;
  }
}
