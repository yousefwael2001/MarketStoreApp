import 'Sub_Category.dart';

class Category {
  String? categoryId;
  String? languageId;
  String? name;
  String? description;
  String? metaTitle;
  String? metaDescription;
  String? metaKeyword;
  String? image;
  List<SubCategory>? children;
  String? storeId;
  String? parentId;
  String? top;
  String? sortOrder;
  String? status;
  String? dateAdded;
  String? dateModified;
  String? href;

  Category(
      {this.categoryId,
      this.languageId,
      this.name,
      this.description,
      this.metaTitle,
      this.metaDescription,
      this.metaKeyword,
      this.image,
      this.children,
      this.storeId,
      this.parentId,
      this.top,
      this.sortOrder,
      this.status,
      this.dateAdded,
      this.dateModified,
      this.href});

  Category.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    languageId = json['language_id'];
    name = json['name'];
    description = json['description'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    metaKeyword = json['meta_keyword'];
    image = json['image'];
    if (json['children'] != null) {
      children = <SubCategory>[];
      json['children'].forEach((v) {
        children!.add(new SubCategory.fromJson(v));
      });
    }
    storeId = json['store_id'];
    parentId = json['parent_id'];
    top = json['top'];
    sortOrder = json['sort_order'];
    status = json['status'];
    dateAdded = json['date_added'];
    dateModified = json['date_modified'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['language_id'] = this.languageId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['meta_title'] = this.metaTitle;
    data['meta_description'] = this.metaDescription;
    data['meta_keyword'] = this.metaKeyword;
    data['image'] = this.image;
    if (this.children != null) {
      data['children'] = this.children!.map((v) => v.toJson()).toList();
    }
    data['store_id'] = this.storeId;
    data['parent_id'] = this.parentId;
    data['top'] = this.top;
    data['sort_order'] = this.sortOrder;
    data['status'] = this.status;
    data['date_added'] = this.dateAdded;
    data['date_modified'] = this.dateModified;
    data['href'] = this.href;
    return data;
  }
}
