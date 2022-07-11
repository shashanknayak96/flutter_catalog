import 'package:flutter_catalog/models/session.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http_interceptor/http_interceptor.dart';

class HttpInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    try {
      data.headers["Accept"] = "application/json";
      data.headers["Access-Control-Allow-Origin"] = "*";
      data.headers["Access-Control-Allow-Credentials"] = "true";
      data.headers["Access-Control-Allow-Headers"] =
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale";
      data.headers["Access-Control-Allow-Methods"] = "GET, POST, OPTIONS";
      data.headers["content-type"] = "application/json";

      var token = await FlutterSession().get(session().accessToken);
      data.headers["Authorization"] = "Bearer " + token;
    } catch (e) {
      print(e);
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    return data;
  }
}
