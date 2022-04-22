import 'package:badmintop/model/gor.dart';
import 'package:badmintop/model/user.dart';
import 'package:badmintop/ui/widget/savebutton_widget.dart';
import 'package:badmintop/ui/widget/showtoast_widget.dart';
import 'package:badmintop/view_model/gor_view_model.dart';
import 'package:flutter/material.dart';
import 'package:badmintop/ui/theme/theme.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10.0)),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            blueColorFirst,
            blueColorSecond,
          ],
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/logo.png', height: 20.0,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                        'Selamat Datang,',
                        style: h2HeaderStyle,
                    ),
                    Text(
                        user.name! + '!',
                        style: h1HeaderStyle,
                    ),
                  ],
                ),
                InkWell(
                  onTap: () => showToast(context, "Detail User tidak tersedia pada versi demo"),
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/user.png'),
                    radius: 30.0,
                  ),
                ),
              ]
            ),
          ),
        ],
      ),
    );
  }
}

class ExploreHeaderWidget extends StatelessWidget {
  const ExploreHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10.0)),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            blueColorFirst,
            blueColorSecond,
          ],
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/logo.png', height: 20.0,),
              InkWell(
                onTap: () => showToast(context, "Riwayat booking tidak tersedia pada versi demo"),
                child: const Icon(
                  Icons.description_outlined,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Explore',
                  style: h1HeaderStyle,
                ),
                Text(
                  'Booking gor badminton terbaik pilihan kami',
                  style: h3HeaderStyle,
                )
              ],
            )
          ),
        ],
      ),
    );
  }
}

class SaveHeaderWidget extends StatelessWidget {
  const SaveHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10.0)),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            blueColorFirst,
            blueColorSecond,
          ],
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/logo.png', height: 20.0,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Simpan',
                  style: h1HeaderStyle,
                ),
                Text(
                  'Jangan disimpan aja, yuk booking gornya!',
                  style: h3HeaderStyle,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DetailHeaderWidget extends StatelessWidget {
  const DetailHeaderWidget({ Key? key, required this.gorViewModel }) : super(key: key);

  final GorViewModel gorViewModel;

  @override
  Widget build(BuildContext context) {
    final Gor gor = gorViewModel.gorSelected;
    return Column(
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
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                gor.name!,
                style: h1ItemStyle,
              ),
              const SizedBox(
                height: 8.0, 
              ),
              Row(
                children: [
                  Text(
                    gor.rating!.toString(),
                    style: itemContentStyle,
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  SaveButtonWidget(gorViewModel: gorViewModel),
                ],
              ),
            ],
          ),
        ),
      ],  
    );
  }
}