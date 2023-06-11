import 'package:freezed_annotation/freezed_annotation.dart';

part 'public_key_param.g.dart';
part 'public_key_param.freezed.dart';

@freezed
class PublicKeyParam with _$PublicKeyParam {
  @JsonSerializable(explicitToJson: true)
  const factory PublicKeyParam({
    int? alg,
    String? type,
  }) = _PublicKeyParam;

  factory PublicKeyParam.fromJson(Map<String, dynamic> json) =>
      _$PublicKeyParamFromJson(json);
}
