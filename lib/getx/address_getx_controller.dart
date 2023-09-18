import 'package:get/get.dart';
import 'package:markat_store/Api/best_seller.dart';
import 'package:markat_store/Api/category.dart';
import 'package:markat_store/Api/customer.dart';
import 'package:markat_store/Api/last_product.dart';
import 'package:markat_store/Api/makeup_product.dart';
import 'package:markat_store/Api/perfumes_product.dart';
import 'package:markat_store/Api/prands.dart';
import 'package:markat_store/Api/product.dart';
import 'package:markat_store/Api/sale_products.dart';
import 'package:markat_store/Api/wishlist_product.dart';
import 'package:markat_store/models/prands.dart';

import '../Api/country.dart';
import '../Api/customer_address.dart';
import '../Api/region.dart';
import '../models/Category.dart';
import '../models/country.dart';
import '../models/customer.dart';
import '../models/customer_address.dart';
import '../models/product.dart';
import '../models/wishlist_product.dart';
import '../models/zones.dart';

// Observer مراقب
// يعمل انبعاث للحدث

class CategoriesGetxController extends GetxController {
  // لعمله عنصر تفاعلي مشع
  RxList<Category> categories = <Category>[].obs;
  RxList<Country> country = <Country>[].obs;
  RxList<Zones> zones = <Zones>[].obs;
  RxList<Products> products = <Products>[].obs;
  RxList<Products> makeUpProducts = <Products>[].obs;
  RxList<Products> perfumesProducts = <Products>[].obs;
  RxList<Products> lastProducts = <Products>[].obs;
  RxList<Products> saleProducts = <Products>[].obs;
  RxList<Products> bestSellerProducts = <Products>[].obs;
  RxList<Prands> prands = <Prands>[].obs;
  RxList<CustomerWishlist> wishlistProducts = <CustomerWishlist>[].obs;
  RxList<Customer> customer = <Customer>[].obs;
  RxList<CustomerAddresses> customerAddress = <CustomerAddresses>[].obs;

  static CategoriesGetxController get to => Get.find();
  var isLoadingCategory = true.obs;
  var isLoadingCountry = true.obs;
  var isLoadingZones = true.obs;
  var isLoadingProducts = true.obs;
  var isLoadingMakeUpProducts = true.obs;
  var isLoadingperfumesProducts = true.obs;
  var isLoadingLastProducts = true.obs;
  var isLoadingSaleProducts = true.obs;
  var isLoadingBestSellerProducts = true.obs;
  var isLoadingPrands = true.obs;
  var isLoadingWishList = true.obs;
  var isLoadingCustomer = true.obs;
  var isLoadingCustomerAddress = true.obs;

  @override
  void onInit() {
    read();
    super.onInit();
  }

  Future<void> read() async {
    try {
      isLoadingCategory(true);
      categories.value = await CategoryController().getCategory();
    } finally {
      isLoadingCategory(false);
    }
    try {
      isLoadingCountry(true);
      country.value = await ApiCountryController().getCountries();
    } finally {
      isLoadingCountry(false);
    }
    try {
      isLoadingZones(true);
      zones.value = await ApiRegionController().getRegion();
    } finally {
      isLoadingZones(false);
    }
    try {
      isLoadingProducts(true);
      products.value = await ProductController().getProduct();
    } finally {
      isLoadingProducts(false);
    }
    try {
      isLoadingMakeUpProducts(true);
      makeUpProducts.value = await MakeUpProductController().getMakeUpProduct();
    } finally {
      isLoadingMakeUpProducts(false);
    }
    try {
      isLoadingperfumesProducts(true);
      perfumesProducts.value =
          await PerfumesProductController().gePerfumesProduct();
    } finally {
      isLoadingperfumesProducts(false);
    }
    try {
      isLoadingLastProducts(true);
      lastProducts.value = await LastProductController().getLastProduct();
    } finally {
      isLoadingLastProducts(false);
    }
    try {
      isLoadingSaleProducts(true);
      saleProducts.value = await SaleProductController().getSaleProduct();
    } finally {
      isLoadingSaleProducts(false);
    }
    try {
      isLoadingBestSellerProducts(true);
      bestSellerProducts.value =
          await BestSellerProductController().getBestSellerProduct();
    } finally {
      isLoadingBestSellerProducts(false);
    }
    try {
      isLoadingPrands(true);
      prands.value = await PrandsController().getPrands();
    } finally {
      isLoadingPrands(false);
    }
    try {
      isLoadingWishList(true);
      wishlistProducts.value = await ApiWishListProductController()
          .getWishListProductByCustomerId("1");
    } finally {
      isLoadingWishList(false);
    }
    try {
      isLoadingCustomer(true);
      customer.value = await customerController().getCustomerData("1");
    } finally {
      isLoadingCustomer(false);
    }
    try {
      isLoadingCustomerAddress(true);
      customerAddress.value =
          await CustomerAddressController().getCustomerAddress();
    } finally {
      isLoadingCustomerAddress(false);
    }
  }

  deleteWishProduct(String product_id) async {
    var index = wishlistProducts
        .removeWhere((element) => element.productId == product_id);
    update();
  }

  deleteAddress(String address_id) async {
    var index = customerAddress
        .removeWhere((element) => element.addressId == address_id);
    update();
  }

  addtoWishProduct(String product_id) async {
    CustomerWishlist wishlist = CustomerWishlist();
    wishlist.productId = product_id;
    wishlist.customerId = "1";
    wishlist.dateAdded = DateTime.now().toString();
    var index = wishlistProducts.add(wishlist);
    update();
  }
}
