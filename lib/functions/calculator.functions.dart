import 'package:kiosk_new/utils/mystrings.dart';

int caculatePointNext(int point) {
  if (point > 0 && point <= 20000) {
    return 20000 - point;
  } else if (point > 20000 && point <= 100000) {
    return 100000 - point;
  } else if (point > 100000 && point <= 350000) {
    return 350000 - point;
  } else if (point > 350000 && point <= 1000000) {
    return 1000000 - point;
  }
  //over one + level mean > 1000001
  else if (point > 1000000) {
    return 1000001;
  } else
    return point;
}

calculateImageLevel(String tiername) {
  switch (tiername) {
    case 'P':return StringFactory.logo_p;
    case 'P (One Sign)': return StringFactory.logo_p;
    case 'P (V Sign)': return StringFactory.logo_p;
    case 'P (MGT)':
      return StringFactory.logo_p;


    case 'I':
      return StringFactory.logo_i;
    case 'I (One Sign)':
      return StringFactory.logo_i;
    case 'I (V Sign)':
      return StringFactory.logo_i;
    case 'I (MGT)':
      return StringFactory.logo_i;
    case 'Double I':
      return StringFactory.logo_i;
    case 'Double I (MGT)':
      return StringFactory.logo_i;
    case 'Double I (One Sign)':
      return StringFactory.logo_i;
    case 'Double I (V Sign)':
      return StringFactory.logo_i;
    case 'DOUBLE I':
      return StringFactory.logo_i;
    case 'DOUBLE I (MGT)':
      return StringFactory.logo_i;
    case 'DOUBLE I (One Sign)':
      return StringFactory.logo_i;
    case 'DOUBLE I (V Sign)': return StringFactory.logo_i;
    case 'V':
      return StringFactory.logo_v;
    case 'V (One Sign)':
      return StringFactory.logo_v;
    case 'V (V Sign)': return StringFactory.logo_v;
    case 'V (MGT)': return StringFactory.logo_v;
    case 'ONE': return StringFactory.logo_one;
    case 'ONE (V Sign)':
      return StringFactory.logo_one;
    case 'ONE (One Sign)':
      return StringFactory.logo_one;
    case 'ONE (MGT)': return StringFactory.logo_one;
    case 'ONE+':
      return StringFactory.logo_one2;
    case 'DOUBLE ONE+':
      return StringFactory.logo_one2;
    case 'ONE+ (MGT)':
      return StringFactory.logo_one2;
    case 'ONE+ (ONE Sign)':
      return StringFactory.logo_one2;
    case 'ONE+ (V Sign)':
      return StringFactory.logo_one2;

    case 'New Player':
      return StringFactory.logo_no_level;
    case 'Test':
      return StringFactory.logo_no_level;
    case 'Test (VIP)':
      return StringFactory.logo_no_level;
    default:
      return StringFactory.logo_no_level;
  }
}
