/// status : 200
/// data : {"username":"test","firstname":"App","lastname":null,"name":"App ","email":null,"phone":null,"address":null,"company":null,"registered_on":{"date":"2025-09-01 22:29:57.000000","timezone_type":3,"timezone":"Africa/Tripoli"},"id":1552,"static_ip":null,"balance":0,"auto_renew":0,"profile_id":22,"contract_id":null,"loan_balance":0,"parent_id":1}
/// permissions : ["prm_ucp_activate","prm_ucp_auto_login","prm_ucp_billing","prm_ucp_browse_packages","prm_ucp_change_info","prm_ucp_change_profile","prm_ucp_data_usage","prm_ucp_login","prm_ucp_sessions","prm_ucp_support","prm_ucp_auto_renew","prm_ucp_extend","prm_ucp_docs_show"]

class UserModel {
  UserModel({int? status, Data? data, List<String>? permissions}) {
    _status = status;
    _data = data;
    _permissions = permissions;
  }

  UserModel.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _permissions =
        json['permissions'] != null ? json['permissions'].cast<String>() : [];
  }

  int? _status;
  Data? _data;
  List<String>? _permissions;

  UserModel copyWith({int? status, Data? data, List<String>? permissions}) =>
      UserModel(
        status: status ?? _status,
        data: data ?? _data,
        permissions: permissions ?? _permissions,
      );

  int? get status => _status;

  Data? get data => _data;

  List<String>? get permissions => _permissions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['permissions'] = _permissions;
    return map;
  }
}

/// username : "test"
/// firstname : "App"
/// lastname : null
/// name : "App "
/// email : null
/// phone : null
/// address : null
/// company : null
/// registered_on : {"date":"2025-09-01 22:29:57.000000","timezone_type":3,"timezone":"Africa/Tripoli"}
/// id : 1552
/// static_ip : null
/// balance : 0
/// auto_renew : 0
/// profile_id : 22
/// contract_id : null
/// loan_balance : 0
/// parent_id : 1

class Data {
  Data({
    String? username,
    String? firstname,
    dynamic lastname,
    String? name,
    dynamic email,
    dynamic phone,
    dynamic address,
    dynamic company,
    RegisteredOn? registeredOn,
    int? id,
    dynamic staticIp,
    int? balance,
    int? autoRenew,
    int? profileId,
    dynamic contractId,
    int? loanBalance,
    int? parentId,
  }) {
    _username = username;
    _firstname = firstname;
    _lastname = lastname;
    _name = name;
    _email = email;
    _phone = phone;
    _address = address;
    _company = company;
    _registeredOn = registeredOn;
    _id = id;
    _staticIp = staticIp;
    _balance = balance;
    _autoRenew = autoRenew;
    _profileId = profileId;
    _contractId = contractId;
    _loanBalance = loanBalance;
    _parentId = parentId;
  }

  Data.fromJson(dynamic json) {
    _username = json['username'];
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _name = json['name'];
    _email = json['email'];
    _phone = json['phone'];
    _address = json['address'];
    _company = json['company'];
    _registeredOn =
        json['registered_on'] != null
            ? RegisteredOn.fromJson(json['registered_on'])
            : null;
    _id = json['id'];
    _staticIp = json['static_ip'];
    _balance = json['balance'];
    _autoRenew = json['auto_renew'];
    _profileId = json['profile_id'];
    _contractId = json['contract_id'];
    _loanBalance = json['loan_balance'];
    _parentId = json['parent_id'];
  }

  String? _username;
  String? _firstname;
  dynamic _lastname;
  String? _name;
  dynamic _email;
  dynamic _phone;
  dynamic _address;
  dynamic _company;
  RegisteredOn? _registeredOn;
  int? _id;
  dynamic _staticIp;
  int? _balance;
  int? _autoRenew;
  int? _profileId;
  dynamic _contractId;
  int? _loanBalance;
  int? _parentId;

  Data copyWith({
    String? username,
    String? firstname,
    dynamic lastname,
    String? name,
    dynamic email,
    dynamic phone,
    dynamic address,
    dynamic company,
    RegisteredOn? registeredOn,
    int? id,
    dynamic staticIp,
    int? balance,
    int? autoRenew,
    int? profileId,
    dynamic contractId,
    int? loanBalance,
    int? parentId,
  }) => Data(
    username: username ?? _username,
    firstname: firstname ?? _firstname,
    lastname: lastname ?? _lastname,
    name: name ?? _name,
    email: email ?? _email,
    phone: phone ?? _phone,
    address: address ?? _address,
    company: company ?? _company,
    registeredOn: registeredOn ?? _registeredOn,
    id: id ?? _id,
    staticIp: staticIp ?? _staticIp,
    balance: balance ?? _balance,
    autoRenew: autoRenew ?? _autoRenew,
    profileId: profileId ?? _profileId,
    contractId: contractId ?? _contractId,
    loanBalance: loanBalance ?? _loanBalance,
    parentId: parentId ?? _parentId,
  );

  String? get username => _username;

  String? get firstname => _firstname;

  dynamic get lastname => _lastname;

  String? get name => _name;

  dynamic get email => _email;

  dynamic get phone => _phone;

  dynamic get address => _address;

  dynamic get company => _company;

  RegisteredOn? get registeredOn => _registeredOn;

  int? get id => _id;

  dynamic get staticIp => _staticIp;

  int? get balance => _balance;

  int? get autoRenew => _autoRenew;

  int? get profileId => _profileId;

  dynamic get contractId => _contractId;

  int? get loanBalance => _loanBalance;

  int? get parentId => _parentId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = _username;
    map['firstname'] = _firstname;
    map['lastname'] = _lastname;
    map['name'] = _name;
    map['email'] = _email;
    map['phone'] = _phone;
    map['address'] = _address;
    map['company'] = _company;
    if (_registeredOn != null) {
      map['registered_on'] = _registeredOn?.toJson();
    }
    map['id'] = _id;
    map['static_ip'] = _staticIp;
    map['balance'] = _balance;
    map['auto_renew'] = _autoRenew;
    map['profile_id'] = _profileId;
    map['contract_id'] = _contractId;
    map['loan_balance'] = _loanBalance;
    map['parent_id'] = _parentId;
    return map;
  }
}

/// date : "2025-09-01 22:29:57.000000"
/// timezone_type : 3
/// timezone : "Africa/Tripoli"

class RegisteredOn {
  RegisteredOn({String? date, int? timezoneType, String? timezone}) {
    _date = date;
    _timezoneType = timezoneType;
    _timezone = timezone;
  }

  RegisteredOn.fromJson(dynamic json) {
    _date = json['date'];
    _timezoneType = json['timezone_type'];
    _timezone = json['timezone'];
  }

  String? _date;
  int? _timezoneType;
  String? _timezone;

  RegisteredOn copyWith({String? date, int? timezoneType, String? timezone}) =>
      RegisteredOn(
        date: date ?? _date,
        timezoneType: timezoneType ?? _timezoneType,
        timezone: timezone ?? _timezone,
      );

  String? get date => _date;

  int? get timezoneType => _timezoneType;

  String? get timezone => _timezone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    map['timezone_type'] = _timezoneType;
    map['timezone'] = _timezone;
    return map;
  }
}
