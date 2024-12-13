import 'package:bookingapp/components/Card.dart';
import 'package:bookingapp/components/ColoreTheme.dart';
import 'package:bookingapp/data/models/appartment_model.dart';
import 'package:bookingapp/data/models/single_appartment_model.dart';
import 'package:bookingapp/domain/repo_impl/appartment_repo/appartment_repo_impl.dart';
import 'package:bookingapp/main.dart';
import 'package:bookingapp/screen/ApartmentDetails.dart';
import 'package:flutter/material.dart';

List<AppartementModel> appartments = [];

class HomeContent extends StatefulWidget {
  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  void initState() {
    super.initState();
    getAppart();
  }

  Future<void> getAppart() async {
    AppartmentRepoImpl appartmentRepoImpl = AppartmentRepoImpl();
    appartments = await appartmentRepoImpl.getAppartment();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // double mywidth = MediaQuery.of(context).size.width;
    double myheight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(
        top: myheight * (48 / 853),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    MyApp.userName,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.gray7,
                        fontFamily: 'Tajawal'),
                  ),
                ),
              ],
            ),
            ListView.builder(
              padding: const EdgeInsets.all(0),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: appartments.length,
              itemBuilder: (context, index) {
                return CardApartment(
                  title: appartments[index].name,
                  onClick: () async {
                    AppartmentRepoImpl appartmentRepoImpl =
                        AppartmentRepoImpl();
                    SingleAppartmentModel appartementModel =
                        await appartmentRepoImpl.getAppartmentbyid(
                            id: appartments[index].id);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Apartmentdetails(
                          userType: "1",
                          appartementModel: appartementModel,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
