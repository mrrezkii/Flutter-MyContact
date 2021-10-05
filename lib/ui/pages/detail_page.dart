import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_contact/provider/star_provider.dart';
import 'package:my_contact/provider/user_provider.dart';
import 'package:my_contact/shared/theme.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  static const routeDetailPage = '/detail-page';
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as int;
    final user = Provider.of<UserProvider>(context).getUser(id);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: SvgPicture.asset('assets/vector/ic_back.svg'),
                    ),
                  ),
                  InkWell(onTap: () {
                    context.read<StarProvider>().changeFavourite();
                  }, child:

                          /// FAB CONTROLLER
                          Consumer<StarProvider>(
                    builder: (context, starProv, child) {
                      return starFilled(starProv);
                    },
                  )
                      // starOutline()
                      )
                ],
              ),
              Container(
                width: double.infinity,
                height: 300,
                child: Image.network(
                  user.photo!,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(13, 24, 35, 24),
                child:

                    /// NAME CONTROLLER
                    nameDetail(user.name),
                //nameEdit()
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Color(0xFFE4E8F8),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    onTap: () {},
                    child: Column(
                      children: <Widget>[
                        SvgPicture.asset('assets/vector/ic_phone.svg'),
                        Text(
                          'Call',
                          style: blueTextFont,
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Column(
                      children: <Widget>[
                        SvgPicture.asset('assets/vector/ic_chat.svg'),
                        Text(
                          'Chat',
                          style: blueTextFont,
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Column(
                      children: <Widget>[
                        SvgPicture.asset('assets/vector/ic_video.svg'),
                        Text(
                          'Video',
                          style: blueTextFont,
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Color(0xFFE4E8F8),
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      'assets/vector/ic_phone.svg',
                      color: greyColor,
                    ),
                    SizedBox(
                      width: 22,
                    ),

                    /// NUMBER CONTROLLER
                    numberDetail(user.number),
                    //numberEdit(),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      'assets/vector/ic_location.svg',
                      color: greyColor,
                    ),
                    SizedBox(
                      width: 22,
                    ),

                    /// EMAIL CONTROLLER
                    emailDetail(user.address)
                    //emailEdit()
                  ],
                ),
              ),
              SizedBox(
                height: 81,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
          padding: const EdgeInsets.all(24.0),
          child:

              /// FAB CONTROLLER
              //fabAdd()
              fabEditContact()
          //     fabSave()
          ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget starOutline() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SvgPicture.asset('assets/vector/ic_star.svg'),
    );
  }

  Widget starFilled(StarProvider starProvider) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: starProvider.isFavourite
          ? SvgPicture.asset('assets/vector/ic_star_filled.svg')
          : SvgPicture.asset('assets/vector/ic_star.svg'),
    );
  }

  Widget nameDetail(String name) {
    return Text(
      name,
      style: blackTextFont.copyWith(fontSize: 25),
    );
  }

  Widget nameEdit() {
    return TextField(
      controller: nameController,
      style: blackTextFont.copyWith(fontSize: 25),
      decoration: InputDecoration(
          hintText: "Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          contentPadding: EdgeInsets.fromLTRB(12, 10, 0, 10),
          hintStyle: blackTextFont.copyWith(fontSize: 25)),
    );
  }

  Widget numberDetail(String number) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          number,
          style: blackTextFont,
        ),
        Text(
          'Mobile Number',
          style: blackLightTextFont,
        )
      ],
    );
  }

  Widget numberEdit() {
    return Container(
      width: 170,
      child: TextField(
        controller: numberController,
        style: blackTextFont,
        decoration: InputDecoration(
            hintText: "Mobile Number",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            contentPadding: EdgeInsets.only(left: 12),
            hintStyle: blackTextFont),
      ),
    );
  }

  Widget emailDetail(String? address) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          address!,
          style: blackTextFont,
        ),
        Text(
          'Address',
          style: blackLightTextFont,
        )
      ],
    );
  }

  Widget emailEdit() {
    return Container(
      width: 170,
      child: TextField(
        controller: emailController,
        style: blackTextFont,
        decoration: InputDecoration(
            hintText: "Address",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            contentPadding: EdgeInsets.only(left: 12),
            hintStyle: blackTextFont),
      ),
    );
  }

  Widget fabAdd() {
    return FloatingActionButton(
      backgroundColor: pinkColor,
      child: Icon(Icons.add),
      onPressed: () {},
    );
  }

  Widget fabEditContact() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: FloatingActionButton.extended(
        backgroundColor: pinkColor,
        icon: SvgPicture.asset('assets/vector/ic_edit.svg'),
        onPressed: () {},
        label: Text('Edit Contact'),
      ),
    );
  }

  Widget fabSave() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: FloatingActionButton.extended(
        backgroundColor: blueColor,
        icon: Icon(Icons.save),
        onPressed: () {},
        label: Text('Save'),
      ),
    );
  }
}
