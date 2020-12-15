import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:path_provider/path_provider.dart';

class Http extends DioForNative {
  Http([BaseOptions options]) : super(options);
  Future<String> get applicationDirectoryPath async =>
      (await getApplicationDocumentsDirectory()).path;

  Future<void> downloadPackage(String name) async {
    await download(
      '$name.ews',
      '${await applicationDirectoryPath}/$name.ews',
    );
  }
}
