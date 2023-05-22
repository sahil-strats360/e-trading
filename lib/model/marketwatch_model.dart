class MarketWatchListModel {
  MarketWatchListModel({
       this.id,
       this.marketWatchName,
       this.defaultWatch,
       this.status,
       this.createdAt,
       this.updatedAt,
       this.scripId,
       this.isDelete,
       this.userId,});

  MarketWatchListModel.fromJson(dynamic json) {
    id = json['id'];
    marketWatchName = json['market_watch_name'];
    defaultWatch = json['default_watch'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    scripId = json['scrip_id'];
    isDelete = json['is_delete'];
    userId = json['user_id'];
  }
  int id;
  String marketWatchName;
  String defaultWatch;
  String status;
  String createdAt;
  String updatedAt;
  dynamic scripId;
  String isDelete;
  String userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['market_watch_name'] = marketWatchName;
    map['default_watch'] = defaultWatch;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['scrip_id'] = scripId;
    map['is_delete'] = isDelete;
    map['user_id'] = userId;
    return map;
  }

}