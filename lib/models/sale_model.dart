class SaleModel {
  final String? pname; // Product name
  final double? price;
  final double? qua; // Quantity
  final double? quao; // Quantity ordered
  final DateTime? pdate; // Purchase date
  final String? user;
  final String? rcno; // Receipt number
  final int rno; // Record number (Primary Key, auto_increment, NOT NULL)
  final double? apaid; // Amount paid
  final String? payvia; // Payment method
  final String cname; // Customer name (NOT NULL)

  SaleModel({
    this.pname,
    this.price,
    this.qua,
    this.quao,
    this.pdate,
    this.user,
    this.rcno,
    required this.rno,
    this.apaid,
    this.payvia,
    required this.cname,
  });

  // Factory constructor to create SaleModel from database row
  factory SaleModel.fromMap(Map<String, dynamic> map) {
    return SaleModel(
      pname: map['pname'] as String?,
      price: map['price'] != null
          ? double.tryParse(map['price'].toString())
          : null,
      qua: map['qua'] != null ? double.tryParse(map['qua'].toString()) : null,
      quao: map['quao'] != null
          ? double.tryParse(map['quao'].toString())
          : null,
      pdate: map['pdate'] != null
          ? (map['pdate'] is DateTime
                ? map['pdate'] as DateTime
                : DateTime.tryParse(map['pdate'].toString()))
          : null,
      user: map['user'] as String?,
      rcno: map['rcno'] as String?,
      rno: map['rno'] != null
          ? (map['rno'] is int
                ? map['rno'] as int
                : int.tryParse(map['rno'].toString()) ?? 0)
          : 0,
      apaid: map['apaid'] != null
          ? double.tryParse(map['apaid'].toString())
          : null,
      payvia: map['payvia'] as String?,
      cname: map['cname'] as String? ?? '', // Default to empty string if null
    );
  }

  // Convert SaleModel to Map for database operations
  Map<String, dynamic> toMap() {
    return {
      'pname': pname,
      'price': price,
      'qua': qua,
      'quao': quao,
      'pdate': pdate?.toIso8601String(),
      'user': user,
      'rcno': rcno,
      'rno': rno,
      'apaid': apaid,
      'payvia': payvia,
      'cname': cname,
    };
  }

  // Convert SaleModel to Map for INSERT operations (excluding auto-increment rno)
  Map<String, dynamic> toInsertMap() {
    return {
      'pname': pname,
      'price': price,
      'qua': qua,
      'quao': quao,
      'pdate': pdate?.toIso8601String(),
      'user': user,
      'rcno': rcno,
      'apaid': apaid,
      'payvia': payvia,
      'cname': cname,
    };
  }

  // Create a copy of SaleModel with updated fields
  SaleModel copyWith({
    String? pname,
    double? price,
    double? qua,
    double? quao,
    DateTime? pdate,
    String? user,
    String? rcno,
    int? rno,
    double? apaid,
    String? payvia,
    String? cname,
  }) {
    return SaleModel(
      pname: pname ?? this.pname,
      price: price ?? this.price,
      qua: qua ?? this.qua,
      quao: quao ?? this.quao,
      pdate: pdate ?? this.pdate,
      user: user ?? this.user,
      rcno: rcno ?? this.rcno,
      rno: rno ?? this.rno,
      apaid: apaid ?? this.apaid,
      payvia: payvia ?? this.payvia,
      cname: cname ?? this.cname,
    );
  }

  @override
  String toString() {
    return 'SaleModel(pname: $pname, price: $price, qua: $qua, quao: $quao, pdate: $pdate, user: $user, rcno: $rcno, rno: $rno, apaid: $apaid, payvia: $payvia, cname: $cname)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SaleModel &&
        other.pname == pname &&
        other.price == price &&
        other.qua == qua &&
        other.quao == quao &&
        other.pdate == pdate &&
        other.user == user &&
        other.rcno == rcno &&
        other.rno == rno &&
        other.apaid == apaid &&
        other.payvia == payvia &&
        other.cname == cname;
  }

  @override
  int get hashCode {
    return Object.hash(
      pname,
      price,
      qua,
      quao,
      pdate,
      user,
      rcno,
      rno,
      apaid,
      payvia,
      cname,
    );
  }

  // Helper getters for calculated fields
  double get totalAmount => (price ?? 0.0) * (qua ?? 0.0);
  double get remainingAmount => totalAmount - (apaid ?? 0.0);
  bool get isFullyPaid => remainingAmount <= 0;

  // Helper getters for display
  String get formattedPrice => price?.toStringAsFixed(2) ?? '0.00';
  String get formattedQuantity => qua?.toStringAsFixed(2) ?? '0.00';
  String get formattedAmountPaid => apaid?.toStringAsFixed(2) ?? '0.00';
  String get formattedDate => pdate?.toString().split(' ')[0] ?? '';
}
