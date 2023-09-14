part of dart_extensionz;

/// [FileSystemEntity] Extension.
extension FileSystemEntityExtension on FileSystemEntity {
  /// Determines if this [FileSystemEntity] is a [File].
  bool get isFile => this is File;

  /// Determines if this [FileSystemEntity] is a [Directory].
  bool get isDirectory => this is Directory;

  /// Determines if this [FileSystemEntity] is a [Link].
  bool get isLink => this is Link;
}

/// [Iterable<FileSystemEntity] Extension.
extension FileSystemEntitiesExtension on Iterable<FileSystemEntity> {
  /// Returns only files.
  List<File> get files => whereType<File>().toList();

  /// Returns only directories.
  List<Directory> get directories => whereType<Directory>().toList();

  /// Returns only links.
  List<Link> get links => whereType<Link>().toList();
}

/// Nullable [FileSystemEntity] Extension.
extension NullableFileSystemEntityExtension on FileSystemEntity? {
  /// Determines if this [FileSystemEntity] is a [File].
  bool get isFile => this != null && this!.isFile;

  /// Determines if this [FileSystemEntity] is a [Directory].
  bool get isDirectory => this != null && this!.isDirectory;

  /// Determines if this [FileSystemEntity] is a [Link].
  bool get isLink => this != null && this!.isLink;
}

/// Nullable [Iterable<FileSystemEntity>] Extension.
extension NullableFileSystemEntitiesExtension on Iterable<FileSystemEntity?>? {
  /// Returns only files.
  List<File> get files =>
      this != null ? this!.whereType<File>().toList() : const <File>[];

  /// Returns only directories.
  List<Directory> get directories => this != null
      ? this!.whereType<Directory>().toList()
      : const <Directory>[];

  /// Returns only links.
  List<Link> get links =>
      this != null ? this!.whereType<Link>().toList() : const <Link>[];
}
