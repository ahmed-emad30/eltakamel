/// status : 200
/// data : {"profile_name":"Welcome package","description":null,"expiration":"2025-10-01 22:29:57","profile_id":22,"status":false,"price":200,"subscription_status":{"status":true,"traffic":true,"expiration":true,"uptime":true},"limits":{"rx_bytes":null,"tx_bytes":null,"rxtx_bytes":1073741824000,"uptime_seconds":null},"traffic_limit":107374182400}

class ServiceModel {
  ServiceModel({int? status, Data? data}) {
    _status = status;
    _data = data;
  }

  ServiceModel.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  int? _status;
  Data? _data;

  ServiceModel copyWith({int? status, Data? data}) =>
      ServiceModel(status: status ?? _status, data: data ?? _data);

  int? get status => _status;

  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

/// profile_name : "Welcome package"
/// description : null
/// expiration : "2025-10-01 22:29:57"
/// profile_id : 22
/// status : false
/// price : 200
/// subscription_status : {"status":true,"traffic":true,"expiration":true,"uptime":true}
/// limits : {"rx_bytes":null,"tx_bytes":null,"rxtx_bytes":1073741824000,"uptime_seconds":null}
/// traffic_limit : 107374182400

class Data {
  Data({
    String? profileName,
    dynamic description,
    String? expiration,
    int? profileId,
    bool? status,
    int? price,
    SubscriptionStatus? subscriptionStatus,
    Limits? limits,
    int? trafficLimit,
  }) {
    _profileName = profileName;
    _description = description;
    _expiration = expiration;
    _profileId = profileId;
    _status = status;
    _price = price;
    _subscriptionStatus = subscriptionStatus;
    _limits = limits;
    _trafficLimit = trafficLimit;
  }

  Data.fromJson(dynamic json) {
    _profileName = json['profile_name'];
    _description = json['description'];
    _expiration = json['expiration'];
    _profileId = json['profile_id'];
    _status = json['status'];
    _price = json['price'];
    _subscriptionStatus =
        json['subscription_status'] != null
            ? SubscriptionStatus.fromJson(json['subscription_status'])
            : null;
    _limits = json['limits'] != null ? Limits.fromJson(json['limits']) : null;
    _trafficLimit = json['traffic_limit'];
  }

  String? _profileName;
  dynamic _description;
  String? _expiration;
  int? _profileId;
  bool? _status;
  int? _price;
  SubscriptionStatus? _subscriptionStatus;
  Limits? _limits;
  int? _trafficLimit;

  Data copyWith({
    String? profileName,
    dynamic description,
    String? expiration,
    int? profileId,
    bool? status,
    int? price,
    SubscriptionStatus? subscriptionStatus,
    Limits? limits,
    int? trafficLimit,
  }) => Data(
    profileName: profileName ?? _profileName,
    description: description ?? _description,
    expiration: expiration ?? _expiration,
    profileId: profileId ?? _profileId,
    status: status ?? _status,
    price: price ?? _price,
    subscriptionStatus: subscriptionStatus ?? _subscriptionStatus,
    limits: limits ?? _limits,
    trafficLimit: trafficLimit ?? _trafficLimit,
  );

  String? get profileName => _profileName;

  dynamic get description => _description;

  String? get expiration => _expiration;

  int? get profileId => _profileId;

  bool? get status => _status;

  int? get price => _price;

  SubscriptionStatus? get subscriptionStatus => _subscriptionStatus;

  Limits? get limits => _limits;

  int? get trafficLimit => _trafficLimit;

  String get subscription {
    if (subscriptionStatus?.status == true) {
      return 'Active';
    } else if (subscriptionStatus?.expiration == true) {
      return 'Expired';
    } else if (subscriptionStatus?.traffic == true) {
      return 'Traffic';
    } else {
      return 'UpTime';
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['profile_name'] = _profileName;
    map['description'] = _description;
    map['expiration'] = _expiration;
    map['profile_id'] = _profileId;
    map['status'] = _status;
    map['price'] = _price;
    if (_subscriptionStatus != null) {
      map['subscription_status'] = _subscriptionStatus?.toJson();
    }
    if (_limits != null) {
      map['limits'] = _limits?.toJson();
    }
    map['traffic_limit'] = _trafficLimit;
    return map;
  }
}

/// rx_bytes : null
/// tx_bytes : null
/// rxtx_bytes : 1073741824000
/// uptime_seconds : null

class Limits {
  Limits({
    dynamic rxBytes,
    dynamic txBytes,
    int? rxtxBytes,
    dynamic uptimeSeconds,
  }) {
    _rxBytes = rxBytes;
    _txBytes = txBytes;
    _rxtxBytes = rxtxBytes;
    _uptimeSeconds = uptimeSeconds;
  }

  Limits.fromJson(dynamic json) {
    _rxBytes = json['rx_bytes'];
    _txBytes = json['tx_bytes'];
    _rxtxBytes = json['rxtx_bytes'];
    _uptimeSeconds = json['uptime_seconds'];
  }

  dynamic _rxBytes;
  dynamic _txBytes;
  int? _rxtxBytes;
  dynamic _uptimeSeconds;

  Limits copyWith({
    dynamic rxBytes,
    dynamic txBytes,
    int? rxtxBytes,
    dynamic uptimeSeconds,
  }) => Limits(
    rxBytes: rxBytes ?? _rxBytes,
    txBytes: txBytes ?? _txBytes,
    rxtxBytes: rxtxBytes ?? _rxtxBytes,
    uptimeSeconds: uptimeSeconds ?? _uptimeSeconds,
  );

  dynamic get rxBytes => _rxBytes;

  dynamic get txBytes => _txBytes;

  int? get rxtxBytes => _rxtxBytes;

  dynamic get uptimeSeconds => _uptimeSeconds;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rx_bytes'] = _rxBytes;
    map['tx_bytes'] = _txBytes;
    map['rxtx_bytes'] = _rxtxBytes;
    map['uptime_seconds'] = _uptimeSeconds;
    return map;
  }
}

/// status : true
/// traffic : true
/// expiration : true
/// uptime : true

class SubscriptionStatus {
  SubscriptionStatus({
    bool? status,
    bool? traffic,
    bool? expiration,
    bool? uptime,
  }) {
    _status = status;
    _traffic = traffic;
    _expiration = expiration;
    _uptime = uptime;
  }

  SubscriptionStatus.fromJson(dynamic json) {
    _status = json['status'];
    _traffic = json['traffic'];
    _expiration = json['expiration'];
    _uptime = json['uptime'];
  }

  bool? _status;
  bool? _traffic;
  bool? _expiration;
  bool? _uptime;

  SubscriptionStatus copyWith({
    bool? status,
    bool? traffic,
    bool? expiration,
    bool? uptime,
  }) => SubscriptionStatus(
    status: status ?? _status,
    traffic: traffic ?? _traffic,
    expiration: expiration ?? _expiration,
    uptime: uptime ?? _uptime,
  );

  bool? get status => _status;

  bool? get traffic => _traffic;

  bool? get expiration => _expiration;

  bool? get uptime => _uptime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['traffic'] = _traffic;
    map['expiration'] = _expiration;
    map['uptime'] = _uptime;
    return map;
  }
}
