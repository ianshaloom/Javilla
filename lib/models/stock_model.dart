class StockModel {
  // Database columns
  final int rno; // Record number (Primary Key, auto_increment, NOT NULL)
  final String? pno; // Product number/code
  final String? pname; // Product name
  final double cost; // Cost price (NOT NULL, default: 0)
  final double? price; // Selling price (default: 0)
  final double qty; // Quantity on hand (NOT NULL, default: 0)
  final String? cart; // Category/cart identifier

  const StockModel({
    required this.rno,
    this.pno,
    this.pname,
    required this.cost,
    this.price,
    required this.qty,
    this.cart,
  });

  // Factory constructor to create StockModel from database row
  factory StockModel.fromMap(Map<String, dynamic> map) {
    return StockModel(
      rno: map['rno'] != null ? (map['rno'] is int ? map['rno'] as int : int.tryParse(map['rno'].toString()) ?? 0) : 0,
      pno: map['pno'] as String?,
      pname: map['pname'] as String?,
      cost: map['cost'] != null
          ? (map['cost'] is num ? (map['cost'] as num).toDouble() : double.tryParse(map['cost'].toString()) ?? 0.0)
          : 0.0,
      price: map['price'] != null
          ? (map['price'] is num ? (map['price'] as num).toDouble() : double.tryParse(map['price'].toString()))
          : null,
      qty: map['qty'] != null
          ? (map['qty'] is num ? (map['qty'] as num).toDouble() : double.tryParse(map['qty'].toString()) ?? 0.0)
          : 0.0,
      cart: map['cart'] as String?,
    );
  }

  // Convert StockModel to Map for database operations
  Map<String, dynamic> toMap() {
    return {'rno': rno, 'pno': pno, 'pname': pname, 'cost': cost, 'price': price, 'qty': qty, 'cart': cart};
  }

  // Convert StockModel to Map for INSERT operations (excluding auto-increment rno)
  Map<String, dynamic> toInsertMap() {
    return {'pno': pno, 'pname': pname, 'cost': cost, 'price': price, 'qty': qty, 'cart': cart};
  }

  // Create a copy of StockModel with updated fields
  StockModel copyWith({int? rno, String? pno, String? pname, double? cost, double? price, double? qty, String? cart}) {
    return StockModel(
      rno: rno ?? this.rno,
      pno: pno ?? this.pno,
      pname: pname ?? this.pname,
      cost: cost ?? this.cost,
      price: price ?? this.price,
      qty: qty ?? this.qty,
      cart: cart ?? this.cart,
    );
  }

  @override
  String toString() {
    return 'StockModel(rno: $rno, pno: $pno, pname: $pname, cost: $cost, price: $price, qty: $qty, cart: $cart)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is StockModel &&
        other.rno == rno &&
        other.pno == pno &&
        other.pname == pname &&
        other.cost == cost &&
        other.price == price &&
        other.qty == qty &&
        other.cart == cart;
  }

  @override
  int get hashCode => Object.hash(rno, pno, pname, cost, price, qty, cart);

  // Helper getters for calculated/derived values
  double get totalCost => cost * qty;
  double get totalRevenue => (price ?? 0.0) * qty;
  double get marginPerUnit => (price ?? 0.0) - cost;
  double get totalMargin => marginPerUnit * qty;

  // Helper getters for display
  String get displayName => (pname?.isNotEmpty == true) ? pname! : (pno ?? 'Unknown');
  String get formattedCost => cost.toStringAsFixed(2);
  String get formattedPrice => (price ?? 0.0).toStringAsFixed(2);
  String get formattedQty => qty.toStringAsFixed(0);
  String get formattedTotalRevenue => totalRevenue.toStringAsFixed(2);
  String get formattedTotalCost => totalCost.toStringAsFixed(2);
  String get formattedTotalMargin => totalMargin.toStringAsFixed(2);

  // Helper getters for business logic
  bool get hasCart => cart != null && cart!.isNotEmpty;
  bool get isOutOfStock => qty <= 0;
}
