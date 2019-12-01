import 'package:dio/dio.dart';
import 'package:flutter_demo/bean/base_data_entity.dart';
import 'package:flutter_demo/common/api_exception.dart';

class NetWork {
  static Dio dio = Dio(BaseOptions(baseUrl: "http://gank.io/"));

  static Future<List<BaseDataResult>> getAndroidDataList(
      {int pagaSize = 20, int pageNum = 1}) async {
    var response = await dio.get("api/data/Android/${pagaSize}/${pageNum}");
    var baseDataEntity = BaseDataEntity.fromJson(response.data);
    if (baseDataEntity.error) {
      throw ApiException(msg: "ApiException");
    }
    return baseDataEntity.results;
  }
}
