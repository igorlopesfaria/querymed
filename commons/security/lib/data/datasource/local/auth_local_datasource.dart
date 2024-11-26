import 'dart:convert';

import 'package:commons_core/exceptions/data_exception.dart';
import 'package:commons_crash_report/i_crash_reporter.dart';
import 'package:commons_security/data/datasource/local/i_auth_local_datasource.dart';
import 'package:commons_security/data/dto/db/auth_local_db.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';



@Injectable(as: IAuthLocalDataSource)
class AuthLocalDataSource implements IAuthLocalDataSource {
  final FlutterSecureStorage _secureStorage;
  final ICrashReport _reporter;
  static const auth = "auth";

  AuthLocalDataSource(this._secureStorage, this._reporter);

  @override
  Future insert(AuthLocalDB authLocalDB) async {
    try {
      String data = jsonEncode(authLocalDB.toJson());
      await _secureStorage.write(key: auth, value: data);
    } on Exception catch (exception, stacktrace) {
      _reporter.recordError(
          exception,
          stackTrace: stacktrace,
          reason: "Failed to insert auth data on local datasource: ${exception.toString()}"
      );
      throw DataDBException();
    }
  }

  @override
  Future<AuthLocalDB?> find() async {
    try {
      final data = await _secureStorage.read(key: auth) ?? '';
      if (data.isNotEmpty) {
        final valueMap = jsonDecode(data) as Map<String, dynamic>;
        return AuthLocalDB.fromJson(valueMap);
      }
      return null;
    } on Exception catch (exception, stacktrace) {
      _reporter.recordError(
          exception,
          stackTrace: stacktrace,
          reason: "Failed to find auth data on local datasource: ${exception.toString()}"
      );
      throw DataDBException();
    }
  }

  @override
  Future<String?> findAuthToken() async {
    try {
      final data = await _secureStorage.read(key: auth) ?? '';
      if (data.isNotEmpty) {
        final valueMap = jsonDecode(data) as Map<String, dynamic>;
        final authLocal = AuthLocalDB.fromJson(valueMap);
        return authLocal.token.stAccessToken;
      }
      return null;
    } on Exception catch (exception, stacktrace) {
      _reporter.recordError(
          exception,
          stackTrace: stacktrace,
          reason: "Failed to findAuthToken on local datasource: ${exception.toString()}"
      );
      throw DataDBException();
    }
  }


  @override
  Future<void> delete() async {
    try {
      await _secureStorage.delete(key: auth);
    } on Exception catch (exception, stacktrace) {
      _reporter.recordError(
          exception,
          stackTrace: stacktrace,
          reason: "Failed to delete auth data on local datasource: ${exception.toString()}"
      );
      throw DataDBException();
    }
  }
}
