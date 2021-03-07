import 'package:covidtrackerapp/API_Data.dart';
import 'package:covidtrackerapp/Appcolors.dart';
import 'package:covidtrackerapp/CountryStatus.dart';
import 'package:covidtrackerapp/WorldStatus.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RefreshController _refreshController =
  RefreshController(initialRefresh: false);
  Data _data = new Data();
  CountryData _vietnam = new CountryData();
  List<CountryData> _countrydata = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    Data temp = await getAllData();
    List<CountryData> countrytemp = await getAllCountriesData();

    setState(() {
      _data = temp;
      _countrydata = countrytemp;
      for (int i = 0; i < countrytemp.length; i++) {
        if (countrytemp[i].countryName == "Vietnam") {
          _vietnam = countrytemp[i];
        }
      }
      Comparator<CountryData> comparator =
          (b, a) => a.totalCases.compareTo(b.totalCases);
      _countrydata.sort(comparator);
    });
  }

  void _onRefresh() async {
    await Future.delayed(Duration(microseconds: 1000));
    getData();
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    if (_countrydata.isEmpty) {
      return MaterialApp(
        home: Center(
          child: Padding(
            padding: const EdgeInsets.all(60.0),
            child: LoadingIndicator(
              indicatorType: Indicator.lineSpinFadeLoader,
              color: AppColors.colorBlue,
            ),
          ),
        ),
      );
    } else {
      return MaterialApp(
        home: SmartRefresher(
          enablePullDown: true,
          enablePullUp: false,
          onRefresh: _onRefresh,
          controller: _refreshController,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: WorldStatus(data: _data)),
                Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: CountryStatus(data: _vietnam)),
              ],
            ),
          ),
        ),
      );
    } // else
  }
}