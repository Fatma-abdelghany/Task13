import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shopify/utils/collections.dart';

import '../models/product.model.dart';

class ProductProvider {
  Future<List<Product>?> getProducts(BuildContext context, {int? limit}) async {
    try {
      QuerySnapshot<Map<String, dynamic>>? result;
      if (limit != null) {
        result = await FirebaseFirestore.instance
            .collection(CollectionsUtils.products.name)
            .limit(limit)
            .get();
      } else {
        result = await FirebaseFirestore.instance.collection(CollectionsUtils.products.name).get();
      }

      if (result.docs.isNotEmpty) {
        var productsList = List<Product>.from(
            result.docs.map((e) => Product.fromJson(e.data(), e.id))).toList();

        return productsList;
      } else {
        return [];
      }
    } catch (e) {
      if (!context.mounted) return null;
      await QuickAlert.show(
          context: context, type: QuickAlertType.error, title: e.toString());
      return null;
    }
  }
}