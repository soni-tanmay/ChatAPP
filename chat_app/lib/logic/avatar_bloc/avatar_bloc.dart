import 'package:bloc/bloc.dart';
import 'package:chat_app/services/avatar/avatar_repo.dart';
import 'package:equatable/equatable.dart';

part 'avatar_event.dart';
part 'avatar_state.dart';

class AvatarBloc extends Bloc<AvatarEvent, AvatarState> {
  AvatarBloc() : super(AvatarInitial()) {
    on<AvatarEvent>((event, emit) async {
      if (event is FetchAvatar) {
        try {
          emit(AvatarLoading());
          final List<String> avatars = await AvatarRepo.instance.fetchAvatars();
          emit(AvatarSuccess(avatars: avatars));
        } catch (e) {
          emit(AvatarError());
        }
      }
    });
  }
}
