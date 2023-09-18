class Country {
  String? countryId;
  String? name;
  String? isoCode2;
  String? isoCode3;
  String? addressFormatId;
  String? postcodeRequired;
  String? status;

  Country(
      {this.countryId,
      this.name,
      this.isoCode2,
      this.isoCode3,
      this.addressFormatId,
      this.postcodeRequired,
      this.status});

  Country.fromJson(Map<String, dynamic> json) {
    countryId = json['country_id'];
    name = json['name'];
    isoCode2 = json['iso_code_2'];
    isoCode3 = json['iso_code_3'];
    addressFormatId = json['address_format_id'];
    postcodeRequired = json['postcode_required'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_id'] = this.countryId;
    data['name'] = this.name;
    data['iso_code_2'] = this.isoCode2;
    data['iso_code_3'] = this.isoCode3;
    data['address_format_id'] = this.addressFormatId;
    data['postcode_required'] = this.postcodeRequired;
    data['status'] = this.status;
    return data;
  }
}
