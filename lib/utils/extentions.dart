extension Date on DateTime {
  String diffInString() {
    var today = DateTime.now();

    if (today.year == year && today.month == month) {
      var diff = today.day - day;

      var moment = diff > 1 ? 'days' : 'day';
      if (diff == 0) {
        return 'Today';
      } else {
        return '$diff $moment ago';
      }
    } else if (today.year == year) {
      var diff = today.month - month;

      var moment = diff > 1 ? 'months' : 'months';

      return '$diff $moment ago';
    } else {
      var diff = today.year - year;

      var moment = diff > 1 ? 'years' : 'year';

      return '$diff $moment ago';
    }
  }
}
