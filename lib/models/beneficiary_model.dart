class Beneficiary {
  final String id;
  final String name;
  final String? contactInfo;
  final String? medicalHistory;
  final String? specificCareRequirements;
  final DateTime createdAt;

  Beneficiary({
    required this.id,
    required this.name,
    this.contactInfo,
    this.medicalHistory,
    this.specificCareRequirements,
    required this.createdAt,
  });

  factory Beneficiary.fromJson(Map<String, dynamic> json) {
    return Beneficiary(
      id: json['id'] as String,
      name: json['name'] as String,
      contactInfo: json['contact_info'] as String?,
      medicalHistory: json['medical_history'] as String?,
      specificCareRequirements: json['specific_care_requirements'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      if (contactInfo != null) 'contact_info': contactInfo,
      if (medicalHistory != null) 'medical_history': medicalHistory,
      if (specificCareRequirements != null)
        'specific_care_requirements': specificCareRequirements,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
