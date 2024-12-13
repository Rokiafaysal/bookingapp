import 'package:bookingapp/components/ColoreTheme.dart';
import 'package:bookingapp/components/appartmentDetailsCard.dart';
import 'package:bookingapp/data/models/single_appartment_model.dart';
import 'package:bookingapp/domain/repo_impl/reserve_repo/reserve_repo_imp.dart';
import 'package:flutter/material.dart';

class Admindetailsscreen extends StatefulWidget {
  const Admindetailsscreen({super.key, required this.appartementModel});
  final SingleAppartmentModel appartementModel;

  @override
  State<Admindetailsscreen> createState() => _AdmindetailsscreenState();
}

class _AdmindetailsscreenState extends State<Admindetailsscreen> {
  @override
  Widget build(BuildContext context) {
    double myheight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          '',
          style: TextStyle(
            fontFamily: 'Tajawal',
            fontWeight: FontWeight.normal,
            fontSize: 18,
            color: AppColors.gray7,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: 16.0,
                bottom: 12,
                top: myheight * 0.02,
              ),
              child: const Text(
                'المواعيد المحجوزة',
                style: TextStyle(
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColors.gray7,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.appartementModel.dtl.length,
              physics:
                  const NeverScrollableScrollPhysics(), // Prevent scrolling within ListView
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Appartmentdetailscard(
                      date:
                          "${widget.appartementModel.dtl[index].fromDate}  - ${widget.appartementModel.dtl[index].toDate}",
                      description: widget.appartementModel.dtl[index].note,
                      onClickDelete: () async {
                        ReserveRepoImp repoImp = ReserveRepoImp();
                        await repoImp.removeReserve(
                            id: widget.appartementModel.dtl[index].reverseId);
                        setState(() {
                          widget.appartementModel.dtl.removeAt(index);
                        });
                      },
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
