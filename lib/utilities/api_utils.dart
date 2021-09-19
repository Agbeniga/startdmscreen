import 'package:dio/dio.dart';
import 'package:startdmscreen/models/api_response.dart';

class ApiUtils {
  static ApiResponse toApiResponse(Response res) {
    return ApiResponse(
      statusCode: res.statusCode,
      statusMessage: res.statusMessage,
      data: res.data,
    );
  }
}
