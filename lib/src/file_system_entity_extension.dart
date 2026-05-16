part of dart_extensionz;

/// [FileSystemEntity] Extension.
extension FileSystemEntityExtension on FileSystemEntity? {
  /// Determines if this [FileSystemEntity] is a [File].
  bool get isFile => this != null && this is File;

  /// Determines if this [FileSystemEntity] is a [Directory].
  bool get isDirectory => this != null && this is Directory;

  /// Determines if this [FileSystemEntity] is a [Link].
  bool get isLink => this != null && this is Link;
}

/// [Iterable<FileSystemEntity>] Extension.
extension FileSystemEntitiesExtension on Iterable<FileSystemEntity>? {
  /// Returns only files.
  List<File> get files => this != null
      ? this!.whereType<File>().toList(growable: false)
      : const <File>[];

  /// Returns only directories.
  List<Directory> get directories => this != null
      ? this!.whereType<Directory>().toList(growable: false)
      : const <Directory>[];

  /// Returns only links.
  List<Link> get links => this != null
      ? this!.whereType<Link>().toList(growable: false)
      : const <Link>[];
}
