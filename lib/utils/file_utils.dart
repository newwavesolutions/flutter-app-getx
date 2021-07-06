import 'dart:io';

class FileUtils{
  static const double FILE_SIZE_LIMITED = 10;

  static double getFileSize(File file) {
    int sizeInBytes = file.lengthSync();
    double sizeInMb = sizeInBytes / (1024 * 1024);
    return sizeInMb;
  }

}