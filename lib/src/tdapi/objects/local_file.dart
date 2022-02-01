part of '../main.dart';

class LocalFile extends TdObject {
  /// Represents a local file
  LocalFile(
      {this.path,
      this.canBeDownloaded,
      this.canBeDeleted,
      this.isDownloadingActive,
      this.isDownloadingCompleted,
      this.downloadOffset,
      this.downloadedPrefixSize,
      this.downloadedSize});

  /// [path] Local path to the locally available file part; may be empty
  String? path;

  /// [canBeDownloaded] True, if it is possible to try to download or generate the file
  bool? canBeDownloaded;

  /// [canBeDeleted] True, if the file can be deleted
  bool? canBeDeleted;

  /// [isDownloadingActive] True, if the file is currently being downloaded (or a local copy is being generated by some other means)
  bool? isDownloadingActive;

  /// [isDownloadingCompleted] True, if the local copy is fully available
  bool? isDownloadingCompleted;

  /// [downloadOffset] Download will be started from this offset. downloaded_prefix_size is calculated from this offset
  int? downloadOffset;

  /// [downloadedPrefixSize] If is_downloading_completed is false, then only some prefix of the file starting from download_offset is ready to be read. downloaded_prefix_size is the size of that prefix
  int? downloadedPrefixSize;

  /// [downloadedSize] Total downloaded file bytes. Should be used only for calculating download progress. The actual file size may be bigger, and some parts of it may contain garbage
  int? downloadedSize;

  /// Parse from a json
  LocalFile.fromJson(Map<String, dynamic> json) {
    this.path = json['path'];
    this.canBeDownloaded = json['can_be_downloaded'];
    this.canBeDeleted = json['can_be_deleted'];
    this.isDownloadingActive = json['is_downloading_active'];
    this.isDownloadingCompleted = json['is_downloading_completed'];
    this.downloadOffset = json['download_offset'];
    this.downloadedPrefixSize = json['downloaded_prefix_size'];
    this.downloadedSize = json['downloaded_size'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "path": this.path,
      "can_be_downloaded": this.canBeDownloaded,
      "can_be_deleted": this.canBeDeleted,
      "is_downloading_active": this.isDownloadingActive,
      "is_downloading_completed": this.isDownloadingCompleted,
      "download_offset": this.downloadOffset,
      "downloaded_prefix_size": this.downloadedPrefixSize,
      "downloaded_size": this.downloadedSize,
    };
  }

  static const CONSTRUCTOR = 'localFile';

  @override
  String getConstructor() => CONSTRUCTOR;
}
