class Prands {
  String? manufacturerId;
  String? name;
  String? image;
  String? sortOrder;
  String? storeId;
  String? href;

  Prands(
      {this.manufacturerId,
      this.name,
      this.image,
      this.sortOrder,
      this.storeId,
      this.href});

  Prands.fromJson(Map<String, dynamic> json) {
    manufacturerId = json['manufacturer_id'];
    name = json['name'];
    image = json['image'];
    sortOrder = json['sort_order'];
    storeId = json['store_id'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['manufacturer_id'] = this.manufacturerId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['sort_order'] = this.sortOrder;
    data['store_id'] = this.storeId;
    data['href'] = this.href;
    return data;
  }
}
