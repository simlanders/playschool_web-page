import 'package:flutter/material.dart';

import '../Widgets/TabWidget.dart';

import 'package:swipe_image_gallery/swipe_image_gallery.dart';

class D_Home extends StatefulWidget {
  int Index = 0;

  @override
  State<D_Home> createState() => D_HomeState();
}

class D_HomeState extends State<D_Home> {
  //const D_Home({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Width = MediaQuery.of(context).size.width;
    final Height = MediaQuery.of(context).size.height;

    final heroProperties = [
      ImageGalleryHeroProperties(tag: 'imageId1'),
      ImageGalleryHeroProperties(tag: 'imageId2'),
    ];

    final assets = [
      Image.network(
          'https://firebasestorage.googleapis.com/v0/b/playschool-fae76.appspot.com/o/homePics%2Ffat_brick.png.png?alt=media&token=b62dc914-4f1f-4e43-b79a-827033a488cc'),
      Image.network(
          'https://firebasestorage.googleapis.com/v0/b/playschool-fae76.appspot.com/o/homePics%2Fpicture_of_school_2.png?alt=media&token=3bb25a3f-2110-4c7e-9df1-d4a6203d11c5'),
    ];

    final _leftcontainerKey = GlobalKey();
    var h = ((Height - 85) - 43);
    var w = (Width / 3);
    return Container(
        width: Width,
        height: Height,
        child: Column(
          children: [
            TabWidget(),
            Container(
                width: Width,
                height: Height - 85,
                color: Colors.yellow,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Scenes From Around Playschool',
                          style: TextStyle(
                              fontSize: 35,
                              color: Colors.tealAccent,
                              decoration: TextDecoration.none)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: w,
                            height: h,
                            color: Colors.blue,
                            key: _leftcontainerKey,
                            child: Container(
                              width: w,
                              height: h,
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: (() => {
                                              setState(() {
                                                if (widget.Index >= 1) {
                                                  widget.Index =
                                                      widget.Index - 1;
                                                } else {
                                                  widget.Index = 0;
                                                }
                                              }),
                                            }),
                                        child:
                                            Icon(Icons.arrow_back, size: w / 5),
                                      ),
                                      Text(
                                        'Click Arrows To Change Picture',
                                        style: TextStyle(
                                            fontSize: w / 40,
                                            decoration: TextDecoration.none),
                                      ),
                                      GestureDetector(
                                        onTap: (() => {
                                              setState(() {
                                                if (widget.Index <
                                                    assets.length - 1) {
                                                  widget.Index =
                                                      widget.Index + 1;
                                                } else {
                                                  widget.Index =
                                                      assets.length - 1;
                                                }
                                              }),
                                            }),
                                        child: Icon(Icons.arrow_forward,
                                            size: w / 5),
                                      ),
                                    ],
                                  ),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      padding: const EdgeInsets.all(8),
                                      itemCount: assets.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return GestureDetector(
                                          onTap: (() => {
                                                setState(() {
                                                  widget.Index = index;
                                                }),
                                              }),
                                          child: SizedBox(
                                            width: w / 2,
                                            height: h / 4,
                                            child: assets[index],
                                          ),
                                        );
                                      }),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: (w * 2),
                            height: h,
                            color: Colors.redAccent,
                            child: assets[widget.Index],
                          ),
                        ],
                      ),
                    ]))
          ],
        ));
  }
}
