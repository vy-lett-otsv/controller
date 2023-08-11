import 'package:flutter/material.dart';
import 'package:https/viewmodels/permission_view_model.dart';
import 'package:https/views/widgets/image_load.dart';
import 'package:https/views/widgets/image_permission.dart';
import 'package:https/views/widgets/pick_file.dart';
import 'package:provider/provider.dart';
class PermissionView extends StatefulWidget {
  const PermissionView({Key? key}) : super(key: key);

  @override
  State<PermissionView> createState() => _PermissionViewState();
}

class _PermissionViewState extends State<PermissionView> with WidgetsBindingObserver{
  final PermissionViewModel _model = PermissionViewModel();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => _model,
      child: Consumer<PermissionViewModel>(
        builder: (_, viewModel, __) {
          Widget widget;
          switch (viewModel.imageSection) {
            case ImageSection.noStoragePermission:
              widget = ImagePermission(isPermanent: false, onPressed: viewModel.checkPermissionsAndPick);
              break;
            case ImageSection.noStoragePermissionPermanent:
              widget = ImagePermission(isPermanent: true, onPressed: viewModel.checkPermissionsAndPick);
              break;
            case ImageSection.browseFiles:widget = PickFile(onPressed: viewModel.checkPermissionsAndPick);
              break;
            case ImageSection.imageLoaded:widget = ImageLoaded(file: viewModel.file!);
              break;
          }
          return Scaffold(
            appBar: AppBar(
              title: const Text('Handle permissions'),
            ),
            body: widget,
          );
        },
      ),
    );
  }
}
