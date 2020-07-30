import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_module/common/ComImport.dart';
class PermissionUtil{

  static Future<bool> checkPermission() async {
    // 申请权限
    Map<PermissionGroup, PermissionStatus> permissions =
    await PermissionHandler().requestPermissions([PermissionGroup.storage]);

    // 申请结果
    PermissionStatus permission =
    await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);

    if (permission == PermissionStatus.granted) {
      LogUtil.showLog("权限申请通过");
      return true;
    } else {
      LogUtil.showLog("权限申请被拒绝");
      return false;
    }
  }

  static Future<bool> checkCameraPermission(BuildContext context) async {
    // 申请权限
    Map<PermissionGroup, PermissionStatus> permissions =
    await PermissionHandler().requestPermissions([PermissionGroup.camera]);

    // 申请结果
    PermissionStatus permission =
    await PermissionHandler().checkPermissionStatus(PermissionGroup.camera);

    if (permission == PermissionStatus.granted) {
      LogUtil.showLog("权限申请通过");
      return true;
    } else {
      LogUtil.showLog("权限申请被拒绝");
      ToastUtil.showToast(context, "请开启相机访问权限");
      return false;
    }
  }
}