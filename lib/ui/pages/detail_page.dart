import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_contact/model/user.dart';
import 'package:my_contact/provider/behavior_provider.dart';
import 'package:my_contact/provider/user_provider.dart';
import 'package:my_contact/shared/photo.dart';
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
    var user;
    var id = ModalRoute.of(context)?.settings.arguments as String?;
    if (id != null) {
      user = Provider.of<UserProvider>(context).getUser(id);
    } else {
      user = User();
    }

    return Scaffold(
      body: Consumer2<BehaviorProvider, UserProvider>(
        builder: (context, behaviorProvider, userProvider, _) => SafeArea(
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
                    InkWell(
                      onTap: () {
                        userProvider.editPriority(user);
                      },
                      child: (id == null)
                          ? Container()
                          : Consumer<UserProvider>(
                              builder: (context, userProvider, child) {
                                return starFilled(userProvider, user);
                              },
                            ),
                      // starOutline()
                    )
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 300,
                  child: Image.network(
                    (user.photo) ?? User.emptyPhoto,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(13, 24, 35, 24),
                  child: (behaviorProvider.getCondition == behavior.detailData)
                      ? nameDetail(user.name)
                      : (behaviorProvider.getCondition == behavior.editData)
                          ? nameEdit(user.name)
                          : nameEdit(''),
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
                      (behaviorProvider.getCondition == behavior.detailData)
                          ? numberDetail(user.number)
                          : (behaviorProvider.getCondition == behavior.editData)
                              ? numberEdit(user.number)
                              : numberEdit(''),
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
                      (behaviorProvider.getCondition == behavior.detailData)
                          ? addressDetail(user.address)
                          : (behaviorProvider.getCondition == behavior.editData)
                              ? addressEdit(user.address)
                              : addressEdit(''),
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
      ),
      floatingActionButton: Consumer2<BehaviorProvider, UserProvider>(
        builder: (context, behaviorProvider, userProvider, _) => Padding(
          padding: const EdgeInsets.all(24.0),
          child: (behaviorProvider.getCondition == behavior.detailData)
              ? fabEditContact(behaviorProvider)
              : (behaviorProvider.getCondition == behavior.editData)
                  ? fabSave(behaviorProvider, userProvider, user, id!)
                  : fabAdd(userProvider),
          //     fabSave()
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget starFilled(UserProvider userProvider, User user) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: userProvider.getPriority(user)
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

  Widget nameEdit(String? name) {
    return TextField(
      controller: nameController..text = name ?? '',
      style: blackTextFont.copyWith(fontSize: 25),
      decoration: InputDecoration(
        hintText: "Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        contentPadding: EdgeInsets.fromLTRB(12, 10, 0, 10),
        hintStyle: blackTextFont.copyWith(fontSize: 25),
      ),
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

  Widget numberEdit(String? number) {
    return Container(
      width: 170,
      child: TextField(
        controller: numberController..text = (number) ?? '',
        style: blackTextFont,
        decoration: InputDecoration(
          hintText: "Mobile Number",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          contentPadding: EdgeInsets.only(left: 12),
          hintStyle: blackTextFont,
        ),
      ),
    );
  }

  Widget addressDetail(String? address) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          address ?? '',
          style: blackTextFont,
        ),
        Text(
          'Address',
          style: blackLightTextFont,
        )
      ],
    );
  }

  Widget addressEdit(String? address) {
    return Container(
      width: 170,
      child: TextField(
        controller: emailController..text = (address) ?? '',
        style: blackTextFont,
        decoration: InputDecoration(
          hintText: "Address",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          contentPadding: EdgeInsets.only(left: 12),
          hintStyle: blackTextFont,
        ),
      ),
    );
  }

  Widget fabAdd(UserProvider userProvider) {
    return FloatingActionButton(
      backgroundColor: pinkColor,
      child: Icon(Icons.add),
      onPressed: () {
        userProvider.addUser(
          User(
            id: DateTime.now().toString(),
            name: nameController.text,
            number: numberController.text,
            address: emailController.text,
            priority: false,
            photo: Photo.randomPhoto(),
          ),
        );
        Navigator.pop(context);
      },
    );
  }

  Widget fabEditContact(BehaviorProvider behaviorProvider) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: FloatingActionButton.extended(
        backgroundColor: pinkColor,
        icon: SvgPicture.asset('assets/vector/ic_edit.svg'),
        onPressed: () {
          behaviorProvider.changeCondition(behavior.editData);
        },
        label: Text('Edit Contact'),
      ),
    );
  }

  Widget fabSave(BehaviorProvider behaviorProvider, UserProvider userProvider,
      User user, String id) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: FloatingActionButton.extended(
        backgroundColor: blueColor,
        icon: Icon(Icons.save),
        onPressed: () {
          userProvider.editUser(
            User(
              id: id,
              name: nameController.text,
              number: numberController.text,
              address: emailController.text,
              photo: user.photo ?? User.emptyPhoto,
            ),
          );
          behaviorProvider.changeCondition(behavior.detailData);
        },
        label: Text('Save'),
      ),
    );
  }
}
