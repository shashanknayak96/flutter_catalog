abstract class AbstractService {
  final String pcUrl = "http://192.168.31.101:8084/";
  final String laptopUrl = "http://192.168.31.100/";
  final bool isPc = false;
  final Map<String, String> headers = {
    "Accept": "application/json",
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Credentials":
        "true", // Required for cookies, authorization headers with HTTPS
    "Access-Control-Allow-Headers":
        "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    "Access-Control-Allow-Methods": "GET, POST, OPTIONS"
  };
}
