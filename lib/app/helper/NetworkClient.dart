import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../app.export.dart';

class MethodType {
  static const String Post = "POST";
  static const String Get = "GET";
  static const String Put = "PUT";
  static const String Delete = "DELETE";
}

class NetworkClient {
  static NetworkClient? _shared;

  NetworkClient._();

  static NetworkClient get getInstance =>
      _shared = _shared ?? NetworkClient._();

  final dio = Dio();

  late bool isShowLoader;

  Map<String, dynamic> getAuthHeaders() {
    Map<String, dynamic> authHeaders = Map<String, dynamic>();

    if (app.resolve<PrefUtils>().isUserLogin()) {
      authHeaders["Content-Type"] = "application/json";
      authHeaders["Authorization"] =
          "jwt " + app.resolve<PrefUtils>().getUserToken();
    } else {
      authHeaders["Content-Type"] = "application/json";
    }

    if (Platform.isIOS) {
      authHeaders["deviceType"] = DEVICE_TYPE_IOS;
    } else if (Platform.isAndroid) {
      authHeaders["deviceType"] = DEVICE_TYPE_ANDROID;
    }
    return authHeaders;
  }

  Future<Response?> callApi({
    BuildContext? context,
    String? baseUrl,
    String? command,
    String? method,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
    Function(dynamic response, String? message)? successCallback,
    Function(String? message, String statusCode)? failureCallback,
  }) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      failureCallback!("", "No Internet Connection");
      return null;
    }

    dio.options.validateStatus = (status) {
      return status! < 500;
    };
    dio.options.connectTimeout = 50000; //5s
    dio.options.receiveTimeout = 50000;

    if (headers != null) {
      for (var key in headers.keys) {
        dio.options.headers[key] = headers[key];
      }
    } else {
      dio.interceptors.clear();
    }

    if (kDebugMode) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        // config the http client
        client.findProxy = (uri) {
          //proxy all request to localhost:8888
          return ApiConstants.PROXY_URL;
        };
        return null;
        // you can also create a new HttpClient to dio
        // return new HttpClient();
      };
    }

    switch (method) {
      case MethodType.Post:
        Response response = await dio.post(baseUrl! + command!, data: params);
        parseResponse(context, response,
            successCallback: successCallback, failureCallback: failureCallback);
        break;

      case MethodType.Get:
        try {
          Response response =
              await dio.get(baseUrl! + command!, queryParameters: params);
          parseResponse(context, response,
              successCallback: successCallback,
              failureCallback: failureCallback);
        } catch (e) {
          if (isShowLoader) {
            hideProgressDialog();
          }
          View.showMessage(context, e.toString());
        }

        break;

      case MethodType.Put:
        Response response = await dio.put(baseUrl! + command!, data: params);
        parseResponse(context, response,
            successCallback: successCallback, failureCallback: failureCallback);
        break;

      case MethodType.Delete:
        Response response = await dio.delete(baseUrl! + command!, data: params);
        parseResponse(context, response,
            successCallback: successCallback, failureCallback: failureCallback);
        break;

      default:
    }
    return null;
  }

  parseResponse(BuildContext? context, Response response,
      {Function(dynamic response, String? message)? successCallback,
      Function(String? statusCode, String message)? failureCallback}) {
    if (response.statusCode == 404) {
      failureCallback!("Not Found", "");
    }
    bool statusCode = response.data['result'] ?? false;
    String? message = response.data['message'];

    if (statusCode == true) {
      if (response.data["data"] is Map<String, dynamic> ||
          response.data["data"] is List<dynamic>) {
        successCallback!(response.data["data"], message);
        return;
      } else if (response.data["data"] is List<Map<String, dynamic>>) {
        successCallback!(response.data["data"], message);
        return;
      } else {
        failureCallback!(message, "");
        return;
      }
    }
    // else if (statusCode == CODE_UNAUTHORIZED) {
    //   // // print(app.resolve<PrefUtils>().isUserLogin());
    //   // if (app.resolve<PrefUtils>().isUserLogin()) {
    //   //   showToast(message, context: context);
    //   //   app.resolve<PrefUtils>().resetAndLogout(context);
    //   //   return;
    //   // } else {
    //   //   failureCallback(statusCode, message);
    //   //   return;
    //   // }
    //   failureCallback(message, statusCode);
    // }

    failureCallback!(message, "");
    return;
  }

  Future<void> showLoader(
    BuildContext context,
  ) {
    isShowLoader = true;
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () {
            return Future.value(false);
          },
          child: new Material(
            type: MaterialType.transparency,
            child: Center(
              child: SpinKitFadingCircle(
                color: Colors.white,
                size: 50.0,
              ),
            ),
          ),
        );
      },
    );
  }

  void hideProgressDialog() {
    isShowLoader = false;
    Navigator.pop(NavigationUtilities.key.currentState!.overlay!.context);
  }
}
