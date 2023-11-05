import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../../error/error.dart';

abstract class ApiClient {
  Future<String> getToken({required String token});

  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? params,
    required T Function(String body) fromJson,
  });

  Future<T> post<T>(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headerParams,
    required T Function(String body) fromJson,
  });

  Future<T> patch<T>(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headerParams,
    required T Function(String body) fromJson,
  });

  Future<T> put<T>(
    String path, {
    Map<String, dynamic>? body,
    required T Function(String body) fromJson,
  });

  Future<T> upload<T>(
    String path, {
    File? file,
    int? userID,
    Map<String, dynamic>? headerParams,
    required T Function(String body) fromJson,
  });

  // Future<String> download(
  //   String path, {
  //   Map<String, dynamic>? headerParams,
  //   //required T Function(String body) fromJson,
  // });
}

class ApiClientImpl implements ApiClient {
  // ApiClientImpl(http.Client client) : _client = client;

  // // ignore: unused_field
  // final http.Client _client;

  ApiClientImpl({required this.client});

  // ignore: unused_field
  final http.Client client;

  String? _token;

  Uri buildUri(String path, {Map<String, dynamic>? params}) {
    final uri = Uri.parse(path);
    return uri;
  }

  @override
  Future<String> getToken({required String token}) async {
    log('token_2 ====>>>>  $token');
    return _token = token;
  }

  Future<Map<String, String>> getHeader() async {
    final headers = <String, String>{
      'Content-Type': 'application/json; charset=utf-8',
      'Accept': 'application/json',
    };
    if (_token != null) headers['Authorization'] = 'Bearer $_token';
    return headers;
  }

  Future<T> responseType<T>(
    http.Response response,
    T Function(String body) fromJson,
  ) async {
    if (response.statusCode == 200) {
      final model = fromJson(response.body);
      return model;
    } else if (response.statusCode == 401) {
      debugPrint('token jok');
      throw ServerException();
    } else {
      debugPrint('server kata');
      throw ServerException();
    }
  }

  Future<T> uploadResponseType<T>(
    StreamedResponse response,
    T Function(String body) fromJson,
  ) async {
    if (response.statusCode == 200) {
      final responseData = await response.stream.toBytes();
      final result = String.fromCharCodes(responseData);
      final model = fromJson(result);
      return model;
    } else if (response.statusCode == 401) {
      debugPrint('token jok');
      throw ServerException();
    } else {
      debugPrint('server kata');
      throw ServerException();
    }
  }

  // Future<T> downloadResponseType<T>(
  //   http.Response response,
  //   T Function(String body) fromJson,
  // ) async {
  //   if (response.statusCode == 200) {
  //     final file = File('123');
  //     await file.writeAsBytes(response.bodyBytes);
  //     final filePath = file.path;
  //     final model = fromJson(filePath);
  //     return model;
  //   } else if (response.statusCode == 401) {
  //     debugPrint('token jok');
  //     throw ServerException();
  //   } else {
  //     debugPrint('server kata');
  //     throw ServerException();
  //   }
  // }

  @override
  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? params,
    required T Function(String body) fromJson,
  }) async {
    final header = await getHeader();
    final response = await client.get(
      buildUri(path, params: params),
      headers: header,
    );
    return responseType<T>(response, fromJson);
  }

  @override
  Future<T> post<T>(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headerParams,
    required T Function(String body) fromJson,
  }) async {
    final header = await getHeader();
    final uri = buildUri(path, params: headerParams);
    final response = await client.post(
      uri,
      headers: header,
      body: jsonEncode(body),
    );
    return responseType<T>(response, fromJson);
  }

  @override
  Future<T> patch<T>(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headerParams,
    required T Function(String body) fromJson,
  }) async {
    final header = await getHeader();
    final response = await client.patch(
      buildUri(path, params: headerParams),
      body: jsonEncode(body),
      headers: header,
    );
    return responseType<T>(response, fromJson);
  }

  @override
  Future<T> put<T>(
    String path, {
    Map<String, dynamic>? body,
    required T Function(String body) fromJson,
  }) async {
    final header = await getHeader();
    final response = await client.put(
      buildUri(path),
      headers: header,
      body: jsonEncode(body),
    );
    return responseType<T>(response, fromJson);
  }

  @override
  Future<T> upload<T>(
    String path, {
    File? file,
    int? userID,
    Map<String, dynamic>? headerParams,
    required T Function(String body) fromJson,
  }) async {
    //final header = await getHeader();
    final uri = buildUri(path, params: headerParams);
    final request = http.MultipartRequest('POST', uri);
    request.headers['Authorization'] = 'Bearer $_token';
    log('token_3 ====>>>>  $_token');

    final picture = await http.MultipartFile.fromPath(
      'file',
      file!.path,
      //filename: file.path,
    );
    log('file!.path ====>>>>  ${file.path}');
    request.files.add(picture);
    final userIDq = http.MultipartFile.fromString(
      'userId',
      userID.toString(),
    );
    request.files.add(userIDq);
    final response = await request.send();

    return uploadResponseType<T>(response, fromJson);
  }

  // @override
  // Future<String> download(
  //   String path, {
  //   Map<String, dynamic>? headerParams,
  //   //required T Function(String body) fromJson,
  // }) async {
  //   final header = await getHeader();
  //   final response = await client.get(
  //     buildUri(path, params: headerParams),
  //     headers: header,
  //   );
  //   var documentDirectory = await getApplicationDocumentsDirectory();
  //   var firstPath = documentDirectory.path + "/images";
  //   var filePathAndName = documentDirectory.path + '/images/pic.jpg';
  //   //comment out the next three lines to prevent the image from being saved
  //   //to the device to show that it's coming from the internet
  //   await Directory(firstPath).create(recursive: true);
  //   File file2 = new File(filePathAndName); // <-- 2
  //   file2.writeAsBytesSync(response.bodyBytes);

  //   return filePathAndName;
  // }
}
