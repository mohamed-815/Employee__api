import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:machin__test/const/conststring.dart';
import 'package:machin__test/model/attendencemodel.dart';
import 'package:machin__test/model/embloyeeemailmodel.dart';
import 'package:machin__test/model/shiftmodel.dart';

class EmployeeService {
  Future<EmployEmailModel> getEmployeebyemail(
      {required String companyid, required String email}) async {
    final client = http.Client();
    const url = "${baseUrl}employee/getEmployeeByEmail";
    final uri = Uri.parse(url);
    final storage = FlutterSecureStorage();
    final token = await storage.read(key: "token");
    final header = {"Authorization": token!};

    final body = {"companyId": "$companyid", "email": "$email"};
    final response = await client.post(uri, body: body, headers: header);
    if (response.statusCode == 200) {
      log(response.body.toString());
      final json = jsonDecode(response.body);
      return EmployEmailModel.fromJson(json);
    } else {
      log(response.body.toString());
      return Future.error('some thing went wrong');
    }
  }

  Future<ShiftModel> getShiftByShiftId(
      {required String companyid, required String shiftid}) async {
    final client = http.Client();
    const url = "${baseUrl}shift/getShiftByShiftId";

    final uri = Uri.parse(url);
    final storage = FlutterSecureStorage();
    final token = await storage.read(key: "token");

    final header = {"Authorization": token!};

    log(companyid);
    log(shiftid);
    final body = {
      "companyId": "$companyid",
      "shiftId": "$shiftid",
    };

    final response = await client.post(uri, body: body, headers: header);
    if (response.statusCode == 200) {
      log(response.body.toString());
      final json = jsonDecode(response.body);
      return ShiftModel.fromJson(json);
    } else {
      log(response.body.toString());
      return Future.error('some thing went wrong');
    }
  }

  Future<AttendenceModel> getEmpAttendance(
      {required String companyid, required String empid}) async {
    final client = http.Client();
    const url = "${baseUrl}employee/getEmpAttendance";

    final uri = Uri.parse(url);
    final storage = FlutterSecureStorage();
    final token = await storage.read(key: "token");

    final header = {"Authorization": token!};

    log("ompany Id" + companyid);
    log("Employee Id" + empid);

    final body = {"companyId": "$companyid", "employeeId": "$empid"};

    final response = await client.post(uri, body: body, headers: header);

    if (response.statusCode == 200) {
      log(response.body.toString());

      final json = jsonDecode(response.body);
      return AttendenceModel.fromJson(json);
    } else {
      log(response.body.toString());
      return Future.error('some thing went wrong');
    }
  }
}
