// To parse this JSON data, do
//
//     final appliedLeave = appliedLeaveFromJson(jsonString);

import 'dart:convert';

List<AppliedLeave> appliedLeaveFromJson(String str) => List<AppliedLeave>.from(json.decode(str).map((x) => AppliedLeave.fromJson(x)));

String appliedLeaveToJson(List<AppliedLeave> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AppliedLeave {
  AppliedLeave({
    required this.id,
    required this.gmail,
    required this.leaveType,
    required this.fromDate,
    required this.toDate,
    required this.contract,
    required this.task,
    required this.reason,
    required this.status,
    required this.createdAt,
  });

  String id;
  String gmail;
  String leaveType;
  String fromDate;
  String toDate;
  String contract;
  String task;
  String reason;
  String status;
  DateTime createdAt;

  factory AppliedLeave.fromJson(Map<String, dynamic> json) => AppliedLeave(
    id: json["id"],
    gmail: json["gmail"],
    leaveType: json["leave_type"],
    fromDate: json["from_date"],
    toDate: json["to_date"],
    contract: json["contract"],
    task: json["task"],
    reason: json["reason"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "gmail": gmail,
    "leave_type": leaveType,
    "from_date": fromDate,
    "to_date": toDate,
    "contract": contract,
    "task": task,
    "reason": reason,
    "status": status,
    "created_at": createdAt.toIso8601String(),
  };
}
