class LoginModel {
  int? status;
  Data? data;

  LoginModel({this.status, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  User? user;
  String? accessToken;
  Branch? branch;
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? companyName;
  String? companyReg;
  String? companyPref;
  String? website;
  String? contactNo;
  String? companyAddress;
  String? type;
  String? privilege;
  String? createdAt;
  String? logo;
  String? status;
  int? idPref;
  int? invoicePref;
  String? taxNo;
  String? currency;
  String? countryId;

  Data(
      {this.user,
      this.accessToken,
      this.branch,
      this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.companyName,
      this.companyReg,
      this.companyPref,
      this.website,
      this.contactNo,
      this.companyAddress,
      this.type,
      this.privilege,
      this.createdAt,
      this.logo,
      this.status,
      this.idPref,
      this.invoicePref,
      this.taxNo,
      this.currency,
      this.countryId});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    accessToken = json['accessToken'];
    branch =
        json['branch'] != null ? new Branch.fromJson(json['branch']) : null;
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    companyName = json['companyName'];
    companyReg = json['companyReg'];
    companyPref = json['companyPref'];
    website = json['website'];
    contactNo = json['contactNo'];
    companyAddress = json['companyAddress'];
    type = json['type'];
    privilege = json['privilege'];
    createdAt = json['createdAt'];
    logo = json['logo'];
    status = json['status'];
    idPref = json['idPref'];
    invoicePref = json['invoicePref'];
    taxNo = json['taxNo'];
    currency = json['currency'];
    countryId = json['country_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['accessToken'] = this.accessToken;
    if (this.branch != null) {
      data['branch'] = this.branch!.toJson();
    }
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['companyName'] = this.companyName;
    data['companyReg'] = this.companyReg;
    data['companyPref'] = this.companyPref;
    data['website'] = this.website;
    data['contactNo'] = this.contactNo;
    data['companyAddress'] = this.companyAddress;
    data['type'] = this.type;
    data['privilege'] = this.privilege;
    data['createdAt'] = this.createdAt;
    data['logo'] = this.logo;
    data['status'] = this.status;
    data['idPref'] = this.idPref;
    data['invoicePref'] = this.invoicePref;
    data['taxNo'] = this.taxNo;
    data['currency'] = this.currency;
    data['country_id'] = this.countryId;
    return data;
  }
}

class User {
  String? id;
  String? email;
  String? password;
  String? permission;
  String? who;

  User({this.id, this.email, this.password, this.permission, this.who});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    permission = json['permission'];
    who = json['who'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['password'] = this.password;
    data['permission'] = this.permission;
    data['who'] = this.who;
    return data;
  }
}

class Branch {
  String? branchId;
  String? companyId;
  String? branchName;
  String? branchCode;
  String? branchLocation;
  String? branchPhoneNo;
  String? branchAddress;
  String? branchPinCode;
  String? branchCity;
  String? branchState;
  String? branchCountry;
  int? headBranch;

  Branch(
      {this.branchId,
      this.companyId,
      this.branchName,
      this.branchCode,
      this.branchLocation,
      this.branchPhoneNo,
      this.branchAddress,
      this.branchPinCode,
      this.branchCity,
      this.branchState,
      this.branchCountry,
      this.headBranch});

  Branch.fromJson(Map<String, dynamic> json) {
    branchId = json['branchId'];
    companyId = json['companyId'];
    branchName = json['branchName'];
    branchCode = json['branchCode'];
    branchLocation = json['branchLocation'];
    branchPhoneNo = json['branchPhoneNo'];
    branchAddress = json['branchAddress'];
    branchPinCode = json['branchPinCode'];
    branchCity = json['branchCity'];
    branchState = json['branchState'];
    branchCountry = json['branchCountry'];
    headBranch = json['headBranch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['branchId'] = this.branchId;
    data['companyId'] = this.companyId;
    data['branchName'] = this.branchName;
    data['branchCode'] = this.branchCode;
    data['branchLocation'] = this.branchLocation;
    data['branchPhoneNo'] = this.branchPhoneNo;
    data['branchAddress'] = this.branchAddress;
    data['branchPinCode'] = this.branchPinCode;
    data['branchCity'] = this.branchCity;
    data['branchState'] = this.branchState;
    data['branchCountry'] = this.branchCountry;
    data['headBranch'] = this.headBranch;
    return data;
  }
}
