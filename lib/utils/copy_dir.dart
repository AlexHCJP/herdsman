import 'dart:io';

/// Recursively copies the contents of [src] directory to [dst] directory.
void copyDir(Directory src, Directory dst) {
  if (!dst.existsSync()) {
    dst.createSync(recursive: true);
  }

  for (final entity in src.listSync()) {
    if (entity is File) {
      entity.copySync('${dst.path}/${entity.uri.pathSegments.last}');
    } else if (entity is Directory) {
      copyDir(entity, Directory('${dst.path}/${entity.uri.pathSegments.last}'));
    }
  }
}
