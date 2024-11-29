import 'package:bookingapp/components/ColoreTheme.dart';
import 'package:bookingapp/components/calender/calenderGrid.dart';
import 'package:bookingapp/components/calender/calenderheader.dart';
import 'package:bookingapp/components/datapicker.dart';
import 'package:bookingapp/components/defaultTextField.dart';
import 'package:bookingapp/components/defultButton.dart';
import 'package:bookingapp/data/models/appartment_model.dart';
import 'package:bookingapp/data/models/reserve_model.dart';
import 'package:bookingapp/domain/repo_impl/reserve_repo/reserve_repo_imp.dart';
import 'package:bookingapp/screen/HomeScreen.dart';
import 'package:flutter/material.dart';

class Apartmentdetails extends StatefulWidget {
  final AppartementModel appartementModel;
  const Apartmentdetails({super.key, required this.appartementModel});

  @override
  State<Apartmentdetails> createState() => _ApartmentdetailsState();
}

class _ApartmentdetailsState extends State<Apartmentdetails> {
  var fromController = TextEditingController();
  var ToController = TextEditingController();
  int year = 2024;
  int month = 9;

  final List<int> highlightedDates = [
    2,
    3,
    4,
    5,
    10,
    11,
    12,
    13,
    14,
    15,
    24,
    25,
    27,
    28,
    29
  ];

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
                height: 270,
                child: CalendarGrid(
                  year: year,
                  month: month,
                  highlightedDates: highlightedDates,
                  onMonthChange: _updateMonth,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      ' حجز الشقة ',
                      style: TextStyle(
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: AppColors.gray7,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: mywidth * (361 / 393),
                height:
                    myheight * (220 / 853), // Ensure a fixed or flexible height
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.gray1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          // Ensure the TextField gets enough space
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 0, left: 16, right: 10),
                            child: DatePickerField(
                              hintText: '2024/11/12',
                              labelText: 'الي',
                              dateController: fromController,
                            ),
                          ),
                        ),
                        Flexible(
                          // Ensure the TextField gets enough space
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 0.0,
                              right: 16,
                            ),
                            child: DatePickerField(
                              labelText: 'من',
                              hintText: '2024/11/12',
                              dateController: ToController,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: DefaultButton(
                          colored: true,
                          onClick: () async {
                            ReserveRepoImp reserveRepoImp = ReserveRepoImp();
                            Reserve _res = Reserve(
                              appartementId: widget.appartementModel.id,
                              fromDate: fromController.text,
                              toDate: ToController.text,
                            );
                            await reserveRepoImp.createReseervation(
                                reserv: _res);
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  insetPadding: const EdgeInsets.all(16),
                                  contentPadding: const EdgeInsets.all(0),
                                  backgroundColor: AppColors.primaryColor,
                                  actions: [
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                                width: 70,
                                                height: 60,
                                                child: Image.asset(
                                                    'assets/done.png')),
                                            const Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 16.0),
                                              child: Text(
                                                '  تم الحجز ',
                                                style: TextStyle(
                                                  fontFamily: 'Tajawal',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 30.0),
                                              child: DefaultButton(
                                                colored: true,
                                                onClick: () async {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            HomePage(),
                                                      ));
                                                },
                                                text: 'Back to home',
                                                colorButton:
                                                    const Color.fromARGB(
                                                        255, 240, 240, 240),
                                                color: AppColors.primaryColor,
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
                          },
                          text: 'احجز الان'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
