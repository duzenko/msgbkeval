class MembershipGroupModel {
  num discount = 100;
  num perMonth = 0;
  List services = [];
  String get servicesText {
    if (services.isEmpty) return 'None';
    if (services.length > 1) {
      return '${services.first} and ${services.length - 1} more';
    }
    return services.first;
  }

  String get termsText {
    final rate = discount == 100 ? '' : 'at $discount% off';
    return '$perMonth per month $rate';
  }
}

class MembershipModel {
  String? description;
  bool allowRollover = false;
  num rolloverMonths = 1;
  bool autoRenew = false;
  num renewMonths = 1;
  List<MembershipGroupModel> included = [];

  get rolloverRenewText {
    final rollover =
        allowRollover ? 'Rollover for $rolloverMonths month(s)' : 'No rollover';
    final renew = autoRenew ? 'renew for $renewMonths month(s)' : 'no renew';
    return '$rollover, $renew';
  }
}
