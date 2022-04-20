import 'package:badmintop/ui/theme/theme.dart';
import 'package:badmintop/view_model/gor_view_model.dart';
import 'package:flutter/material.dart';
import 'package:badmintop/model/gor.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GorViewModel gorViewModel = context.watch<GorViewModel>();
    final Gor gor = gorViewModel.gorSelected;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: blueColorFirst,
    ));

    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Image(
                      image: NetworkImage(gor.images![0]),
                      fit: BoxFit.cover, //fill type of image inside aspectRatio
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          gor.name!,
                          style: h1ItemStyle,
                        ),
                        SizedBox(
                          height: 8.0, 
                        ),
                        Row(
                          children: [
                            Text(
                              gor.rating!.toString(),
                              style: itemContentStyle,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            SaveButtonWidget(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      border: Border.symmetric(horizontal: BorderSide(color: Colors.black12))
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: blueColorThird,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Expanded(
                              child: Text(
                                gor.address!,
                                overflow: TextOverflow.clip,
                                style: itemContentStyle,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.call,
                              color: blueColorThird,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Expanded(
                              child: Text(
                                gor.call!,
                                overflow: TextOverflow.clip,
                                style: itemContentStyle,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        SizedBox(
                          child: ExpansionTile(
                            leading: Icon(Icons.access_time),
                            tilePadding: EdgeInsets.all(0),
                            iconColor: Colors.grey,
                            collapsedIconColor: blueColorThird,
                            childrenPadding: EdgeInsets.only(left: 20.0),
                            title: Text(
                              "Buka",
                              style: itemContentStyle,
                            ),
                            children: gor.open!.map((e) => Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                e,
                                style: itemContentStyle,
                              ),
                            )).toList()
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  GorImagesList(gorImages: gor.images!),
                  SizedBox(
                    height:100,
                  ),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height - 100,
              width: MediaQuery.of(context).size.width,
              left: 0,
              height:100,
              // width: ,
              child: Card(
                elevation: 10,
                margin: EdgeInsets.all(0),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Rp10.000",
                            style: h1ItemStyle,
                          ),
                          Text(
                            "per jam lapangan",
                            style: itemContentStyle,
                          )
                        ],
                      ),
                      Card(
                        margin: EdgeInsets.all(0),
                        color: blueColorFirst,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Booking Sekarang",
                            style: h3HeaderStyle,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ),
            ),
          ]
        ),
      ),
    );
  }
}

class SaveButtonWidget extends StatefulWidget {
  const SaveButtonWidget({ Key? key }) : super(key: key);


  @override
  _SaveButtonWidgetState createState() => _SaveButtonWidgetState();
}

class _SaveButtonWidgetState extends State<SaveButtonWidget> {
  
  @override
  Widget build(BuildContext context) {
    GorViewModel gorViewModel = context.watch<GorViewModel>();
    
    return InkWell(
      onTap: (() => setState(() => gorViewModel.pressedSaveGor())),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          border: gorViewModel.gorSelected.isSave! ? null : Border.all(
            color: blueColorThird,
            width: 1.5
          ),
          color: gorViewModel.gorSelected.isSave! ? blueColorFirst : null,
          borderRadius: BorderRadius.all(
            Radius.circular(20)
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.bookmark_add_outlined,
              color: gorViewModel.gorSelected.isSave! ? Colors.white : blueColorFirst,
            ),
            Text(
              gorViewModel.gorSelected.isSave! ? "Disimpan" : "Simpan",
              style: gorViewModel.gorSelected.isSave! ? h3HeaderStyle : itemContentStyle,
            )
          ],
        ),
      ),
    );
  }
}

class GorImagesList extends StatelessWidget {
  const GorImagesList({ Key? key, required this.gorImages }) : super(key: key);

  final List<String> gorImages;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Foto",
            style: h1ItemStyle,
          ),
          SizedBox(
            height: 150.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: gorImages.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      gorImages[index],
                      fit: BoxFit.fill,
                      width: 200.0,
                    ),
                  ),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}