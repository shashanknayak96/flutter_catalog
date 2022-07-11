import 'package:http_interceptor/http_interceptor.dart';
import '../services/AuthenticationService.dart';

class ExpiredTokenRetryPolicy extends RetryPolicy {
  @override
  int maxRetryAttempts = 2;

  @override
  Future<bool> shouldAttemptRetryOnResponse(ResponseData response) async {
    if (response.statusCode == 401) {
      print("Token has expired. Getting new token.");
      await AuthenticationService().regenerateToken();
      return true;
    }

    return false;
  }
}
