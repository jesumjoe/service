class Inventory {
  final String id;
  final String medicineId;
  final String batchNumber;
  final DateTime? expiryDate;
  final int quantity;
  final String? storageConditions;
  final DateTime updatedAt;

  Inventory({
    required this.id,
    required this.medicineId,
    required this.batchNumber,
    this.expiryDate,
    required this.quantity,
    this.storageConditions,
    required this.updatedAt,
  });

  factory Inventory.fromJson(Map<String, dynamic> json) {
    return Inventory(
      id: json['id'] as String,
      medicineId: json['medicine_id'] as String,
      batchNumber: json['batch_number'] as String,
      expiryDate: json['expiry_date'] != null
          ? DateTime.parse(json['expiry_date'] as String)
          : null,
      quantity: json['quantity'] as int,
      storageConditions: json['storage_conditions'] as String?,
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'medicine_id': medicineId,
      'batch_number': batchNumber,
      if (expiryDate != null)
        'expiry_date': expiryDate!.toIso8601String().split('T')[0],
      'quantity': quantity,
      if (storageConditions != null) 'storage_conditions': storageConditions,
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
