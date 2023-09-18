class CustomerWishlist {
  String? customerId;
  String? productId;
  String? dateAdded;

  CustomerWishlist({this.customerId, this.productId, this.dateAdded});

  CustomerWishlist.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    productId = json['product_id'];
    dateAdded = json['date_added'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_id'] = this.customerId;
    data['product_id'] = this.productId;
    data['date_added'] = this.dateAdded;
    return data;
  }
}
