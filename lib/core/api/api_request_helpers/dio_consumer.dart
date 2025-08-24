import 'dart:developer' show log;
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:eltakamel/core/api/api_request_helpers/end_points.dart';
import '../../widgets/toast.dart';

class DioConsumer {
  Dio dio = Dio();
  bool hasToken() {
    log('hasToken ${dio.options.headers}');
    return dio.options.headers.containsKey(HttpHeaders.authorizationHeader);
  }

  setToken(String? token) {
    dio.options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
  }

  clearToken() {
    dio.options.headers.remove(HttpHeaders.authorizationHeader);
  }

  Future<Response?> get(
    String url, {
    String? specificLangCode,
    Map? headers,
    bool withHeader = true,
    bool useAppDomain = true,
    bool download = false,
  }) async {
    Response? response;
    try {
      if (useAppDomain) {
        dio.options.baseUrl = EndPoints.baseUrl;
      }

      response = await dio.get(
        url,
        options: Options(
          responseType: download ? ResponseType.bytes : null,
          followRedirects: download ? false : null,
          validateStatus: (status) {
            return status! < 500;
          },
          headers:
              withHeader
                  ? {
                    /*if (user != null)
                  HttpHeaders.authorizationHeader:
                  'Bearer ${user!.token}',*/
                  }
                  : headers == null
                  ? null
                  : headers as Map<String, dynamic>,
        ),
      );
    } on DioException catch (e) {
      response = e.response;
    }
    return response == null ? null : handleResponse(response, url);
  }

  Future<Response?> post(
    String url, {
    bool aiModel = false,

    Map? headers,
    dynamic body,
    void Function(int, int)? updateProgress,
    bool withHeader = true,
    encoding,
  }) async {
    Response? response;

    dio.options.baseUrl = EndPoints.baseUrl;
    log('url ${dio.options.headers}');

    try {
      response = await dio.post(
        url,
        data: body,
        onSendProgress: updateProgress ?? (data, total) {},

        options: Options(
          headers:
              withHeader
                  ? {
                    /*if (user != null)
                  HttpHeaders.authorizationHeader:
                  'Bearer ${user!.token}',*/
                    if (updateProgress != null)
                      HttpHeaders.contentTypeHeader: "multipart/form-data",
                  }
                  : headers == null
                  ? null
                  : headers as Map<String, dynamic>,
          requestEncoder: encoding,
        ),
      );
    } on DioException catch (e) {
      if (e.response != null) {
        response = e.response;
      }
    }
    return response == null ? null : handleResponse(response, url);
  }

  Future<Response?> put(
    String url, {
    Map? headers,
    FormData? body,
    bool withHeader = true,
    encoding,
  }) async {
    Response? response;

    dio.options.baseUrl = "https://admin.taggz.app/api/";

    try {
      response = await dio.put(
        url,
        data: body,
        options: Options(
          headers:
              withHeader
                  ? {
                    /*if (user != null)
                  HttpHeaders.authorizationHeader:
                  'Bearer ${user!.token}',*/
                  }
                  : headers == null
                  ? null
                  : headers as Map<String, dynamic>,
          requestEncoder: encoding,
        ),
      );
    } on DioException catch (e) {
      if (e.response != null) {
        response = e.response;
      }
    }
    return response == null ? null : handleResponse(response, url);
  }

  Future<Response?> delete(
    String url, {
    Map? headers,
    dynamic body,
    bool withHeader = true,
    encoding,
  }) async {
    Response? response;

    dio.options.baseUrl = "https://admin.taggz.app/api/";

    try {
      response = await dio.delete(
        url,
        data: body,
        options: Options(
          headers:
              withHeader
                  ? {
                    /*if (user != null)
                  HttpHeaders.authorizationHeader:
                  'Bearer ${user!.token}',*/
                  }
                  : headers == null
                  ? null
                  : headers as Map<String, dynamic>,
          requestEncoder: encoding,
        ),
      );
    } on DioException catch (e) {
      if (e.response != null) {
        response = e.response;
      }
    }
    return response == null ? null : handleResponse(response, url);
  }

  Future<Response?> handleResponse(Response response, String url) async {
    final int? statusCode = response.statusCode;
    // var status = response.data['status'];
    if ( /*status == 401 || status == 404 ||*/ response.data == Map &&
        response.data['message'] != 'Unauthenticated.') {
      toast('session expired');

      /* SharedPreferences.getInstance().then((value) {
        value.remove('email');
        value.remove('password');
        navigatorService.goBackUntil(
          const LoginRoute(),
        );
        return null;
      });*/
    }
    /*  else if (statusCode == 401) {
      toast('Error: Unauthorized access. Please  relogin');
    } else if (statusCode == 404) {
      toast('Error: Resource not found. The requested data could not be located.\n ${response.data}');
    }*/
    else if ((statusCode ?? 0) >= 500) {
      toast('Oops! Something went wrong on our end. Please try again later.');

      final statusCode = response.statusCode;
      final url = response.requestOptions.uri.toString();
      final responseData = response.data;
    } else if (statusCode! >= 200 && statusCode < 300) {
      return response;
    } else {
      return response;
    }
    return null;
  }
}
