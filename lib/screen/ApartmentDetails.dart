import 'dart:ffi';

import 'package:bookingapp/components/ColoreTheme.dart';
import 'package:bookingapp/components/calender/calenderGrid.dart';
import 'package:bookingapp/components/calender/calenderheader.dart';
import 'package:bookingapp/components/datapicker.dart';
import 'package:bookingapp/components/defaultTextField.dart';
import 'package:bookingapp/components/defultButton.dart';
import 'package:bookingapp/data/models/appartment_model.dart';
import 'package:bookingapp/data/models/reserve_model.dart';
import 'package:bookingapp/data/models/single_appartment_model.dart';
import 'package:bookingapp/domain/repo_impl/reserve_repo/reserve_repo_imp.dart';
import 'package:bookingapp/main.dart';
import 'package:bookingapp/screen/HomeScreen.dart';
import 'package:bookingapp/screen/adminDetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Apartmentdetails extends StatefulWidget {
  final SingleAppartmentModel appartementModel;
  final String userType;
  const Apartmentdetails(
      {super.key, required this.appartementModel, required this.userType});

  @override
  State<Apartmentdetails> createState() => _ApartmentdetailsState();
}

class _ApartmentdetailsState extends State<Apartmentdetails> {
  List<int> highlightedDates = [];
  var fromController = TextEditingController();
  var ToController = TextEditingController();
  var descriptionController=TextEditingController();
  int year = DateTime.now().year;
  int month = DateTime.now().month;
  List<int> getDifferenceDays(DateTime startDate, DateTime endDate) {
    // Ensure the startDate is before or the same as endDate
    if (startDate.isAfter(endDate)) {
      throw ArgumentError("startDate must be before or equal to endDate");
    }

    List<int> daysDifference = [];
    DateTime currentDate = startDate;

    while (currentDate.isBefore(endDate) ||
        currentDate.isAtSameMomentAs(endDate)) {
      daysDifference
          .add(currentDate.day); // Add the day number of the currentDate
      currentDate = currentDate.add(Duration(days: 1)); // Move to the next day
    }

    return daysDifference;
  }

  Future<void> gethighlighteddays() async {
    for (var i = 0; i < widget.appartementModel.dtl.length; i++) {
      setState(() {
        highlightedDates += (getDifferenceDays(
            DateTime.parse((widget.appartementModel.dtl[i].fromDate)),
            DateTime.parse((widget.appartementModel.dtl[i].toDate))));
      });
    }
  }

  String convertDateFormat(String date) {
    // Parse the string date into a DateTime object
    DateTime parsedDate = DateTime.parse(date);

    // Format the DateTime object into DD-MM-YYYY
    String formattedDate = DateFormat('yyyy-MM-dd').format(parsedDate);

    return formattedDate;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    highlightedDates = [];
    gethighlighteddays();
  }

  void _updateMonth(int newYear, int newMonth) {
    setState(() {
      year = newYear;
      month = newMonth;
    });
  }

  @override
  Widget build(BuildContext context) {
    double mywidth = MediaQuery.of(context).size.width;
    double myheight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          widget.appartementModel.name,
          style: TextStyle(
            fontFamily: 'Tajawal',
            fontWeight: FontWeight.normal,
            fontSize: 18,
            color: AppColors.gray7,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: mywidth * 0.04,
          right: mywidth * 0.04,
          top: myheight * 0.02,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'المواعيد المحجوزة و المتاحه',
                    style: const TextStyle(
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColors.gray7,
                    ),
                  ),
                ],
              ),
              CalendarHeader(
                year: year,
                month: month,
                onPrevious: () {
                  int newYear = month == 1 ? year - 1 : year;
                  int newMonth = month == 1 ? 12 : month - 1;
                  _updateMonth(newYear, newMonth);
                },
                onNext: () {
                  int newYear = month == 12 ? year + 1 : year;
                  int newMonth = month == 12 ? 1 : month + 1;
                  _updateMonth(newYear, newMonth);
                },
              ),
              SizedBox(
                height: 230,
                child: CalendarGrid(
                  year: year,
                  month: month,
                  highlightedDates: highlightedDates,
                  onMonthChange: _updateMonth,
                ),
              ),
              MyApp.userType ==1 ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  DefaultButton(

                    colored: true, onClick: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Admindetailsscreen(),));
                    }, text: 'تفاصيل ',width: 106,height: 38,),
                ],
              ) : SizedBox(),
              Padding(
                padding: EdgeInsets.only(bottom: 16.0,top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MyApp.userType == 1
                        ? const Text(
                            ' حجز الشقة ',
                            style: TextStyle(
                              fontFamily: 'Tajawal',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: AppColors.gray7,
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
              MyApp.userType == 1
                  ? Container(
                      width: mywidth * (361 / 393),
                   
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.gray1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [


                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(
                                // Ensure the TextField gets enough space
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12, left: 16, right: 10),
                                  child: DatePickerField(
                                    hintText: 'الي',
                                    labelText: 'الي',
                                    dateController: ToController,
                                  ),
                                ),
                              ),
                              Flexible(
                                // Ensure the TextField gets enough space
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 12.0,
                                    right: 16,
                                  ),
                                  child: DatePickerField(
                                    labelText: 'من',
                                    hintText: 'من',
                                    dateController: fromController,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Flexible(
                            child: Padding(
                                  padding: const EdgeInsets.only(left: 16.0, right: 16.0,bottom: 20,top: 12),
                              child: DefaultTextField(
                                maxline: 5,
                                minline: 1,
                               expands: true,
                                label: 'وصف', hintText: 'اكتب الوصف', textController: descriptionController, type: TextInputType.text),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 16.0, right: 16.0,bottom: 16),
                            child: DefaultButton(
                                colored: true,
                                onClick: () async {
                                  if (fromController.text != "" &&
                                      ToController.text != "") {
                                    ReserveRepoImp reserveRepoImp =
                                        ReserveRepoImp();
                                    Reserve _res = Reserve(
                                      appartementId: widget.appartementModel.id,
                                      fromDate: fromController.text,
                                      toDate: ToController.text,
                                    );
                                    var res = await reserveRepoImp
                                        .createReseervation(reserv: _res);
                                    if (res.message == 1) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(res.extramessage),
                                          duration: Duration(seconds: 3),
                                          action: SnackBarAction(
                                            label: '',
                                            onPressed: () {
                                              // Code to undo the change
                                              print('Undo action performed!');
                                            },
                                          ),
                                        ),
                                      );
                                    } else {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            insetPadding:
                                                const EdgeInsets.all(16),
                                            contentPadding:
                                                const EdgeInsets.all(0),
                                            backgroundColor:
                                                AppColors.primaryColor,
                                            actions: [
                                              Center(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      16.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      SizedBox(
                                                          width: 70,
                                                          height: 60,
                                                          child: Image.asset(
                                                              'assets/done.png')),
                                                      const Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                top: 16.0),
                                                        child: Text(
                                                          '  تم الحجز ',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Tajawal',
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                top: 30.0),
                                                        child: DefaultButton(
                                                          colored: true,
                                                          onClick: () async {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          HomePage(),
                                                                ));
                                                          },
                                                          text: 'Back to home',
                                                          colorButton:
                                                              const Color
                                                                  .fromARGB(
                                                                  255,
                                                                  240,
                                                                  240,
                                                                  240),
                                                          color: AppColors
                                                              .primaryColor,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("برجاء اختيار تاريخ"),
                                        duration: Duration(seconds: 3),
                                        action: SnackBarAction(
                                          label: '',
                                          onPressed: () {
                                            // Code to undo the change
                                            print('Undo action performed!');
                                          },
                                        ),
                                      ),
                                    );
                                  }
                                },
                                text: 'احجز الان'),
                          )
                        ],
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
