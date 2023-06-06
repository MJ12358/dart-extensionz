import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:dart_extensionz/dart_extensionz.dart';
import 'package:file/memory.dart';
import 'package:test/test.dart';

void main() {
  test('name', () {
    final String s = Platform.pathSeparator;

    expect(File('').name, '');
    expect(File(s).name, '');
    expect(File('test').name, 'test');
    expect(File('${s}test').name, 'test');
    expect(File('test.txt').name, 'test.txt');
    expect(File('${s}test.txt').name, 'test.txt');
    expect(File('${s}documents${s}test.png').name, 'test.png');
    expect(File('C:${s}Users${s}test.mp4').name, 'test.mp4');
    expect(File('~${s}root${s}test.mp3').name, 'test.mp3');
    expect(File('test${s}noextension').name, 'noextension');
  });

  test('displayName', () {
    final String s = Platform.pathSeparator;

    expect(File('').displayName, '');
    expect(File(s).displayName, '');
    expect(File('test').displayName, 'test');
    expect(File('${s}test').displayName, 'test');
    expect(File('test.txt').displayName, 'test');
    expect(File('${s}test.txt').displayName, 'test');
    expect(File('${s}documents${s}test.png').displayName, 'test');
    expect(File('C:${s}Users${s}test.mp4').displayName, 'test');
    expect(File('~${s}root${s}Test.mp3').displayName, 'Test');
    expect(File('test${s}noextension').displayName, 'noextension');
  });

  test('extension', () {
    expect(File('').extension, '');
    expect(File('test').extension, '');
    expect(File('test.txt').extension, 'txt');
    expect(File('/documents/test.png').extension, 'png');
    expect(File(r'C:\Users\test.mp4').extension, 'mp4');
    expect(File('~/root/test.mp3').extension, 'mp3');
    expect(File('test/noextension').extension, '');
  });

  test('mimeType', () {
    expect(File('').mimeType, '');
    expect(File('test.txt').mimeType, 'text/plain');
    expect(File('/documents/test.png').mimeType, 'image/png');
    expect(File(r'C:\Users\test.mp4').mimeType, 'video/mp4');
    expect(File('~/root/test.mp3').mimeType, 'audio/mpeg');
    expect(File('test/noextension').mimeType, '');
  });

  test('type', () {
    expect(File('').type, FileType.unknown);
    expect(File('test').type, FileType.unknown);
    expect(File('test.txt').type, FileType.text);
    expect(File('/documents/test.png').type, FileType.image);
    expect(File(r'C:\Users\test.mp4').type, FileType.video);
    expect(File('~/root/test.mp3').type, FileType.audio);
    expect(File('test/noextension').type, FileType.unknown);
  });

  test('changeFileName', () {
    final MemoryFileSystem fileSystem = MemoryFileSystem();

    final File file = fileSystem.file('testfile.txt');
    file.writeAsBytes(<int>[1, 2, 3]);
    file.createSync();

    expect(file.changeName('newName.png').name, 'newName.png');
  });

  test('changeDisplayName', () {
    final MemoryFileSystem fileSystem = MemoryFileSystem();

    final File file = fileSystem.file('testfile.txt');
    file.writeAsBytes(<int>[1, 2, 3]);
    file.createSync();

    expect(file.changeDisplayName('newName').name, 'newName.txt');
  });

  test('increment', () {
    final String separator = Platform.pathSeparator;
    final String dirPath = 'test${separator}files';
    final String filePath = '$dirPath${separator}test.txt';
    final Directory dir = Directory(dirPath);

    // this creates files in a real directory
    // need to figure out how to do this with a memoryfilesystem
    dir.deleteSync(recursive: true);
    dir.createSync(recursive: true);

    final File file0 = File(filePath);
    file0.write('contents');
    file0.createSync();

    File file1 = File(filePath);
    expect(file1.existsSync(), true);

    if (file1.existsSync()) {
      file1 = file1.increment();
      file1.createSync();
      expect(file1.displayName, 'test (1)');
    }

    File file2 = File(filePath);
    expect(file2.existsSync(), true);

    if (file2.existsSync()) {
      file2 = file2.increment();
      file2.createSync();
      expect(file2.displayName, 'test (2)');
    }

    File file3 = File(filePath);
    expect(file3.existsSync(), true);

    if (file3.existsSync()) {
      file3 = file3.increment();
      file3.createSync();
      expect(file3.displayName, 'test (3)');
    }
  });

  test('write', () {
    final MemoryFileSystem fileSystem = MemoryFileSystem();

    final File file1 = fileSystem.file('testfile1.txt');
    file1.write('contents');

    final File file2 = fileSystem.file('testfile2.txt');
    file2.write(Uint8List(8));

    final File file3 = fileSystem.file('testfile3.txt');
    file3.write(List<int>.filled(8, 1));

    final File file4 = fileSystem.file('testfile4.txt');
    expect(() => file4.write(bool), throwsA(isA<FormatException>()));
  });

  test('size', () {
    final MemoryFileSystem fileSystem = MemoryFileSystem();

    final File filex = File('nonexistant');

    final File file0 = fileSystem.file('testfile0.dart');
    file0.createSync();

    final File file1 = fileSystem.file('testfile1.dart');
    file1.writeAsBytes(<int>[1, 2, 3]);
    file1.createSync();

    final File file2 = fileSystem.file('testfile2.dart');
    file2.writeAsBytes(List<int>.generate(pow(1024, 1).toInt(), (int i) => i));
    file2.createSync();

    final File file3 = fileSystem.file('testfile3.dart');
    file3.writeAsBytes(List<int>.generate(pow(1024, 2).toInt(), (int i) => i));
    file3.createSync();

    expect(filex.size(), '');
    expect(file0.size(), '0 B');
    expect(file1.size(), '3 B');
    expect(file2.size(), '1 KB');
    expect(file3.size(), '1 MB');
  });
}
