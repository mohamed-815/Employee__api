import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:machin__test/const/const.dart';
import 'package:machin__test/controller/funtions.dart';
import 'package:machin__test/model/attendencemodel.dart';

import 'package:machin__test/view/signup_page/sign_page.dart';
import 'package:machin__test/view/widgets/appbarhead.dart';
import 'package:machin__test/view/widgets/custombutton.dart';
import 'package:machin__test/view/widgets/normeltextbold.dart';
import 'package:machin__test/view/widgets/onerowoflist.dart';

class EmbloyeeDetail extends StatelessWidget {
  const EmbloyeeDetail({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.shiftname,
    required this.status,
    required this.attendencemodel,
  });

  final String startTime;
  final String endTime;
  final String shiftname;
  final String status;
  final AttendenceModel attendencemodel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 2, 59, 105),
        body: SafeArea(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.all(4.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () async {
                      // log("Email: ${logindetail.data!.email.toString()}");
                      // log("Company Id: ${logindetail.data!.branch!.companyId}");
                    },
                    child: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),
                  AppHeading(text: "Attendance"),
                  Row(
                    children: [
                      Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                      kwidth,
                      GestureDetector(
                        onTap: () async {
                          final storage = FlutterSecureStorage();
                          await storage.delete(key: "token");
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignPage(),
                              ),
                              (route) => false);
                        },
                        child: Icon(
                          Icons.logout,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(6.h),
              child: Card(
                child: Column(
                  children: [
                    khieght,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.schedule,
                          size: 30,
                          color: Colors.black,
                        ),
                        kwidth,
                        Column(
                          children: [
                            AppHeadingblack(text: shiftname),
                            kwidth,
                            AppHeadingblack(
                                text:
                                    '(${TimeConvertionTo12Hr(time24: startTime)}- ${TimeConvertionTo12Hr(time24: endTime)})')
                          ],
                        )
                      ],
                    ),
                    khieght,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Card(
                          elevation: 9,
                          child: CustomButton(
                              textcolor: Colors.blue,
                              h: 35.h,
                              w: 85.w,
                              bordercolor: Colors.white,
                              text: "CHECK IN",
                              buttoncolor: Colors.white),
                        ),
                        Card(
                          elevation: 9,
                          child: CustomButton(
                              textcolor: Colors.blue,
                              h: 35.h,
                              w: 87.w,
                              bordercolor: Colors.white,
                              text: "CHECK OUT",
                              buttoncolor: Colors.white),
                        ),
                      ],
                    ),
                    khieght,
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(6.h),
                child: Card(
                  child: ListView.separated(
                      itemCount: attendencemodel.data!.length,
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: Colors.black,
                        );
                      },
                      itemBuilder: (context, index) {
                        final item = attendencemodel.data![index];

                        String startTime = item.checkInTime!;
                        String endTime = item.checkOutTime == null
                            ? "0:0:0"
                            : item.checkOutTime!;

                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.fromLTRB(10.h, 10.h, 10.h, 10.h),
                              child: NormalTextBold(text: "${index + 1}"),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  EmployDetailRow(
                                      text1: 'Date', text2: formatedDate(item)),
                                  EmployDetailRow(
                                      text1: 'In Time',
                                      text2: item.checkInTime!),
                                  EmployDetailRow(
                                      text1: 'Out Time',
                                      text2: item.checkOutTime == null
                                          ? "Not Given"
                                          : item.checkOutTime!),
                                  EmployDetailRow(
                                      text1: 'Worked Hours',
                                      text2: item.checkOutTime == null
                                          ? "Unpredictable"
                                          : Timeformating(
                                              startTime: startTime,
                                              endTime: endTime)),
                                  EmployDetailRow(
                                      text1: 'Status',
                                      text2: item.checkInStatus == null
                                          ? "Not Given"
                                          : item.checkInStatus!)
                                ],
                              ),
                            )
                          ],
                        );
                      }),
                ),
              ),
            ),
          ]),
        ));
  }
}
