import 'package:flutter/material.dart';
import 'package:playschool/Global_Classes.dart/Database.dart';

import '../../Global_Widgets.dart/Loading.dart';
import '../../Global_Widgets.dart/Photo_Blueprint.dart';
import '../Widgets/TabWidget.dart';

import 'package:swipe_image_gallery/swipe_image_gallery.dart';

class D_Home extends StatefulWidget {
  int Index = 0;

  @override
  State<D_Home> createState() => D_HomeState();
}

class D_HomeState extends State<D_Home> {
  //const D_Home({Key? key}) : super(key: key);

  // This widget is the root of your application.\
  final db = DatabaseService();

  List assets = [];
  List d = [];
  late ScrollController _scrollController;

  @override
  initState() {
    super.initState();
    _scrollController = new ScrollController(
      // NEW
      initialScrollOffset: 0.0, // NEW
      keepScrollOffset: true, // NEW
    );
  }

  @override
  Widget build(BuildContext context) {
    final Width = MediaQuery.of(context).size.width;
    final Height = MediaQuery.of(context).size.height;

    final _leftcontainerKey = GlobalKey();
    var h = ((Height - 85) - 43);
    var w = (Width / 3);

    return StreamBuilder<List<Photo_Blueprint>>(
        stream: db.staff_photos,
        builder: (BuildContext context,
            AsyncSnapshot<List<Photo_Blueprint>> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("An error has occured!"),
            );
          } else if (snapshot.hasData) {
            var photos = snapshot.data ?? [];
            List assets = [];
            for (var element in photos) {
              assets.add(Image.network(element.photo_url));
            }
            return assets.isEmpty
                ? const Center(child: Text("NO Post"))
                : Container(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: w,
                                        height: h,
                                        color: Colors.blue,
                                        key: _leftcontainerKey,
                                        child: Container(
                                          width: w,
                                          height: h - 128,
                                          child: Column(
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  GestureDetector(
                                                    onTap: (() => {
                                                          setState(() {
                                                            if (widget.Index >=
                                                                1) {
                                                              widget.Index =
                                                                  widget.Index -
                                                                      1;
                                                            } else {
                                                              widget.Index =
                                                                  assets.length -
                                                                      1;
                                                            }
                                                          }),
                                                        }),
                                                    child: Icon(
                                                        Icons.arrow_back,
                                                        size: w / 5),
                                                  ),
                                                  Text(
                                                    'Click Arrows To Change Picture',
                                                    style: TextStyle(
                                                        fontSize: w / 40,
                                                        decoration:
                                                            TextDecoration
                                                                .none),
                                                  ),
                                                  GestureDetector(
                                                    onTap: (() => {
                                                          setState(() {
                                                            if (widget.Index <
                                                                assets.length -
                                                                    1) {
                                                              widget.Index =
                                                                  widget.Index +
                                                                      1;
                                                            } else {
                                                              widget.Index = 0;
                                                            }
                                                          }),
                                                        }),
                                                    child: Icon(
                                                        Icons.arrow_forward,
                                                        size: w / 5),
                                                  ),
                                                ],
                                              ),
                                              Expanded(
                                                child: ListView.builder(
                                                    shrinkWrap: false,
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    controller:
                                                        _scrollController,
                                                    itemCount: assets.length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return GestureDetector(
                                                        onTap: (() => {
                                                              setState(() {
                                                                widget.Index =
                                                                    index;
                                                                _toEnd(index);
                                                              }),
                                                            }),
                                                        child: SizedBox(
                                                          width: w / 2,
                                                          height: h / 4,
                                                          child: assets[index],
                                                        ),
                                                      );
                                                    }),
                                              ),
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
          return Loading();
        });
  }

  void _toEnd(i) {
    print('I ran');
    // NEW
    _scrollController.position.moveTo(
        // NEW
        _scrollController.position.maxScrollExtent); // NEW
  }
  @override
  void dispose() {
    
    super.dispose();
  }
}
