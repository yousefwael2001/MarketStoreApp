// import 'package:get/get.dart';
// import 'package:markat_store/controllers/note_db_controller.dart';

// import '../models/product.dart';

// // Observer مراقب
// // يعمل انبعاث للحدث

// class NoteGetxController extends GetxController {
//   // لعمله عنصر تفاعلي مشع
//   RxList<Products> products = <Products>[].obs;
//   // لتحديث اوبجكت معين
//   RxString name = ''.obs;
//   final ProductDbController _noteDbController = ProductDbController();

//   static NoteGetxController get to => Get.find();

//   @override
//   void onInit() {
//     read();
//     super.onInit();
//   }

//   Future<bool> create({required Products note}) async {
//     int newRowId = await _noteDbController.create(note);
//     if (newRowId != 0) {
//       newRowId = note.id!;
//       products.add(note);
//       name.refresh();
//     }
//     print(newRowId);
//     return newRowId != 0;
//   }

//   Future<void> read() async {
//     products.value = await _noteDbController.read();
//     print('products ${products.length}');
//   }

//   Future<bool> updateNote({required Products note}) async {
//     bool updated = await _noteDbController.update(note);
//     if (updated) {
//       int index = products.indexWhere((element) => element.id == note.id);
//       if (index != 0) {
//         products[index] = note;
//       }
//     }
//     return updated;
//   }

//   Future<bool> delete({required int id}) async {
//     bool deleted = await _noteDbController.delete(id);
//     if (deleted) {
//       products.removeWhere((element) => element.id == id);
//       update();
//     }
//     return deleted;
//   }
// }
