import 'dart:convert';

import 'package:flare_flutter/base/json_reader.dart';
import 'package:retrofit/retrofit.dart';
import '../app.export.dart';

part 'NetworkService.g.dart';

@RestApi(baseUrl: baseURL)
abstract class NetworkService {
  factory NetworkService(Dio dio) = _NetworkService;
}
