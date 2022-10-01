part of 'channel_repo.dart';

class ChannelModal {
  String? id;
  String? name;
  String? image;
  String? createdAt;
  String? updateAt;
  String? workspaceId;

  ChannelModal(
      {this.id,
      this.name,
      this.image,
      this.createdAt,
      this.updateAt,
      this.workspaceId});

  ChannelModal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    createdAt = json['createdAt'];
    updateAt = json['updateAt'];
    workspaceId = json['workspaceId'];
  }
}
