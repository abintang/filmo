import 'dart:convert';
import 'package:filmo/core/constants/api.dart';
import 'package:filmo/features/auth/data/data_sources/auth_local_datasources.dart';
import 'package:filmo/features/auth/data/models/create_sessions_response_model.dart';
import 'package:filmo/features/auth/data/models/request_token_response_model.dart';
import 'package:filmo/features/auth/data/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';

/// AuthRemote
abstract class AuthRemoteDataSources {
  /// Auth user dengan [username] dan [password] yang di isi pada parameter.
  /// Mengembalikan [UserModel] jika auth berhasil.
  /// Melempar [Exception] jika auth gagal pada setiap tahapan.
  Future<UserModel> authenticateUser(String username, String password);
}

/// Implementasi dari [AuthRemoteDataSources] dengan API.
class AuthRemoteDataSourcesImpl implements AuthRemoteDataSources {
  final AuthLocalDataSource localDataSource;

  AuthRemoteDataSourcesImpl({required this.localDataSource});
  @override
  Future<UserModel> authenticateUser(String username, String password) async {
    const String endpointRequestToken = "authentication/token/new";
    const String endpointLogin = "authentication/token/validate_with_login";
    const String endpointCreateSession = "authentication/session/new";
    const String endpointUser = "account";

    // 1: request token.
    final responseRequestToken =
        await http.get(Uri.parse(Api.baseUrl + endpointRequestToken), headers: {
      "Authorization": "Bearer ${Api.accessToken}",
    });

    if (responseRequestToken.statusCode != 200) {
      throw Exception("Failed to Get Token");
    }

    final responseRequestTokenBody = json.decode(responseRequestToken.body);
    final dataRequestToken =
        RequestTokenResponseModel.fromJson(responseRequestTokenBody);
    log(dataRequestToken.requestToken);
    // 2: Memvalidasi login dengan token yang telah diperoleh.
    final responseLogin =
        await http.post(Uri.parse(Api.baseUrl + endpointLogin), headers: {
      "Authorization": "Bearer ${Api.accessToken}",
    }, body: {
      "username": username,
      "password": password,
      "request_token": dataRequestToken.requestToken
    });

    if (responseLogin.statusCode != 200) {
      throw Exception("Failed to Login");
    }

    // 3: Membuat session baru menggunakan token yang telah divalidasi.
    final responseCreateSession = await http
        .post(Uri.parse(Api.baseUrl + endpointCreateSession), headers: {
      "Authorization": "Bearer ${Api.accessToken}",
    }, body: {
      "request_token": dataRequestToken.requestToken
    });

    log(responseLogin.statusCode.toString());
    if (responseCreateSession.statusCode != 200) {
      throw Exception("Failed to Create Session");
    }

    final responseCreateSessionBody = json.decode(responseCreateSession.body);
    final session =
        CreateSessionsResponseModel.fromJson(responseCreateSessionBody);
    await localDataSource.cacheSessionId(session.sessionId);

    log(session.sessionId);
    // 4: Mengambil detail akun dengan menggunakan session id yang telah didapat.
    final responseDetailUser = await http.get(
      Uri.parse(Api.baseUrl + endpointUser).replace(
        queryParameters: {
          'session_id': session.sessionId,
        },
      ),
      headers: {
        "Authorization": "Bearer ${Api.accessToken}",
      },
    );

    if (responseDetailUser.statusCode != 200) {
      throw Exception("Failed to Create Session");
    }

    final responseDetailUserBody = json.decode(responseDetailUser.body);
    log(responseDetailUserBody.toString());
    final userModel = UserModel.fromJson(responseDetailUserBody);
    log(userModel.username);
    return userModel;
  }
}
