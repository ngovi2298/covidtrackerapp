import 'dart:convert';

import 'package:http/http.dart';

final String baseUrl='https://corona.lmao.ninja/';
final String allUrl='v2/all';
final String countryUrl='v2/countries';

class Data {
  final int totalCases;
  final int totalRecovered;
  final int totalDeaths;
  final int totalActiveCases;
  Data({
    this.totalCases,
    this.totalRecovered,
    this.totalDeaths,
    this.totalActiveCases,
  });
}

class CountryData{
  int totalRecovered;
  int totalActiveCases;
  int totalDeaths;
  int totalCases;
  String countryName;
  CountryData({
    this.totalRecovered,
    this.totalActiveCases,
    this.totalDeaths,
    this.totalCases,
    this.countryName,
  });
}

Future<Data> getAllData() async{
  Data data;

  try{
    Response response = await get(baseUrl + allUrl);
    Map info = jsonDecode(response.body);
    data=new Data(
      totalActiveCases: info["active"],
      totalCases: info["cases"],
      totalDeaths: info["deaths"],
      totalRecovered: info["recovered"],
    );
    //xuat thong tin
    print(info);
  }catch(e){
    print("khong lay duoc du lieu. getAllData $e");
  }
  return data;
}

Future<List<CountryData>> getAllCountriesData() async{
  List<CountryData> countriesdata=[];
  try {
    Response response = await get(baseUrl+countryUrl);
    List Cdata= jsonDecode(response.body);
    for(int i=0;i<Cdata.length;i++)
    {
      CountryData report = new CountryData(
        totalRecovered: Cdata[i]["recovered"],
        totalDeaths: Cdata[i]["deaths"],
        totalCases: Cdata[i]["cases"],
        totalActiveCases: Cdata[i]["active"],
        countryName: Cdata[i]["country"],
      );
      countriesdata.add(report);
    }
  }catch(e){
    print("khong lay duoc du lieu. getAllCountriesData() $e");
  }
  return countriesdata;
}