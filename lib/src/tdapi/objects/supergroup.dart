part of '../index.dart';

/// Represents a supergroup or channel with zero or more members (subscribers in the case of channels).
/// From the point of view of the system, a channel is a special kind of a supergroup: only administrators can post and see the list of members,
/// and posts from all administrators use the name and photo of the channel instead of individual names and profile photos.
/// Unlike supergroups, channels can have an unlimited number of subscribers
class Supergroup extends TdObject {
  Supergroup({
    required this.id,
    this.username,
    required this.date,
    required this.status,
    this.memberCount = 0,
    this.hasLinkedChat = false,
    this.hasLocation = false,
    this.signMessages = false,
    this.isSlowModeEnabled = false,
    this.isChannel = false,
    this.isVerified = false,
    this.restrictionReason,
    this.isScam = false,
    this.extra,
  });

  /// Parse from a json
  factory Supergroup.fromJson(Map<String, dynamic> json) {
    return Supergroup(
      id: json['id'],
      username: json['username'],
      date: json['date'],
      status: ChatMemberStatus.fromJson(json['status']),
      memberCount: json['member_count'],
      hasLinkedChat: json['has_linked_chat'],
      hasLocation: json['has_location'],
      signMessages: json['sign_messages'],
      isSlowModeEnabled: json['is_slow_mode_enabled'],
      isChannel: json['is_channel'],
      isVerified: json['is_verified'],
      restrictionReason: json['restriction_reason'],
      isScam: json['is_scam'],
      extra: json['@extra'],
    );
  }

  static const CONSTRUCTOR = 'supergroup';

  /// [date] Point in time (Unix timestamp) when the current user joined, or the point in time when the supergroup or channel was created,
  /// in case the user is not a member
  int date;

  /// callback sign
  dynamic extra;

  /// [hasLinkedChat] True, if the channel has a discussion group, or the supergroup is the designated discussion group for a channel
  bool hasLinkedChat;

  /// [hasLocation] True, if the supergroup is connected to a location, i.e. the supergroup is a location-based supergroup
  bool hasLocation;

  /// [id] Supergroup or channel identifier
  int id;

  /// [isChannel] True, if the supergroup is a channel
  bool isChannel;

  /// [isScam] True, if many users reported this supergroup as a scam
  bool isScam;

  /// [isSlowModeEnabled] True, if the slow mode is enabled in the supergroup
  bool isSlowModeEnabled;

  /// [isVerified] True, if the supergroup or channel is verified
  bool isVerified;

  /// [memberCount] Number of members in the supergroup or channel; 0 if unknown.
  /// Currently it is guaranteed to be known only if the supergroup or channel was received through [searchPublicChats],
  /// [searchChatsNearby], [getInactiveSupergroupChats], [getSuitableDiscussionChats], [getGroupsInCommon], or [getUserPrivacySettingRules]
  int memberCount;

  /// [restrictionReason] If non-empty, contains a human-readable description of the reason why access to
  /// this supergroup or channel must be restricted
  String? restrictionReason;

  /// [signMessages] True, if messages sent to the channel should contain information about the sender. This field is only applicable to channels
  bool signMessages;

  /// [status] Status of the current user in the supergroup or channel; custom title will be always empty
  ChatMemberStatus status;

  /// [username] Username of the supergroup or channel;
  /// empty for private supergroups or channels
  String? username;

  @override
  String getConstructor() => CONSTRUCTOR;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "id": this.id,
      "username": this.username,
      "date": this.date,
      "status": this.status == null ? null : this.status!.toJson(),
      "member_count": this.memberCount,
      "has_linked_chat": this.hasLinkedChat,
      "has_location": this.hasLocation,
      "sign_messages": this.signMessages,
      "is_slow_mode_enabled": this.isSlowModeEnabled,
      "is_channel": this.isChannel,
      "is_verified": this.isVerified,
      "restriction_reason": this.restrictionReason,
      "is_scam": this.isScam,
    };
  }
}
