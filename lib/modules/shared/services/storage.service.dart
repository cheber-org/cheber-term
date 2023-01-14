import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  final _box = GetStorage();

  Future<void> write(String key, dynamic payload) async {
    await _box.write(key, payload);
  }

  Future<dynamic>? read(String key) async {
    return _box.read(key);
  }
}
