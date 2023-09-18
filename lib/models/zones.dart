class Zones {
  String? zoneId;
  String? countryId;
  String? name;
  String? code;
  String? status;
  String? isoCode2;
  String? isoCode3;
  String? addressFormatId;
  String? postcodeRequired;
  String? country;

  Zones(
      {this.zoneId,
      this.countryId,
      this.name,
      this.code,
      this.status,
      this.isoCode2,
      this.isoCode3,
      this.addressFormatId,
      this.postcodeRequired,
      this.country});

  Zones.fromJson(Map<String, dynamic> json) {
    zoneId = json['zone_id'];
    countryId = json['country_id'];
    name = json['name'];
    code = json['code'];
    status = json['status'];
    isoCode2 = json['iso_code_2'];
    isoCode3 = json['iso_code_3'];
    addressFormatId = json['address_format_id'];
    postcodeRequired = json['postcode_required'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['zone_id'] = this.zoneId;
    data['country_id'] = this.countryId;
    data['name'] = this.name;
    data['code'] = this.code;
    data['status'] = this.status;
    data['iso_code_2'] = this.isoCode2;
    data['iso_code_3'] = this.isoCode3;
    data['address_format_id'] = this.addressFormatId;
    data['postcode_required'] = this.postcodeRequired;
    data['country'] = this.country;
    return data;
  }
}
