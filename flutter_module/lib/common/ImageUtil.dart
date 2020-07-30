import 'package:image_picker/image_picker.dart';
import 'package:flutter_module/common/LogUtil.dart';
class ImageUtil{

  /*相册*/
  static Future<PickedFile> openGallery() async {
    ImagePicker _picker = ImagePicker();
    PickedFile _imageFile = await _picker.getImage(source: ImageSource.gallery);
    LogUtil.showLog("本地图片选择地址："+_imageFile.path);
    return _imageFile;
  }

  /*相机*/
  static Future<PickedFile> openCamera() async {
    ImagePicker _picker = ImagePicker();
    PickedFile _imageFile = await _picker.getImage(source: ImageSource.camera);
    LogUtil.showLog("相机图片地址："+_imageFile.path);
    return _imageFile;
  }
}