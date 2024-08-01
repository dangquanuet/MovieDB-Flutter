import 'package:dio/dio.dart';
import 'package:moviedb_flutter/data/remote/api_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api.g.dart';

@riverpod
ApiService api(ApiRef ref) {
  final ApiService client = ApiService(Dio());
  ref.keepAlive();
  return client;
}
