/// status : 200
/// data : {"remaining_days":18,"remaining_traffic":1073741824000,"remaining_uptime":"_","balance":"0.00","unpaid_invoices":0,"loan":{"rx_mb":null,"tx_mb":null,"rxtx_mb":null,"days":null}}

class RemainingDaysModel {
  RemainingDaysModel({int? status, Data? data}) {
    _status = status;
    _data = data;
  }

  RemainingDaysModel.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  int? _status;
  Data? _data;

  RemainingDaysModel copyWith({int? status, Data? data}) =>
      RemainingDaysModel(status: status ?? _status, data: data ?? _data);

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

/// remaining_days : 18
/// remaining_traffic : 1073741824000
/// remaining_uptime : "_"
/// balance : "0.00"
/// unpaid_invoices : 0
/// loan : {"rx_mb":null,"tx_mb":null,"rxtx_mb":null,"days":null}

class Data {
  Data({
    int? remainingDays,
    int? remainingTraffic,
    String? remainingUptime,
    String? balance,
    int? unpaidInvoices,
    Loan? loan,
  }) {
    _remainingDays = remainingDays;
    _remainingTraffic = remainingTraffic;
    _remainingUptime = remainingUptime;
    _balance = balance;
    _unpaidInvoices = unpaidInvoices;
    _loan = loan;
  }

  Data.fromJson(dynamic json) {
    _remainingDays = json['remaining_days'];
    _remainingTraffic = json['remaining_traffic'];
    _remainingUptime = json['remaining_uptime'];
    _balance = json['balance'];
    _unpaidInvoices = json['unpaid_invoices'];
    _loan = json['loan'] != null ? Loan.fromJson(json['loan']) : null;
  }

  int? _remainingDays;
  int? _remainingTraffic;
  String? _remainingUptime;
  String? _balance;
  int? _unpaidInvoices;
  Loan? _loan;

  Data copyWith({
    int? remainingDays,
    int? remainingTraffic,
    String? remainingUptime,
    String? balance,
    int? unpaidInvoices,
    Loan? loan,
  }) => Data(
    remainingDays: remainingDays ?? _remainingDays,
    remainingTraffic: remainingTraffic ?? _remainingTraffic,
    remainingUptime: remainingUptime ?? _remainingUptime,
    balance: balance ?? _balance,
    unpaidInvoices: unpaidInvoices ?? _unpaidInvoices,
    loan: loan ?? _loan,
  );

  int? get remainingDays => _remainingDays;

  int? get remainingTraffic => _remainingTraffic;

  String? get remainingUptime => _remainingUptime;

  String? get balance => _balance;

  int? get unpaidInvoices => _unpaidInvoices;

  Loan? get loan => _loan;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['remaining_days'] = _remainingDays;
    map['remaining_traffic'] = _remainingTraffic;
    map['remaining_uptime'] = _remainingUptime;
    map['balance'] = _balance;
    map['unpaid_invoices'] = _unpaidInvoices;
    if (_loan != null) {
      map['loan'] = _loan?.toJson();
    }
    return map;
  }
}

/// rx_mb : null
/// tx_mb : null
/// rxtx_mb : null
/// days : null

class Loan {
  Loan({dynamic rxMb, dynamic txMb, dynamic rxtxMb, dynamic days}) {
    _rxMb = rxMb;
    _txMb = txMb;
    _rxtxMb = rxtxMb;
    _days = days;
  }

  Loan.fromJson(dynamic json) {
    _rxMb = json['rx_mb'];
    _txMb = json['tx_mb'];
    _rxtxMb = json['rxtx_mb'];
    _days = json['days'];
  }

  dynamic _rxMb;
  dynamic _txMb;
  dynamic _rxtxMb;
  dynamic _days;

  Loan copyWith({dynamic rxMb, dynamic txMb, dynamic rxtxMb, dynamic days}) =>
      Loan(
        rxMb: rxMb ?? _rxMb,
        txMb: txMb ?? _txMb,
        rxtxMb: rxtxMb ?? _rxtxMb,
        days: days ?? _days,
      );

  dynamic get rxMb => _rxMb;

  dynamic get txMb => _txMb;

  dynamic get rxtxMb => _rxtxMb;

  dynamic get days => _days;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rx_mb'] = _rxMb;
    map['tx_mb'] = _txMb;
    map['rxtx_mb'] = _rxtxMb;
    map['days'] = _days;
    return map;
  }
}
