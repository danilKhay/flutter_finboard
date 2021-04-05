enum Resolution {
  ONE_MIN,
  FIVE_MIN,
  FIFTEEN_MIN,
  THIRTY_MIN,
  SIXTY_MIN,
  DAY,
  WEEK,
  MONTH,
  NONE
}

String fromResolutionToString(Resolution resolution) {
  switch (resolution) {
    case Resolution.ONE_MIN: return '1';
    case Resolution.FIVE_MIN: return '5';
    case Resolution.FIFTEEN_MIN: return '15';
    case Resolution.THIRTY_MIN: return '30';
    case Resolution.SIXTY_MIN: return '60';
    case Resolution.DAY: return 'D';
    case Resolution.WEEK: return 'W';
    case Resolution.MONTH: return 'M';
    default: return '1';
  }
}

Resolution fromStringToResolution (String str) {
  switch (str) {
    case '1': return Resolution.ONE_MIN;
    case '5': return Resolution.FIVE_MIN;
    case '15': return Resolution.FIFTEEN_MIN;
    case '30': return Resolution.THIRTY_MIN;
    case '60': return Resolution.SIXTY_MIN;
    case 'D': return Resolution.DAY;
    case 'W': return Resolution.WEEK;
    case 'M': return Resolution.MONTH;
    default: return Resolution.NONE;
  }
}