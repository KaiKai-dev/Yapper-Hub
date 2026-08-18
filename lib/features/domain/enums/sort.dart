enum Sort {
  ascending,
  descending;

  String get abbr => switch(this) {
    ascending   => "asc",
    descending  => "desc"
  };
}