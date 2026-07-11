import 'package:chat_app/core/services/datetime.service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'date_data.model.freezed.dart';
part 'date_data.model.g.dart';

@freezed
abstract class DateDataModel with _$DateDataModel {
  const factory DateDataModel({String? month, int? date, int? year}) =
      _DateDataModel;

  factory DateDataModel.initial() => DateDataModel(
    month: DatetimeService.instance.months[0],
    year: 2000,
    date: 1,
  );

  factory DateDataModel.fromJson(Map<String, dynamic> json) => _$DateDataModelFromJson(json);

  factory DateDataModel.initialBirthdate() {
    final allowedBirthdate = DateTime.now().subtract(Duration(days: 6570));

    return DateDataModel(
      month: DatetimeService.instance.months[allowedBirthdate.month - 1],
      year: allowedBirthdate.year,
      date: allowedBirthdate.day,
    );
  }

  factory DateDataModel.fromString(String value) {
    final date = DateFormat('yyyy-MM-dd hh:mm:ss').parse(value);

    return DateDataModel(
      month: DatetimeService.instance.months[date.month],
      date: date.day,
      year: date.year
    );
  }
}
