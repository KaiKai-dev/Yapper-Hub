import 'package:freezed_annotation/freezed_annotation.dart';

part 'date.data.model.freezed.dart';

@freezed
abstract class DateDataModel  with _$DateDataModel{
  const factory DateDataModel({
    String? month,
    int? date,
    int? year,
  }) = _DateDataModel; 


}