class Medicine {
  final String id;
  final String name;
  final String? description;
  final int minimumStockThreshold;

  Medicine({
    required this.id,
    required this.name,
    this.description,
    required this.minimumStockThreshold,
  });

  factory Medicine.fromJson(Map<String, dynamic> json) {
    return Medicine(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      minimumStockThreshold: json['minimum_stock_threshold'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      if (description != null) 'description': description,
      'minimum_stock_threshold': minimumStockThreshold,
    };
  }
}
