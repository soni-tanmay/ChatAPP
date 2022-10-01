import 'package:chat_app/services/app_service/app_service.dart';
import 'package:chat_app/services/authentication/authentication_repo.dart';
import 'package:chat_app/services/channel/channel_repo.dart';
import 'package:chat_app/utilities/api_client_service.dart';
import 'package:flutter/material.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initializing Dio client
  ApiClient.instance.initialize();

  await AppService.getInstance.initialize(
    channelRepository: ChannelRepository.instance,
    authenticationRepo: AuthenticationRepo.instance,
  );

  runApp(const MyApp());
}
