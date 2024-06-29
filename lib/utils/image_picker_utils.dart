import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kachpara/widgets/button.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:kachpara/l10n/extensions/localizations_extension.dart';

Future<XFile?> getImage(BuildContext context) async {
  final imagePicker = ImagePicker();

  return showDialog<XFile?>(
    context: context,
    builder: ((context) => AlertDialog(
          alignment: Alignment.center,
          title: Text(
            context.l10n.edit_product_page_pick_image_source,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          content: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ButtonWidget(
                  text: context.l10n.edit_product_page_gallery,
                  iconData: Icons.image,
                  options: const FFButtonOptions(borderRadius: 8),
                  onPressed: () => imagePicker.pickImage(source: ImageSource.gallery).then(
                        (file) => Navigator.pop(context, file),
                      ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ButtonWidget(
                  text: context.l10n.edit_product_page_camera,
                  iconData: Icons.camera,
                  options: const FFButtonOptions(borderRadius: 8),
                  onPressed: () => imagePicker.pickImage(source: ImageSource.camera).then(
                        (file) => Navigator.pop(context, file),
                      ),
                ),
              ],
            ),
          ),
        )),
  );
}
