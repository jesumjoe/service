class MedicineIssueLog {
  final String id;
  final String beneficiaryId;
  final String inventoryId;
  final String? staffId;
  final String? dosageGiven;
  final int quantityIssued;
  final DateTime issuedAt;

  MedicineIssueLog({
    required this.id,
    required this.beneficiaryId,
    required this.inventoryId,
    this.staffId,
    this.dosageGiven,
    required this.quantityIssued,
    required this.issuedAt,
  });

  factory MedicineIssueLog.fromJson(Map<String, dynamic> json) {
    return MedicineIssueLog(
      id: json['id'] as String,
      beneficiaryId: json['beneficiary_id'] as String,
      inventoryId: json['inventory_id'] as String,
      staffId: json['staff_id'] as String?,
      dosageGiven: json['dosage_given'] as String?,
      quantityIssued: json['quantity_issued'] as int,
      issuedAt: DateTime.parse(json['issued_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'beneficiary_id': beneficiaryId,
      'inventory_id': inventoryId,
      if (staffId != null) 'staff_id': staffId,
      if (dosageGiven != null) 'dosage_given': dosageGiven,
      'quantity_issued': quantityIssued,
      'issued_at': issuedAt.toIso8601String(),
    };
  }
}
