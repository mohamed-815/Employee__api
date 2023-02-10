class EmployEmailModel {
  int? status;
  List<Data>? data;

  EmployEmailModel({this.status, this.data});

  EmployEmailModel.fromJson(Map<String, dynamic> json) {
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
  String? id;
  Null? companyId;
  String? greet;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNo;
  String? civilId;
  String? passportNo;
  String? dob;
  String? gender;
  String? maritalStatus;
  int? country;
  String? address;
  String? city;
  String? zipCode;
  String? empId;
  String? branch;
  Null? department;
  Null? designation;
  String? dutyType;
  String? shift;
  String? hiringDate;
  String? joiningDate;
  String? salaryFrequency;
  int? wage;
  String? bankName;
  String? bankBranchName;
  String? accountNo;
  String? bbanNo;
  String? emergePhoneNo;
  String? emergeContactName;
  String? emrgeContactRel;
  String? officialEmail;
  String? password;
  String? profilePic;
  String? civilIdDate;
  String? passportDate;
  int? genderId;
  int? maritalId;
  int? countryId;
  String? countryName;
  Null? designationCode;

  Data(
      {this.id,
      this.companyId,
      this.greet,
      this.firstName,
      this.lastName,
      this.email,
      this.phoneNo,
      this.civilId,
      this.passportNo,
      this.dob,
      this.gender,
      this.maritalStatus,
      this.country,
      this.address,
      this.city,
      this.zipCode,
      this.empId,
      this.branch,
      this.department,
      this.designation,
      this.dutyType,
      this.shift,
      this.hiringDate,
      this.joiningDate,
      this.salaryFrequency,
      this.wage,
      this.bankName,
      this.bankBranchName,
      this.accountNo,
      this.bbanNo,
      this.emergePhoneNo,
      this.emergeContactName,
      this.emrgeContactRel,
      this.officialEmail,
      this.password,
      this.profilePic,
      this.civilIdDate,
      this.passportDate,
      this.genderId,
      this.maritalId,
      this.countryId,
      this.countryName,
      this.designationCode});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['companyId'];
    greet = json['greet'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phoneNo = json['phoneNo'];
    civilId = json['civilId'];
    passportNo = json['passportNo'];
    dob = json['dob'];
    gender = json['gender'];
    maritalStatus = json['maritalStatus'];
    country = json['country'];
    address = json['address'];
    city = json['city'];
    zipCode = json['zipCode'];
    empId = json['empId'];
    branch = json['branch'];
    department = json['department'];
    designation = json['designation'];
    dutyType = json['dutyType'];
    shift = json['shift'];
    hiringDate = json['hiringDate'];
    joiningDate = json['joiningDate'];
    salaryFrequency = json['salaryFrequency'];
    wage = json['wage'];
    bankName = json['bankName'];
    bankBranchName = json['bankBranchName'];
    accountNo = json['accountNo'];
    bbanNo = json['bbanNo'];
    emergePhoneNo = json['emergePhoneNo'];
    emergeContactName = json['emergeContactName'];
    emrgeContactRel = json['emrgeContactRel'];
    officialEmail = json['officialEmail'];
    password = json['password'];
    profilePic = json['profilePic'];
    civilIdDate = json['civilIdDate'];
    passportDate = json['passportDate'];
    genderId = json['genderId'];
    maritalId = json['maritalId'];
    countryId = json['countryId'];
    countryName = json['countryName'];
    designationCode = json['designationCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['companyId'] = this.companyId;
    data['greet'] = this.greet;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['phoneNo'] = this.phoneNo;
    data['civilId'] = this.civilId;
    data['passportNo'] = this.passportNo;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['maritalStatus'] = this.maritalStatus;
    data['country'] = this.country;
    data['address'] = this.address;
    data['city'] = this.city;
    data['zipCode'] = this.zipCode;
    data['empId'] = this.empId;
    data['branch'] = this.branch;
    data['department'] = this.department;
    data['designation'] = this.designation;
    data['dutyType'] = this.dutyType;
    data['shift'] = this.shift;
    data['hiringDate'] = this.hiringDate;
    data['joiningDate'] = this.joiningDate;
    data['salaryFrequency'] = this.salaryFrequency;
    data['wage'] = this.wage;
    data['bankName'] = this.bankName;
    data['bankBranchName'] = this.bankBranchName;
    data['accountNo'] = this.accountNo;
    data['bbanNo'] = this.bbanNo;
    data['emergePhoneNo'] = this.emergePhoneNo;
    data['emergeContactName'] = this.emergeContactName;
    data['emrgeContactRel'] = this.emrgeContactRel;
    data['officialEmail'] = this.officialEmail;
    data['password'] = this.password;
    data['profilePic'] = this.profilePic;
    data['civilIdDate'] = this.civilIdDate;
    data['passportDate'] = this.passportDate;
    data['genderId'] = this.genderId;
    data['maritalId'] = this.maritalId;
    data['countryId'] = this.countryId;
    data['countryName'] = this.countryName;
    data['designationCode'] = this.designationCode;
    return data;
  }
}
