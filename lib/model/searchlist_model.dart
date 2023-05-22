class SearchListModel {
  SearchListModel({
    this.id,
    this.semExmExchId,
    this.semSegment,
    this.semSmstSecurityId,
    this.semInstrumentName,
    this.semExpiryCode,
    this.semTradingSymbol,
    this.semLotUnits,
    this.semCustomSymbol,
    this.semExpiryDate,
    this.semStrikePrice,
    this.semOptionType,
    this.semTickSize,
    this.semExpiryFlag,
  });

  SearchListModel.fromJson(dynamic json) {
    id = json['id'];
    semExmExchId = json['sem_exm_exch_id'];
    semSegment = json['sem_segment'];
    semSmstSecurityId = json['sem_smst_security_id'];
    semInstrumentName = json['sem_instrument_name'];
    semExpiryCode = json['sem_expiry_code'];
    semTradingSymbol = json['sem_trading_symbol'];
    semLotUnits = json['sem_lot_units'];
    semCustomSymbol = json['sem_custom_symbol'];
    semExpiryDate = json['sem_expiry_date'];
    semStrikePrice = json['sem_strike_price'];
    semOptionType = json['sem_option_type'];
    semTickSize = json['sem_tick_size'];
    semExpiryFlag = json['sem_expiry_flag'];
  }
  int id;
  String semExmExchId;
  String semSegment;
  String semSmstSecurityId;
  String semInstrumentName;
  String semExpiryCode;
  String semTradingSymbol;
  String semLotUnits;
  String semCustomSymbol;
  String semExpiryDate;
  String semStrikePrice;
  String semOptionType;
  String semTickSize;
  String semExpiryFlag;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['sem_exm_exch_id'] = semExmExchId;
    map['sem_segment'] = semSegment;
    map['sem_smst_security_id'] = semSmstSecurityId;
    map['sem_instrument_name'] = semInstrumentName;
    map['sem_expiry_code'] = semExpiryCode;
    map['sem_trading_symbol'] = semTradingSymbol;
    map['sem_lot_units'] = semLotUnits;
    map['sem_custom_symbol'] = semCustomSymbol;
    map['sem_expiry_date'] = semExpiryDate;
    map['sem_strike_price'] = semStrikePrice;
    map['sem_option_type'] = semOptionType;
    map['sem_tick_size'] = semTickSize;
    map['sem_expiry_flag'] = semExpiryFlag;
    return map;
  }
}
