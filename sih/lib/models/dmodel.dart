class Autogenerated {
  String? sId;
  String? name;
  String? phone;
  String? experince;
  String? address;
  String? about;
  int? iV;

  Autogenerated(
      {this.sId,
      this.name,
      this.phone,
      this.experince,
      this.address,
      this.about,
      this.iV});

  Autogenerated.fromJson(Map<dynamic, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    phone = json['phone'];
    experince = json['experince'];
    address = json['address'];
    about = json['about'];
    iV = json['__v'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['experince'] = this.experince;
    data['address'] = this.address;
    data['about'] = this.about;
    data['__v'] = this.iV;
    return data;
  }
}
