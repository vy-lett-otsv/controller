import 'dart:io';
import 'dart:ui';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:https/viewmodels/base_view_model.dart';
import 'package:https/views/widgets/image_load.dart';
import 'package:https/views/widgets/image_permission.dart';
import 'package:https/views/widgets/pick_file.dart';
import 'package:permission_handler/permission_handler.dart';

enum ImageSection {
  noStoragePermission,
  noStoragePermissionPermanent,
  browseFiles,
  imageLoaded,
}

class PermissionViewModel extends BaseViewModel {
  ImageSection _imageSection = ImageSection.browseFiles;

  ImageSection get imageSection => _imageSection;

  set imageSection(ImageSection value) {
    if (value != _imageSection) {
      _imageSection = value;
      updateUI();
    }
  }

  File? file;

  Future<bool> requestFilePermission() async {
    PermissionStatus result = await Permission.storage.request();
    if (result.isGranted) {
      imageSection = ImageSection.browseFiles;
      return true;
    } else if (result.isPermanentlyDenied){
      imageSection = ImageSection.noStoragePermissionPermanent;
    } else {
    imageSection = ImageSection.noStoragePermission;
    }
    return false;
  }

  Future<void> pickFile() async {
    final FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null &&
        result.files.isNotEmpty &&
        result.files.single.path != null) {
      file = File(result.files.single.path!);
      imageSection = ImageSection.imageLoaded;
    }
  }

  // bool _detectPermission = false;
  //
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   if (state == AppLifecycleState.resumed &&
  //       _detectPermission &&
  //       (imageSection == ImageSection.noStoragePermissionPermanent)) {
  //     _detectPermission = false;
  //     requestFilePermission();
  //   } else if (state == AppLifecycleState.paused &&
  //       imageSection == ImageSection.noStoragePermissionPermanent) {
  //     _detectPermission = true;
  //   }
  // }

  Future<void> checkPermissionsAndPick() async {
    final hasFilePermission = await requestFilePermission();
    if (hasFilePermission) {
      try {
        await pickFile();
        print("Hi");
      } on Exception catch (e) {
        print(e);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('An error occurred when picking a file')));
      }
    }
  }
}
