import 'package:file_picker/file_picker.dart';

class FilePickerService {
  Future<PlatformFile?> pickPdf() async {
    FilePickerResult? result = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      allowMultiple: false,
      withData: false,
    );


    if (result == null || result.files.isEmpty) {
      return null;
    }

    return result.files.single;


  }
}