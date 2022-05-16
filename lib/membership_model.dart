class MembershipModel {
  String? description;
  bool allowRollover = false;
  num rolloverMonths = 1;
  bool autoRenew = false;
  num renewMonths = 1;
  List included = [];

  get rolloverRenewText {
    final rollover =
        allowRollover ? 'Rollover for $rolloverMonths month(s)' : 'No rollover';
    final renew = autoRenew ? 'renew for $renewMonths month(s)' : 'no renew';
    return '$rollover, $renew';
  }
}
