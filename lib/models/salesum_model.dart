class SalesumModel {
  final int rno; // Record number (Primary Key, auto_increment, NOT NULL)
  final String? rcno; // Receipt number
  final double? paid; // Amount paid (default: 0)
  final String? payvia; // Payment method
  final String? user;
  final DateTime? sdate; // Sale date (default: current_timestamp)
  final double? examount; // Extra amount (default: 0)
  final double? exqty; // Extra amount (default: 0)
  final String cname; // Customer name (NOT NULL)

  SalesumModel({
    required this.rno,
    this.rcno,
    this.paid,
    this.payvia,
    this.user,
    this.sdate,
    this.examount,
    this.exqty,
    required this.cname,
  });

  // Factory constructor to create SalesumModel from database row
  factory SalesumModel.fromMap(Map<String, dynamic> map) {
    return SalesumModel(
      rno: map['rno'] != null ? (map['rno'] is int ? map['rno'] as int : int.tryParse(map['rno'].toString()) ?? 0) : 0,
      rcno: map['rcno'] as String?,
      paid: map['paid'] != null ? double.tryParse(map['paid'].toString()) : null,
      payvia: map['payvia'] as String?,
      user: map['user'] as String?,
      sdate: map['sdate'] != null
          ? (map['sdate'] is DateTime ? map['sdate'] as DateTime : DateTime.tryParse(map['sdate'].toString()))
          : null,
      examount: map['examount'] != null ? double.tryParse(map['examount'].toString()) : null,
      exqty: map['exqty'] != null ? double.tryParse(map['exqty'].toString()) : null,
      cname: map['cname'] as String? ?? '', // Default to empty string if null
    );
  }

  // Convert SalesumModel to Map for database operations
  Map<String, dynamic> toMap() {
    return {
      'rno': rno,
      'rcno': rcno,
      'paid': paid,
      'payvia': payvia,
      'user': user,
      'sdate': sdate?.toIso8601String(),
      'examount': examount,
      'cname': cname,
    };
  }

  // Convert SalesumModel to Map for INSERT operations (excluding auto-increment rno)
  Map<String, dynamic> toInsertMap() {
    return {
      'rcno': rcno,
      'paid': paid,
      'payvia': payvia,
      'user': user,
      'sdate': sdate?.toIso8601String(),
      'examount': examount,
      'cname': cname,
    };
  }

  // Create a copy of SalesumModel with updated fields
  SalesumModel copyWith({
    int? rno,
    String? rcno,
    double? paid,
    String? payvia,
    String? user,
    DateTime? sdate,
    double? examount,
    double? exqty,
    String? cname,
  }) {
    return SalesumModel(
      rno: rno ?? this.rno,
      rcno: rcno ?? this.rcno,
      paid: paid ?? this.paid,
      payvia: payvia ?? this.payvia,
      user: user ?? this.user,
      sdate: sdate ?? this.sdate,
      examount: examount ?? this.examount,
      exqty: exqty ?? this.exqty,
      cname: cname ?? this.cname,
    );
  }

  @override
  String toString() {
    return 'SalesumModel(rno: $rno, rcno: $rcno, paid: $paid, payvia: $payvia, user: $user, sdate: $sdate, examount: $examount, cname: $cname)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SalesumModel &&
        other.rno == rno &&
        other.rcno == rcno &&
        other.paid == paid &&
        other.payvia == payvia &&
        other.user == user &&
        other.sdate == sdate &&
        other.examount == examount &&
        other.cname == cname;
  }

  @override
  int get hashCode {
    return Object.hash(rno, rcno, paid, payvia, user, sdate, examount, cname);
  }

  // Helper getters for calculated fields
  double get totalPaid => (paid ?? 0.0) + (examount ?? 0.0);
  double get basePaid => paid ?? 0.0;
  double get extraAmount => (examount ?? 0.0) * ((exqty ?? 1.0) == 0.0 ? 1.0 : (exqty ?? 1.0));

  // Helper getters for display
  String get formattedPaid => paid?.toStringAsFixed(2) ?? '0.00';
  String get formattedExtraAmount => extraAmount.toStringAsFixed(2);
  String get formattedTotalPaid => totalPaid.toStringAsFixed(2);
  String get formattedDate => sdate?.toString().split(' ')[0] ?? '';
  String get formattedDateTime => sdate?.toString() ?? '';

  // Helper getters for business logic
  bool get hasExtraAmount => (examount ?? 0.0) > 0.0;
  bool get hasReceiptNumber => rcno != null && rcno!.isNotEmpty;
  bool get isCashPayment => payvia == 'CASH';
  bool get isCardPayment => payvia == 'CARD';
  bool get isBankPayment => payvia == 'BANK';

  // Helper method to get payment method display
  String get paymentMethodDisplay {
    if (payvia == null || payvia!.isEmpty) return 'Not specified';
    return payvia!.toUpperCase();
  }

  bool get payViaEmpty => (payvia == null) || payvia!.isEmpty;
}
