import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:machin__test/const/const.dart';
import 'package:machin__test/view/emloyee_screen/domain/employeeservice.dart';
import 'package:machin__test/view/emloyee_screen/employee_detail.dart';
import 'package:machin__test/view/signup_page/domain/signup_service.dart';
import 'package:machin__test/view/widgets/custombutton.dart';
import 'package:machin__test/view/widgets/normeltextbold.dart';
import 'package:machin__test/view/widgets/textformfield.dart';

class SignPage extends StatelessWidget {
  SignPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 2, 59, 105),
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 2, 59, 105),
          ),
          padding: EdgeInsets.fromLTRB(20, 200, 20, 200),
          child: Card(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: Color.fromARGB(230, 255, 255, 255),
                  ),
                  height: 50,
                  child: TabBar(
                    indicatorColor: Color.fromARGB(149, 18, 143, 165),
                    tabs: [
                      Tab(
                        child: TabText(
                          text: "Sign In",
                        ),
                      ),
                      Tab(
                        child: TabText(
                          text: 'Sign Up',
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      signUpPage(),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          color: Color.fromARGB(230, 255, 255, 255),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class signUpPage extends StatelessWidget {
  signUpPage({
    Key? key,
  }) : super(key: key);

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
        color: Color.fromARGB(230, 255, 255, 255),
      ),
      child: Column(children: [
        khieght,
        khieght,
        khieght,
        CustomBoldText(
          text: "Email",
        ),
        khieght,
        TextFieldCustom(
          password: false,
          controller: emailcontroller,
          text: "Input Your email",
        ),
        khieght,
        CustomBoldText(
          text: "Password",
        ),
        khieght,
        TextFieldCustom(
          password: true,
          controller: passwordcontroller,
          text: "Input Your password",
          icon: obstacure == true ? Icons.visibility_off : Icons.visibility,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [TabText(text: "Forgot Password?")],
        ),
        khieght,
        CustomButton(
          textcolor: Colors.black,
          h: 27.h,
          w: 270.w,
          bordercolor: Color.fromARGB(141, 18, 140, 165),
          text: "Sign in",
          buttoncolor: Color.fromARGB(149, 18, 143, 165),
          fun: () async {
            const storage = FlutterSecureStorage();

            log("email ${emailcontroller.text.toString()}");
            final response = await SignupService().signIn(
                email: emailcontroller.text.trim(),
                password: passwordcontroller.text.trim());

            if (response.status == 1) {
              await storage.write(
                key: 'token',
                value: response.data!.accessToken.toString(),
              );
              final employeeEmailmodel =
                  await EmployeeService().getEmployeebyemail(
                email: response.data!.user!.email!,
                companyid: response.data!.branch!.companyId!,
              );

              final shiftmodel = await EmployeeService().getShiftByShiftId(
                companyid: response.data!.branch!.companyId!,
                shiftid: employeeEmailmodel.data![0].shift!,
              );

              final attendencemodel = await EmployeeService().getEmpAttendance(
                companyid: response.data!.branch!.companyId!,
                empid: employeeEmailmodel.data![0].empId.toString(),
              );
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EmbloyeeDetail(
                      startTime: shiftmodel.data![0].startTime.toString(),
                      endTime: shiftmodel.data![0].endTime.toString(),
                      shiftname: shiftmodel.data![0].shiftName.toString(),
                      status: shiftmodel.data![0].status.toString(),
                      attendencemodel: attendencemodel),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("some thing went wrong")));
            }
          },
        ),
        khieght,
        CustomButton(
            textcolor: Colors.black,
            h: 27.h,
            w: 270.w,
            bordercolor: Color.fromARGB(141, 18, 140, 165),
            text: "Sign with google",
            buttoncolor: Colors.white)
      ]),
    );
  }
}
