class DatetimeService {
  const DatetimeService._();
  static final instance = DatetimeService._();

  final List<String> months = const [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  int get _validYear {
    final now = DateTime.now();
    final thisYear = now.year;

    return thisYear - 18;
    
  }
  List<int> get validYearList {
    final validYear = _validYear;
    final listLength = validYear - 1970;
    
    return List.generate(
      listLength, 
      (index) => 1970 + index
    );
  }

  List<int> dates({required String month, required int year}){
    final monthNumber = months.indexWhere((_month) => _month == month);

    int endDate;

    if(monthNumber == 1) {
      final isLeap = (year % 4) == 0;
      endDate = switch(isLeap){
        true => 28,
        false => 27
      };
    } else {
      endDate = switch(monthNumber % 2 ){
        0 => monthNumber <= 6 ? 31 : 30,
        1 => monthNumber <= 6 ? 30 : 31,
        _ => throw UnimplementedError("Logic error in computing endDate")
      };
    }


    return List.generate(endDate, (index) => index + 1);
  } 
}