import 'dart:io';

import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'dio.dart';
import 'package_atom.dart';

class PackageCubit extends HydratedCubit<List<PackageAtom>> {
  PackageCubit(this.client) : super(<PackageAtom>[]);

  final Http client;

  void download(String name) async {
    final path = await client.downloadPackage(name);
    final jsonStr = await File(path).readAsString();
    add(name, jsonStr);
  }

  void add(String name, String data) {
    final index = state.indexWhere((pkg) => pkg.name == name);
    final package = PackageAtom(name: name, data: data);
    if (index > -1) state[index] = package;

    if (state.isEmpty) state.add(package);
    emit(List.from(state));
  }

  PackageAtom find(String name) =>
      state.firstWhere((package) => package.name == name);

  @override
  List<PackageAtom> fromJson(Map<String, dynamic> json) =>
      List<dynamic>.from(json['value'])
          .map((e) => PackageAtom.fromJson(e))
          .toList();

  @override
  Map<String, dynamic> toJson(List<PackageAtom> state) => {'value': state};
}
