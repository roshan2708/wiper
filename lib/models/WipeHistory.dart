class WipeHistory {
  final String driveName;
  final String method;
  final DateTime date;
  final String status;

  WipeHistory({
    required this.driveName,
    required this.method,
    required this.date,
    required this.status,
  });

  Map<String, dynamic> toJson() => {
        'driveName': driveName,
        'method': method,
        'date': date.toIso8601String(),
        'status': status,
      };

  factory WipeHistory.fromJson(Map<String, dynamic> json) => WipeHistory(
        driveName: json['driveName'],
        method: json['method'],
        date: DateTime.parse(json['date']),
        status: json['status'],
      );
}