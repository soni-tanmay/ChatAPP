part of 'channel_repo.dart';

class ChannelModal {
  String id;
  String name;
  String workspaceId;
  String? image;
  String? createdAt;
  String? updateAt;

  ChannelModal({
    required this.id,
    required this.name,
    required this.workspaceId,
    this.image,
    this.createdAt,
    this.updateAt,
  });

  factory ChannelModal.fromJson(Map<String, dynamic> json) {
    return ChannelModal(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      createdAt: json['createdAt'],
      updateAt: json['updateAt'],
      workspaceId: json['workspaceId'],
    );
  }
}
