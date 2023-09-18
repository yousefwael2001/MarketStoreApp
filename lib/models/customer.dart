class Customer {
  String? customerId;
  String? customerGroupId;
  String? storeId;
  String? languageId;
  String? firstname;
  String? lastname;
  String? email;
  String? telephone;
  String? newsletter;
  String? customField;
  String? ip;
  String? status;
  String? safe;
  String? token;
  String? code;
  String? dateAdded;

  Customer(
      {this.customerId,
      this.customerGroupId,
      this.storeId,
      this.languageId,
      this.firstname,
      this.lastname,
      this.email,
      this.telephone,
      this.newsletter,
      this.customField,
      this.ip,
      this.status,
      this.safe,
      this.token,
      this.code,
      this.dateAdded});

  Customer.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    customerGroupId = json['customer_group_id'];
    storeId = json['store_id'];
    languageId = json['language_id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    telephone = json['telephone'];
    newsletter = json['newsletter'];
    customField = json['custom_field'];
    ip = json['ip'];
    status = json['status'];
    safe = json['safe'];
    token = json['token'];
    code = json['code'];
    dateAdded = json['date_added'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_id'] = this.customerId;
    data['customer_group_id'] = this.customerGroupId;
    data['store_id'] = this.storeId;
    data['language_id'] = this.languageId;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['email'] = this.email;
    data['telephone'] = this.telephone;
    data['newsletter'] = this.newsletter;
    data['custom_field'] = this.customField;
    data['ip'] = this.ip;
    data['status'] = this.status;
    data['safe'] = this.safe;
    data['token'] = this.token;
    data['code'] = this.code;
    data['date_added'] = this.dateAdded;
    return data;
  }
}
