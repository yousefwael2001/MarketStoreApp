class Products {
  String? productId;
  String? name;
  String? description;
  String? metaTitle;
  String? metaDescription;
  String? metaKeyword;
  String? tag;
  String? model;
  String? sku;
  String? upc;
  String? ean;
  String? jan;
  String? isbn;
  String? mpn;
  String? location;
  String? quantity;
  String? stockStatus;
  String? manufacturerId;
  String? manufacturer;
  String? reward;
  String? points;
  String? taxClassId;
  String? dateAvailable;
  String? weight;
  String? weightClassId;
  String? length;
  String? width;
  String? height;
  String? lengthClassId;
  String? subtract;
  int? rating;
  int? reviews;
  String? thumb;
  String? price;
  // String? special;
  String? tax;
  String? minimum;
  // List<String>? options;
  // List<String>? attributes;
  String? sortOrder;
  String? status;
  String? storeId;
  String? dateAdded;
  String? dateModified;
  String? href;

  Products(
      {this.productId,
      this.name,
      this.description,
      this.metaTitle,
      this.metaDescription,
      this.metaKeyword,
      this.tag,
      this.model,
      this.sku,
      this.upc,
      this.ean,
      this.jan,
      this.isbn,
      this.mpn,
      this.location,
      this.quantity,
      this.stockStatus,
      this.manufacturerId,
      this.manufacturer,
      this.reward,
      this.points,
      this.taxClassId,
      this.dateAvailable,
      this.weight,
      this.weightClassId,
      this.length,
      this.width,
      this.height,
      this.lengthClassId,
      this.subtract,
      this.rating,
      this.reviews,
      this.thumb,
      this.price,
      // this.special,
      this.tax,
      this.minimum,
      // this.options,
      // this.attributes,
      this.sortOrder,
      this.status,
      this.storeId,
      this.dateAdded,
      this.dateModified,
      this.href});

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    name = json['name'];
    description = json['description'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    metaKeyword = json['meta_keyword'];
    tag = json['tag'];
    model = json['model'];
    sku = json['sku'];
    upc = json['upc'];
    ean = json['ean'];
    jan = json['jan'];
    isbn = json['isbn'];
    mpn = json['mpn'];
    location = json['location'];
    quantity = json['quantity'];
    stockStatus = json['stock_status'];
    manufacturerId = json['manufacturer_id'];
    manufacturer = json['manufacturer'];
    reward = json['reward'];
    points = json['points'];
    taxClassId = json['tax_class_id'];
    dateAvailable = json['date_available'];
    weight = json['weight'];
    weightClassId = json['weight_class_id'];
    length = json['length'];
    width = json['width'];
    height = json['height'];
    lengthClassId = json['length_class_id'];
    subtract = json['subtract'];
    rating = json['rating'];
    reviews = json['reviews'];
    thumb = json['thumb'];
    price = json['price'];
    // special = json['special'].toString() != "false" ? "true" : "false";
    tax = json['tax'];
    minimum = json['minimum'];
    // if (json['options'] != String) {
    //   options = <String>[];
    //   json['options'].forEach((v) {
    //     options!.add(new String.fromJson(v));
    //   });
    // }
    // if (json['attributes'] != String) {
    //   attributes = <String>[];
    //   json['attributes'].forEach((v) {
    //     attributes!.add(new String.fromJson(v));
    //   });
    // }
    sortOrder = json['sort_order'];
    status = json['status'];
    storeId = json['store_id'];
    dateAdded = json['date_added'];
    dateModified = json['date_modified'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['meta_title'] = this.metaTitle;
    data['meta_description'] = this.metaDescription;
    data['meta_keyword'] = this.metaKeyword;
    data['tag'] = this.tag;
    data['model'] = this.model;
    data['sku'] = this.sku;
    data['upc'] = this.upc;
    data['ean'] = this.ean;
    data['jan'] = this.jan;
    data['isbn'] = this.isbn;
    data['mpn'] = this.mpn;
    data['location'] = this.location;
    data['quantity'] = this.quantity;
    data['stock_status'] = this.stockStatus;
    data['manufacturer_id'] = this.manufacturerId;
    data['manufacturer'] = this.manufacturer;
    data['reward'] = this.reward;
    data['points'] = this.points;
    data['tax_class_id'] = this.taxClassId;
    data['date_available'] = this.dateAvailable;
    data['weight'] = this.weight;
    data['weight_class_id'] = this.weightClassId;
    data['length'] = this.length;
    data['width'] = this.width;
    data['height'] = this.height;
    data['length_class_id'] = this.lengthClassId;
    data['subtract'] = this.subtract;
    data['rating'] = this.rating;
    data['reviews'] = this.reviews;
    data['thumb'] = this.thumb;
    data['price'] = this.price;
    // data['special'] = this.special;
    data['tax'] = this.tax;
    data['minimum'] = this.minimum;
    // if (this.options != String) {
    //   data['options'] = this.options!.map((v) => v.toJson()).toList();
    // }
    // if (this.attributes != String) {
    //   data['attributes'] = this.attributes!.map((v) => v.toJson()).toList();
    // }
    data['sort_order'] = this.sortOrder;
    data['status'] = this.status;
    data['store_id'] = this.storeId;
    data['date_added'] = this.dateAdded;
    data['date_modified'] = this.dateModified;
    data['href'] = this.href;
    return data;
  }
}
