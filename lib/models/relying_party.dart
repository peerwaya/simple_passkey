import 'package:freezed_annotation/freezed_annotation.dart';

part 'relying_party.g.dart';
part 'relying_party.freezed.dart';

@freezed
class RelyingParty with _$RelyingParty {
  @JsonSerializable(explicitToJson: true)
  const factory RelyingParty({
    String? id,
    String? name,
  }) = _RelyingParty;

  factory RelyingParty.fromJson(Map<String, dynamic> json) =>
      _$RelyingPartyFromJson(json);
}
