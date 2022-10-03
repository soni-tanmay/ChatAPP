import 'package:dio/dio.dart';

import '../../utilities/export.dart';
import '../authentication/authentication_repo.dart';

part 'chat_model.dart';

class ChatRepo {
  ChatRepo._();
  static final ChatRepo instance = ChatRepo._();
  final Dio dio = ApiClient.instance.getClient;

  Future<List<ChatModel>?> fetchChat(String channelId) async {}
}
