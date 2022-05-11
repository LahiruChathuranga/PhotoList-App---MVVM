import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sample_mvvm/Utils/constant.dart';
import 'package:sample_mvvm/Utils/widget_functions.dart';
import 'package:sample_mvvm/model/picsum_model.dart';
import 'package:sample_mvvm/view/custom/BoarderBox.dart';
import 'package:sample_mvvm/view_model/list_picture_viewmodel.dart';

class  HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  final ListPictureViewModel viewModel = ListPictureViewModel();

  Future getPicsInfo() async {
    viewModel.fetchPictures();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPicsInfo();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    const double padding = 25;
    const sidePadding =  EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addVerticalSpace(padding),
              Padding(
                padding: sidePadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    BoaderBox(padding: EdgeInsets.all(10.0),
                        width: 50,
                        height: 50,
                        child: Icon(Icons.menu, color: COLOR_BLACK)),
                    BoaderBox(padding: EdgeInsets.all(10.0),
                        width: 50,
                        height: 50,
                        child: Icon(Icons.settings, color: COLOR_BLACK))
                  ],
                ),
              ),
              addVerticalSpace(padding),
              Expanded(
                child: Padding(
                  padding: sidePadding,
                  child: ListView.builder(
                      itemCount: viewModel.pictures?.length,
                      itemBuilder: (context,index){
                        return PicItem(itemData: viewModel.pictures?[index].picSumModel ?? PicSumModel());
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PicItem extends StatelessWidget {

  final PicSumModel itemData;

  const PicItem({Key? key, required this.itemData}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      height: 300,
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: CachedNetworkImage(
                    imageUrl: itemData.downloadUrl ?? "",
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        CircularProgressIndicator(value: downloadProgress.progress),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
              ),
            ],
          ),
          addVerticalSpace(15),
          Row(
            children: [
              Text("${itemData.author}",
                style: themeData.textTheme.headline1,)
            ],
          )
        ],
      ),
    );
  }
}
