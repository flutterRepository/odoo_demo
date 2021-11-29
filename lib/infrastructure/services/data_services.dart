import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:odoo_demo/domain/model/data_model.dart';

class DataServices {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: "http://mark.bslmeiyu.com/api"),
  );

  Future<List<DataModel>> getInfo() async {
    var apiUrl = "/getplaces";
    Response res = await _dio.get(apiUrl);
    try {
      if (res.statusCode == 200) {
        // List<dynamic> _list = json.decode(res.data);
        log("Ça a marché");
        List<DataModel> _data = [];
        for (var el in res.data) {
          _data.add(DataModel.fromJson(el));
        }
        return _data;
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      log("$e");
      return <DataModel>[];
    }
  }

  detailPlace({
    required DataModel dataModel,
  }) {}
}
