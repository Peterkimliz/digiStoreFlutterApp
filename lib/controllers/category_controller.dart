import 'package:digi_store/models/categories.dart';
import 'package:digi_store/services/category.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  RxBool loadingCategory = RxBool(false);
  RxList<Categories> categories = RxList([]);

  fetchCategories() async {
    try {
      loadingCategory.value = true;
      categories.clear();
      var response = await Category().getPaginatedCategories("0");
      if (response != null) {
        List list = response;
        List<Categories> data =
            list.map((e) => Categories.fromJson(e)).toList();
        categories.addAll(data);
      } else {
        categories.value = RxList([]);
      }

      loadingCategory.value = false;
    } catch (e) {
      loadingCategory.value = false;
      print("error is $e");
    }
  }

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }
}
