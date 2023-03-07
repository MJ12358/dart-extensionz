part of dart_extensionz;

extension FileSystemEntityExtension on FileSystemEntity {
  /// Determines if this [FileSystemEntity] is a `File`.
  bool get isFile => this is File;

  /// Determines if this [FileSystemEntity] is a `Directory`.
  bool get isDirectory => this is Directory;

  /// Determines if this [FileSystemEntity] is a `Link`.
  bool get isLink => this is Link;
}

extension FileSystemEntitiesExtension on List<FileSystemEntity> {
  /// Returns only files.
  List<File> get files => whereType<File>().toList();

  /// Returns only directories.
  List<Directory> get directories => whereType<Directory>().toList();

  /// Returns only links.
  List<Link> get links => whereType<Link>().toList();
}
