import 'package:covidtrackerapp/API_Data.dart';
import 'package:flutter/material.dart';
import 'Appcolors.dart';
class CountryStatus extends StatefulWidget {
  final CountryData data;
  const CountryStatus({
    Key key,
    @required this.data,
  }) : super(key: key);
  @override
  _CountryStatusState createState() => _CountryStatusState();
}
class _CountryStatusState extends State<CountryStatus> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .15,
      width: MediaQuery.of(context).size.width * .9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 8)
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 15, 15, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                widget.data.countryName,
                style: TextStyle(
                    color: AppColors.colorDarkBlue,
                    letterSpacing: 0.68,
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(widget.data.totalCases.toString(),
                          style: TextStyle(
                              color: AppColors.colorDarkBlue,
                              fontWeight: FontWeight.w800,
                              fontSize: 17)),
                      Text("Tổng Ca",
                          style: TextStyle(
                              color: AppColors.colorDarkBlue,
                              fontWeight: FontWeight.w700,
                              fontSize: 14)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(widget.data.totalActiveCases.toString(),
                          style: TextStyle(
                              color: AppColors.colorPrimary,
                              fontWeight: FontWeight.w800,
                              fontSize: 17)),
                      Text("Ca Đang Mắc",
                          style: TextStyle(
                              color: AppColors.colorPrimary,
                              fontWeight: FontWeight.w700,
                              fontSize: 14)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(widget.data.totalRecovered.toString(),
                          style: TextStyle(
                              color: AppColors.colorGreen,
                              fontWeight: FontWeight.w800,
                              fontSize: 17)),
                      Text("Hồi Phục",
                          style: TextStyle(
                              color:  AppColors.colorGreen,
                              fontWeight: FontWeight.w700,
                              fontSize: 14)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(widget.data.totalDeaths.toString(),
                          style: TextStyle(
                              color: AppColors.colorDarkRed,
                              fontWeight: FontWeight.w800,
                              fontSize: 17)),
                      Text("Tử Vong",
                          style: TextStyle(
                              color:AppColors.colorDarkRed,
                              fontWeight: FontWeight.w700,
                              fontSize: 14)),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
