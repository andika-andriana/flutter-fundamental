import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final box = GetStorage();

class PageDependency extends GetxController {
  Map<String, dynamic> person1 = {
    "name": "Person 1",
    "age": 20,
  };
  Map<String, dynamic> person2 = {
    "name": "Person 1",
    "age": 30,
  };

  RxBool isBackgroundColorEnable = false.obs;

  @override
  void onInit() {
    if (box.read("isBackgroundColorEnable") != null) {
      isBackgroundColorEnable.value =
          box.read("isBackgroundColorEnable")["value"];
    }
    super.onInit();
  }

  onToogleBackgroundColor(bool newBool) {
    // ignore: avoid_print
    print('${box.read('isBackgroundColorEnable')}');

    isBackgroundColorEnable.value = newBool;

    if (isBackgroundColorEnable.isTrue) {
      box.write('isBackgroundColorEnable', {
        "value": true,
      });
    } else {
      box.remove('isBackgroundColorEnable');
    }
  }
}
