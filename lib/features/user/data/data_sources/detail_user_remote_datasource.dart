import 'package:filmo/core/di/dependency_injections.dart';
import 'package:filmo/features/auth/data/data_sources/auth_local_datasources.dart';
import 'package:filmo/features/user/data/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:filmo/core/constants/api.dart';

abstract class DetailUserRemoteDataSource {
  /// Auth user dengan [username] dan [password] yang di isi pada parameter.
  /// Mengembalikan [UserModel] jika auth berhasil.
  /// Melempar [Exception] jika auth gagal pada setiap tahapan.
  Future<UserModel> getDetailUser(int id);
}

class DetailUserRemoteDataSourceImpl implements DetailUserRemoteDataSource {
  @override
  Future<UserModel> getDetailUser(int id) async {
    const String endpointUser = "account";
    final String? sessionId = await getIt<AuthLocalDataSource>().getSessionId();

    final responseDetailUser = await http.get(
      Uri.parse("${Api.baseUrl}$endpointUser/$id").replace(
        queryParameters: {
          'session_id': sessionId,
        },
      ),
      headers: {
        "Authorization": "Bearer ${Api.accessToken}",
      },
    );

    if (responseDetailUser.statusCode != 200) {
      throw Exception("Failed to get Detail User");
    }

    final responseDetailUserBody = json.decode(responseDetailUser.body);
    final userModel = UserModel.fromJson(responseDetailUserBody);
    return userModel;
  }
}
