import 'package:dio/dio.dart';

import '../../utilities/api_client_service.dart';

part 'channel_model.dart';
part 'channel_contract.dart';

class ChannelRepository {
  ChannelRepository._();
  static final ChannelRepository instance = ChannelRepository._();
  final Dio dio = ApiClient.instance.getClient;

  Future<List<ChannelModal>> findAllChannel() async {
    try {
      final Response response = await dio.get(
        'channels',
        options: Options(
          headers: {
            "Access-Control-Allow-Origin": "*",
            'Content-Type': 'application/json',
            'Accept': '*/*',
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI3ZTFmYjc3MS01MGU4LTRhMjUtODA0Ny1hYjMwODI0MzBkOWYiLCJlbWFpbCI6InRlc3RAZW1haWwuY29tIiwiaWF0IjoxNjY0NjMyNjkwLCJleHAiOjkwMDAxNjY0NjMyNjkwfQ.q72K88De93bfNgqhDgDdlO6t4_Uz8QZp_uN10kkjQs8'
          },
        ),
      );

      final data = List<ChannelModal>.from(
          response.data['data'].map((e) => ChannelModal.fromJson(e)).toList());
      return data;
    } catch (_) {
      rethrow;
    }
  }

  Future<List<ChannelModal>> findTrendingChannel() async {
    try {
      final Response response = await dio.get(
        'channels/trending',
        options: Options(
          headers: {
            "Access-Control-Allow-Origin": "*",
            'Content-Type': 'application/json',
            'Accept': '*/*',
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI3ZTFmYjc3MS01MGU4LTRhMjUtODA0Ny1hYjMwODI0MzBkOWYiLCJlbWFpbCI6InRlc3RAZW1haWwuY29tIiwiaWF0IjoxNjY0NjMyNjkwLCJleHAiOjkwMDAxNjY0NjMyNjkwfQ.q72K88De93bfNgqhDgDdlO6t4_Uz8QZp_uN10kkjQs8'
          },
        ),
      );

      final data = List<ChannelModal>.from(
          response.data['data'].map((e) => ChannelModal.fromJson(e)).toList());
      return data;
    } catch (_) {
      rethrow;
    }
  }
}
