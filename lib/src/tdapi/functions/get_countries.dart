part of '../main.dart';

class GetCountries extends TdFunction {
  /// Returns information about existing countries. Can be called before authorization
  GetCountries();

  /// callback sign
  dynamic extra;

  /// Parse from a json
  GetCountries.fromJson(Map<String, dynamic> json);

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "@extra": this.extra,
    };
  }

  static const CONSTRUCTOR = 'getCountries';

  @override
  String getConstructor() => CONSTRUCTOR;
}
