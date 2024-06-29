import 'package:equatable/equatable.dart';
import 'package:kachpara/domain/entities/store.dart';

class Curation extends Equatable {
  final String id;
  final String name;
  final String? curatorName;
  final String? description;
  final String? imageFileName;
  final String referralCode;
  final String ownerUserId;
  final String? domain;
  final List<Store>? stores;

  const Curation(
      {required this.id,
      required this.name,
      this.curatorName,
      this.description,
      this.imageFileName,
      required this.referralCode,
      required this.ownerUserId,
      this.domain,
      this.stores});

  @override
  List<Object?> get props => [id, name, description, imageFileName, referralCode, ownerUserId, domain, stores];

  Curation copyWith({
    String? id,
    String? name,
    String? curatorName,
    String? description,
    String? imageFileName,
    String? referralCode,
    String? ownerUserId,
    String? domain,
    List<Store>? stores,
  }) {
    return Curation(
      id: id ?? this.id,
      name: name ?? this.name,
      curatorName: curatorName ?? this.curatorName,
      description: description ?? this.description,
      imageFileName: imageFileName ?? this.imageFileName,
      referralCode: referralCode ?? this.referralCode,
      ownerUserId: ownerUserId ?? this.ownerUserId,
      domain: domain ?? this.domain,
      stores: stores ?? this.stores,
    );
  }
}
