import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PickFile extends StatelessWidget {
  final VoidCallback onPressed;

  const PickFile({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: onPressed,
          child: const Text('Pick file'),
        ),
        ElevatedButton(
          onPressed: () async {
            Map<Permission, PermissionStatus> status = await [
              Permission.camera,
              Permission.microphone,
              Permission.storage
            ].request();

            // if(status[Permission.location].isDenied){ //check each permission status after.
            //   print("Location permission is denied.");
            // }
          },
          child: const Text('Request Multiple Permission'),
        )
      ],
    );
  }
}
