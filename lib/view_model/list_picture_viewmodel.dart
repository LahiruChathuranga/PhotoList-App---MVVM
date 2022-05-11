

import 'package:sample_mvvm/model/picsum_model.dart';
import 'package:flutter/services.dart';
import 'package:sample_mvvm/services/services.dart';

class ListPictureViewModel {
  List<PictureViewModel>? pictures;

  Future<void> fetchPictures() async {
    final apiResult = await Services().fetchPicturesAPI();
    pictures = apiResult.map((e) => PictureViewModel(e)).toList();
  }
}

class PictureViewModel {
  final PicSumModel? picSumModel;

  PictureViewModel(this.picSumModel);
}