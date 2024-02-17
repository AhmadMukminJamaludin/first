import 'package:dio/dio.dart';
import 'package:first/data/model/aduan.dart';
import 'package:first/data/model/user.dart';

class RemoteUser {
  final dio = Dio(BaseOptions(baseUrl: "https://reqres.in/api"));

  Future<DataUser> getUsers() async {
    final res = await dio.get('/users');
    return DataUser.fromJson(res.data);
  }
}

class RemoteAduan {
  final dio = Dio();

  Future<DataAduan> getAduan() async {
    final res = await dio.get('https://sispadu-plesungan.my.id/api/aduan');
    return DataAduan.fromJson(res.data);
  }
}
