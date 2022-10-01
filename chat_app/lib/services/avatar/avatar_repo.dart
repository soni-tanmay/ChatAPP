import 'package:dio/dio.dart';

import '../../utilities/export.dart';

class AvatarRepo {
  AvatarRepo._();
  static final AvatarRepo instance = AvatarRepo._();
  final Dio dio = ApiClient.instance.getClient;

  Future<List<String>> fetchAvatars() async {
    final Response response = await dio.get('/users/avatars');
    
    return response.data;
  }
}
