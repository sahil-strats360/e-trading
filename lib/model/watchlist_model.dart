class WatchListModel {
  WatchListModel({
    this.watchlistId,
    this.userId,
    this.sequence,
    this.equityId,
    this.commodityId,
    this.currencyId,
    this.derivativeId,
    this.scripId,
    this.marketWatchId,
    this.createdAt,
    this.updatedAt,
    this.isDelete,
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

  WatchListModel.fromJson(dynamic json) {
    watchlistId = json['watchlist_id'];
    userId = json['user_id'];
    sequence = json['sequence'];
    equityId = json['equity_id'];
    commodityId = json['commodity_id'];
    currencyId = json['currency_id'];
    derivativeId = json['derivative_id'];
    scripId = json['scrip_id'];
    marketWatchId = json['market_watch_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isDelete = json['is_delete'];
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
  String watchlistId;
  String userId;
  dynamic sequence;
  dynamic equityId;
  dynamic commodityId;
  dynamic currencyId;
  dynamic derivativeId;
  String scripId;
  String marketWatchId;
  String createdAt;
  String updatedAt;
  String isDelete;
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
    map['watchlist_id'] = watchlistId;
    map['user_id'] = userId;
    map['sequence'] = sequence;
    map['equity_id'] = equityId;
    map['commodity_id'] = commodityId;
    map['currency_id'] = currencyId;
    map['derivative_id'] = derivativeId;
    map['scrip_id'] = scripId;
    map['market_watch_id'] = marketWatchId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['is_delete'] = isDelete;
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
