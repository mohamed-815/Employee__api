class AttendenceModel {
  int? status;
  List<Data>? data;

  AttendenceModel({this.status, this.data});

  AttendenceModel.fromJson(Map<String, dynamic> json) {
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
  String? employeeId;
  String? checkInTime;
  String? checkOutTime;
  String? checkInStatus;
  String? checkOutStatus;
  String? shiftId;
  String? createdAt;
  String? updateAt;

  Data(
      {this.companyId,
      this.employeeId,
      this.checkInTime,
      this.checkOutTime,
      this.checkInStatus,
      this.checkOutStatus,
      this.shiftId,
      this.createdAt,
      this.updateAt});

  Data.fromJson(Map<String, dynamic> json) {
    companyId = json['companyId'];
    employeeId = json['employeeId'];
    checkInTime = json['checkInTime'];
    checkOutTime = json['checkOutTime'];
    checkInStatus = json['checkInStatus'];
    checkOutStatus = json['checkOutStatus'];
    shiftId = json['shiftId'];
    createdAt = json['createdAt'];
    updateAt = json['updateAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['companyId'] = this.companyId;
    data['employeeId'] = this.employeeId;
    data['checkInTime'] = this.checkInTime;
    data['checkOutTime'] = this.checkOutTime;
    data['checkInStatus'] = this.checkInStatus;
    data['checkOutStatus'] = this.checkOutStatus;
    data['shiftId'] = this.shiftId;
    data['createdAt'] = this.createdAt;
    data['updateAt'] = this.updateAt;
    return data;
  }
}
