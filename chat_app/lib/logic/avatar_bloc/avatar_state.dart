// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'avatar_bloc.dart';

abstract class AvatarState extends Equatable {
  const AvatarState();

  @override
  List<Object> get props => [];
}

class AvatarInitial extends AvatarState {}

class AvatarLoading extends AvatarState {}

class AvatarSuccess extends AvatarState {
  List<String> avatars;
  AvatarSuccess({
    required this.avatars,
  });

  @override
  List<Object> get props => [avatars];
}

class AvatarError extends AvatarState {}
