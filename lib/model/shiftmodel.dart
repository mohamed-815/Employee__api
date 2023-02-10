class ShiftModel {
  int? status;
  List<Data>? data;

  ShiftModel({this.status, this.data});

  ShiftModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? companyId;
  String? shiftId;
  String? shiftName;
  String? startTime;
  String? endTime;
  String? branch;
  String? department;
  String? status;
  int? active;

  Data(
      {this.companyId,
      this.shiftId,
      this.shiftName,
      this.startTime,
      this.endTime,
      this.branch,
      this.department,
      this.status,
      this.active});

  Data.fromJson(Map<String, dynamic> json) {
    companyId = json['companyId'];
    shiftId = json['shiftId'];
    shiftName = json['shiftName'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    branch = json['branch'];
    department = json['department'];
    status = json['status'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['companyId'] = this.companyId;
    data['shiftId'] = this.shiftId;
    data['shiftName'] = this.shiftName;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['branch'] = this.branch;
    data['department'] = this.department;
    data['status'] = this.status;
    data['active'] = this.active;
    return data;
  }
}
