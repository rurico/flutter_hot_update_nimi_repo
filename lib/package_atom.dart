import 'package:json_annotation/json_annotation.dart';

part 'package_atom.g.dart';

@JsonSerializable(nullable: false)
class PackageAtom {
  final String name;
  final String data;

  const PackageAtom({
    this.name,
    this.data,
  });

  factory PackageAtom.fromJson(Map<String, dynamic> json) =>
      _$PackageAtomFromJson(json);
  Map<String, dynamic> toJson() => _$PackageAtomToJson(this);
}
