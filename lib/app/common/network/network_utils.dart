import '../../config/app_config.dart';

String generateApiUrl(String endPoint) {
  return ApiConfig.apiBaseUrl + endPoint;
}
