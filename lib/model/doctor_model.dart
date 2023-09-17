class DoctorModel {
  DoctorModel({
    required this.address,
    required this.centerId,
    required this.email,
    required this.fname,
    required this.id,
    required this.lname,
    required this.message,
    required this.phone,
    required this.success,
  });
  late final String address;
  late final int centerId;
  late final String email;
  late final String fname;
  late final int id;
  late final String lname;
  late final String message;
  late final String phone;
  late final bool success;

  DoctorModel.fromJson(Map<String, dynamic> json){
    address = json['address'];
    centerId = json['center_id'];
    email = json['email'];
    fname = json['fname'];
    id = json['id'];
    lname = json['lname'];
    message = json['message'];
    phone = json['phone'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['address'] = address;
    _data['center_id'] = centerId;
    _data['email'] = email;
    _data['fname'] = fname;
    _data['id'] = id;
    _data['lname'] = lname;
    _data['message'] = message;
    _data['phone'] = phone;
    _data['success'] = success;
    return _data;
  }
}