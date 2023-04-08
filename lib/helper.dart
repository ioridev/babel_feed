import 'package:flutter_easyloading/flutter_easyloading.dart';

Future<void> showProgress(String message) async {
  await EasyLoading.show(status: message);
}

Future<void> updateProgress(String message, double progress) async {
  await EasyLoading.showProgress(progress, status: message);
}

Future<void> hideProgress() async {
  await EasyLoading.dismiss();
}
