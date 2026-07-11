import 'package:chat_app/features/domain/models/date_data/date_data.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class StringToDateConverter implements JsonConverter<DateDataModel, String> {
  const StringToDateConverter();

  @override
  DateDataModel fromJson(String data) => DateDataModel.fromString(data);

  @override
  String toJson(DateDataModel data) => data.toString();
}