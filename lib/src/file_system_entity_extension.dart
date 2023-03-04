part of dart_extensionz;

extension FileSystemEntityExtension on FileSystemEntity {
  bool get isFile => this is File;

  bool get isDirectory => this is Directory;

  bool get isLink => this is Link;
}

extension FileSystemEntitiesExtension on List<FileSystemEntity> {
  List<File> get files => whereType<File>().toList();

  List<Directory> get directories => whereType<Directory>().toList();

  List<Link> get links => whereType<Link>().toList();
}
