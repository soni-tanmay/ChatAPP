import 'package:chat_app/services/channel/channel_repo.dart';

import '../../utilities/export.dart';
import '../authentication/authentication_repo.dart';

class AppService {
  AppService._();
  factory AppService() => _instance;
  static final AppService _instance = AppService._();
  static AppService get getInstance => _instance;

  // There is a reason that all the repositories are nullable.
  // OtherWise for the test cases we have to initialize each and every repo and that is not feasible.
  Future<void> initialize({
    ChannelRepository? channelRepository,
    AuthenticationRepo? authenticationRepo,
  }) async {
    // Initializing internet Connectivity stream which will automatically show an overlay based on connectivity.
    InternetConnectivity.instance.initialize();

    // Initializing repositories
    _authenticationRepository = authenticationRepo;
    _channelRepository = channelRepository;
  }

  // Defining all the repositories required with in the app.
  // [ Note: Make sure to check for null value while sending any repo. OtherWise throw an Exception. ]
  AuthenticationRepo? _authenticationRepository;
  AuthenticationRepo get authenticationRepo {
    if (_authenticationRepository != null) return _authenticationRepository!;
    throw Exception('AuthenticationRepo not initialized');
  }

  ChannelRepository? _channelRepository;
  ChannelRepository get channelRepository {
    if (_channelRepository != null) return _channelRepository!;
    throw Exception('ChannelRepository not initialized');
  }
}
