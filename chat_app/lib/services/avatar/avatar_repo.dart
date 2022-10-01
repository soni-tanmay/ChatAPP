import 'package:dio/dio.dart';

import '../../utilities/export.dart';

class AvatarRepo {
  AvatarRepo._();
  static final AvatarRepo instance = AvatarRepo._();
  final Dio dio = ApiClient.instance.getClient;

  Future<List<String>> fetchAvatars() async {
    final Response response = await dio.get('/users/avatars');
    print(response.data.runtimeType);
    return List<String>.from(response.data);
  }
}
