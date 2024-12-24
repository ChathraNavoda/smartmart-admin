import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' hide Category;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartmartadmin/utility/snack_bar_helper.dart';

import '../../../models/category.dart';
import '../../models/api_response.dart';
import '../../models/brand.dart';
import '../../models/coupon.dart';
import '../../models/my_notification.dart';
import '../../models/order.dart';
import '../../models/poster.dart';
import '../../models/product.dart';
import '../../models/sub_category.dart';
import '../../models/variant.dart';
import '../../models/variant_type.dart';
import '../../services/http_services.dart';

class DataProvider extends ChangeNotifier {
  HttpService service = HttpService();

  List<Category> _allCategories = [];
  List<Category> _filteredCategories = [];
  List<Category> get categories => _filteredCategories;

  final List<SubCategory> _allSubCategories = [];
  final List<SubCategory> _filteredSubCategories = [];

  List<SubCategory> get subCategories => _filteredSubCategories;

  final List<Brand> _allBrands = [];
  final List<Brand> _filteredBrands = [];
  List<Brand> get brands => _filteredBrands;

  final List<VariantType> _allVariantTypes = [];
  final List<VariantType> _filteredVariantTypes = [];
  List<VariantType> get variantTypes => _filteredVariantTypes;

  final List<Variant> _allVariants = [];
  final List<Variant> _filteredVariants = [];
  List<Variant> get variants => _filteredVariants;

  final List<Product> _allProducts = [];
  final List<Product> _filteredProducts = [];
  List<Product> get products => _filteredProducts;

  final List<Coupon> _allCoupons = [];
  final List<Coupon> _filteredCoupons = [];
  List<Coupon> get coupons => _filteredCoupons;

  final List<Poster> _allPosters = [];
  final List<Poster> _filteredPosters = [];
  List<Poster> get posters => _filteredPosters;

  final List<Order> _allOrders = [];
  final List<Order> _filteredOrders = [];
  List<Order> get orders => _filteredOrders;

  final List<MyNotification> _allNotifications = [];
  final List<MyNotification> _filteredNotifications = [];
  List<MyNotification> get notifications => _filteredNotifications;

  DataProvider() {
    getAllCategory();
  }

  Future<List<Category>> getAllCategory({bool showSnack = false}) async {
    try {
      Response response = await service.getItems(endpointUrl: 'categories');
      if (response.isOk) {
        ApiResponse<List<Category>> apiResponse =
            ApiResponse<List<Category>>.fromJson(
          response.body,
          (json) =>
              (json as List).map((item) => Category.fromJson(item)).toList(),
        );
        _allCategories = apiResponse.data ?? [];
        _filteredCategories = List.from(_allCategories);
        notifyListeners();
        if (showSnack) SnackBarHelper.showErrorSnackBar(apiResponse.message);
      }
    } catch (e) {
      if (showSnack) SnackBarHelper.showErrorSnackBar(e.toString());
      rethrow;
    }
    return _filteredCategories;
  }

  void filterCategories(String keyword) {
    if (keyword.isEmpty) {
      _filteredCategories = List.from(_allCategories);
    } else {
      final lowerKeyword = keyword.toLowerCase();
      _filteredCategories = _allCategories.where((category) {
        return (category.name ?? '').toLowerCase().contains(lowerKeyword);
      }).toList();
    }

    //TODO: should complete getAllSubCategory

    //TODO: should complete filterSubCategories

    //TODO: should complete getAllBrands

    //TODO: should complete filterBrands

    //TODO: should complete getAllVariantType

    //TODO: should complete filterVariantTypes

    //TODO: should complete getAllVariant

    //TODO: should complete filterVariants

    //TODO: should complete getAllProduct

    //TODO: should complete filterProducts

    //TODO: should complete getAllCoupons

    //TODO: should complete filterCoupons

    //TODO: should complete getAllPosters

    //TODO: should complete filterPosters

    //TODO: should complete getAllNotifications

    //TODO: should complete filterNotifications

    //TODO: should complete getAllOrders

    //TODO: should complete filterOrders

    //TODO: should complete calculateOrdersWithStatus

    //TODO: should complete filterProductsByQuantity

    //TODO: should complete calculateProductWithQuantity
  }
}
