part of '../index.dart';

class SupergroupFullInfo extends TdObject {
  /// Contains full information about a supergroup or channel
  SupergroupFullInfo({
    this.photo,
    required this.description,
    this.memberCount = 0,
    this.administratorCount = 0,
    this.restrictedCount = 0,
    this.bannedCount = 0,
    this.linkedChatId = 0,
    required this.slowModeDelay,
    required this.slowModeDelayExpiresIn,
    this.canGetMembers = false,
    this.canSetUsername = false,
    this.canSetStickerSet = false,
    this.canSetLocation = false,
    this.canGetStatistics = false,
    this.isAllHistoryAvailable = false,
    this.stickerSetId = 0,
    this.location,
    this.inviteLink,
    this.upgradedFromBasicGroupId = 0,
    this.upgradedFromMaxMessageId = 0,
    this.extra,
  });

  /// [photo] Chat photo; may be null
  ChatPhoto? photo;

  /// [description] Supergroup or channel description
  String description;

  /// [memberCount] Number of members in the supergroup or channel;
  /// 0 if unknown
  int memberCount;

  /// [administratorCount] Number of privileged users in the supergroup or channel;
  /// 0 if unknown
  int administratorCount;

  /// [restrictedCount] Number of restricted users in the supergroup; 0 if unknown
  int restrictedCount;

  /// [bannedCount] Number of users banned from chat; 0 if unknown
  int bannedCount;

  /// [linkedChatId] Chat identifier of a discussion group for the channel,
  /// or a channel, for which the supergroup is the designated discussion group;
  /// 0 if none or unknown
  int linkedChatId;

  /// [slowModeDelay] Delay between consecutive sent messages for non-administrator
  /// supergroup members, in seconds
  int slowModeDelay;

  /// [slowModeDelayExpiresIn] Time left before next message can be sent in the supergroup,
  /// in seconds. An updateSupergroupFullInfo update is not triggered when value
  /// of this field changes, but both new and old values are non-zero
  double slowModeDelayExpiresIn;

  /// [canGetMembers] True, if members of the chat can be retrieved
  bool canGetMembers;

  /// [canSetUsername] True, if the chat username can be changed
  bool canSetUsername;

  /// [canSetStickerSet] True, if the supergroup sticker set can be changed
  bool canSetStickerSet;

  /// [canSetLocation] True, if the supergroup location can be changed
  bool canSetLocation;

  /// [canGetStatistics] True, if the supergroup or channel statistics are available
  bool canGetStatistics;

  /// [isAllHistoryAvailable] True, if new chat members will have access to old messages. In public or discussion groups and both public and private channels, old messages are always available, so this option affects only private supergroups without a linked chat. The value of this field is only available for chat administrators
  bool isAllHistoryAvailable;

  /// [stickerSetId] Identifier of the supergroup sticker set; 0 if none
  int stickerSetId;

  /// [location] Location to which the supergroup is connected; may be null
  ChatLocation? location;

  /// [inviteLink] Invite link for this chat
  String? inviteLink;

  /// [upgradedFromBasicGroupId] Identifier of the basic group from which supergroup was upgraded;
  ///  0 if none
  int upgradedFromBasicGroupId;

  /// [upgradedFromMaxMessageId] Identifier of the last message in the basic group from which
  /// supergroup was upgraded; 0 if none
  int upgradedFromMaxMessageId;

  /// callback sign
  dynamic extra;

  /// Parse from a json
  factory SupergroupFullInfo.fromJson(Map<String, dynamic> json) {
    return SupergroupFullInfo(
      photo: json['photo'] != null ? ChatPhoto.fromJson(json['photo']) : null,
      description: json['description'],
      memberCount: json['member_count'],
      administratorCount: json['administrator_count'],
      restrictedCount: json['restricted_count'],
      bannedCount: json['banned_count'],
      linkedChatId: json['linked_chat_id'],
      slowModeDelay: json['slow_mode_delay'],
      slowModeDelayExpiresIn: json['slow_mode_delay_expires_in'],
      canGetMembers: json['can_get_members'],
      canSetUsername: json['can_set_username'],
      canSetStickerSet: json['can_set_sticker_set'],
      canSetLocation: json['can_set_location'],
      canGetStatistics: json['can_get_statistics'],
      isAllHistoryAvailable: json['is_all_history_available'],
      stickerSetId: int.tryParse(json['sticker_set_id']) ?? 0,
      location: json['location'] != null
          ? ChatLocation.fromJson(json['location'])
          : null,
      inviteLink: json['invite_link'],
      upgradedFromBasicGroupId: json['upgraded_from_basic_group_id'],
      upgradedFromMaxMessageId: json['upgraded_from_max_message_id'],
      extra: json['@extra'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "photo": this.photo == null ? null : this.photo!.toJson(),
      "description": this.description,
      "member_count": this.memberCount,
      "administrator_count": this.administratorCount,
      "restricted_count": this.restrictedCount,
      "banned_count": this.bannedCount,
      "linked_chat_id": this.linkedChatId,
      "slow_mode_delay": this.slowModeDelay,
      "slow_mode_delay_expires_in": this.slowModeDelayExpiresIn,
      "can_get_members": this.canGetMembers,
      "can_set_username": this.canSetUsername,
      "can_set_sticker_set": this.canSetStickerSet,
      "can_set_location": this.canSetLocation,
      "can_get_statistics": this.canGetStatistics,
      "is_all_history_available": this.isAllHistoryAvailable,
      "sticker_set_id": this.stickerSetId,
      "location": this.location == null ? null : this.location!.toJson(),
      "invite_link": this.inviteLink,
      "upgraded_from_basic_group_id": this.upgradedFromBasicGroupId,
      "upgraded_from_max_message_id": this.upgradedFromMaxMessageId,
    };
  }

  static const CONSTRUCTOR = 'supergroupFullInfo';

  @override
  String getConstructor() => CONSTRUCTOR;
}
