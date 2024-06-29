enum CurrencyType {
  turkishLira,
  euro,
  usDollar;

  @override
  String toString() {
    switch (this) {
      case CurrencyType.turkishLira:
        return 'TRY';
      case CurrencyType.euro:
        return 'EUR';
      case CurrencyType.usDollar:
        return 'USD';
      default:
        return 'TRY';
    }
  }

  static CurrencyType fromString(String? currency) {
    switch (currency) {
      case 'TRY':
        return CurrencyType.turkishLira;
      case 'EUR':
        return CurrencyType.euro;
      case 'USD':
        return CurrencyType.usDollar;
      default:
        return CurrencyType.turkishLira;
    }
  }

  String toCurrencySign() {
    switch (this) {
      case CurrencyType.turkishLira:
        return '₺';
      case CurrencyType.euro:
        return '€';
      case CurrencyType.usDollar:
        return '\$';
      default:
        return '₺';
    }
  }
}
