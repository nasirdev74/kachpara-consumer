import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/curation.dart';

part 'curation_model.freezed.dart';
part 'curation_model.g.dart';

@freezed
class CurationModel with _$CurationModel {
  CurationModel._();
  factory CurationModel({
    required String id,
    required String name,
    required String ownerUserId,
    required String referralCode,
    String? curatorName,
    String? domain,
    List<String>? stores,
    String? description,
    String? imageFileName,
  }) = _Curation;

  factory CurationModel.fromJson(Map<String, dynamic> json) => _$CurationModelFromJson(json);

  Curation toDomain() {
    return Curation(
      id: id,
      name: name,
      curatorName: curatorName,
      description: description,
      imageFileName: imageFileName,
      ownerUserId: ownerUserId,
      referralCode: referralCode,
      domain: domain,
    );
  }

  factory CurationModel.fromDomain(Curation curation) {
    return CurationModel(
      id: curation.id,
      name: curation.name,
      curatorName: curation.curatorName,
      description: curation.description,
      imageFileName: curation.imageFileName,
      ownerUserId: curation.ownerUserId,
      referralCode: curation.referralCode,
      domain: curation.domain,
      stores: curation.stores?.map((store) => store.id).toList() ?? [],
    );
  }
}
