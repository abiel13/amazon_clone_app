import 'dart:io';

import 'package:amazon_clone/constants/utils.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';

class AdminService {
  void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
  }) async {
    try {
      final cloudinary = CloudinaryPublic('dn6xjzxky', 'z4d57gxg');
      List<String> imgUrl = [];

      for (var i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(
            images[i].path,
            folder: name,
          ),
        );
        imgUrl.add(res.secureUrl);
      }
    } catch (e) {
      showSnackbar(
        context,
        e.toString(),
      );
    }
  }
}
