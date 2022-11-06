import 'package:get/get.dart';

class TodoController extends GetxController {
  // var item = "";

  var tasks = [].obs;
  var isChecked = [].obs;

  void additem(String title) {
    tasks.add(title);
    isChecked.add(false);
  }

  void deleteitem(int index) {
    tasks.removeAt(index);
    isChecked.removeAt(index);
  }

  int count2do() {
    var checked = isChecked.where((item) => item == false).length;
    return checked;
  }

  void edititem(value, index) {
    tasks[index] = value;
  }
}
