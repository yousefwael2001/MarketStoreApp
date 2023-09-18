class CustomerAddresses {
  String? addressId;
  String? customerId;
  String? firstname;
  String? lastname;
  String? company;
  String? address1;
  String? address2;
  String? city;
  String? postcode;
  String? countryId;
  String? zoneId;
  String? customField;

  CustomerAddresses(
      {this.addressId,
      this.customerId,
      this.firstname,
      this.lastname,
      this.company,
      this.address1,
      this.address2,
      this.city,
      this.postcode,
      this.countryId,
      this.zoneId,
      this.customField});

  CustomerAddresses.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    customerId = json['customer_id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    company = json['company'];
    address1 = json['address_1'];
    address2 = json['address_2'];
    city = json['city'];
    postcode = json['postcode'];
    countryId = json['country_id'];
    zoneId = json['zone_id'];
    customField = json['custom_field'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this.addressId;
    data['customer_id'] = this.customerId;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['company'] = this.company;
    data['address_1'] = this.address1;
    data['address_2'] = this.address2;
    data['city'] = this.city;
    data['postcode'] = this.postcode;
    data['country_id'] = this.countryId;
    data['zone_id'] = this.zoneId;
    data['custom_field'] = this.customField;
    return data;
  }
}
