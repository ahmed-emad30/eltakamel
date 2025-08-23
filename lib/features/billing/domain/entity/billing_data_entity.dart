class BillingDataEntity {
  String title;
  List<String> headers;
  List<List<String>> data;

  BillingDataEntity({
    required this.title,
    required this.headers,
    required this.data,
  });

  BillingDataEntity copyWith({
    String? title,
    List<String>? headers,
    List<List<String>>? data,
  }) {
    return BillingDataEntity(
      title: title ?? this.title,
      headers: headers ?? this.headers,
      data: data ?? this.data,
    );
  }
}
