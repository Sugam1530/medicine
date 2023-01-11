// ignore_for_file: camel_case_types, unnecessary_import, deprecated_member_use

import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:cabento/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File _image;
  var data, map, baseUrl;
  Future<void> uploadImageServer1() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');
    String message;

    // var stream = new http.ByteStream(uploadImage!.openRead());
    // stream.cast();
    var length = await _image.length();
    var uri = Uri.parse(
        "https://fusionclient.live/FTL190160/cabento/api/profile-picture-update");
    Map<String, String> headers = {
      HttpHeaders.authorizationHeader: "Bearer $token"
    };

    var request = http.MultipartRequest('POST', uri);
    request.headers.addAll(headers);

    List<String> photos = [_image.path];

    List<http.MultipartFile> newList = [];

    for (var img in photos) {
      if (img != "") {
        var multipartFile = await http.MultipartFile.fromPath(
          'image',
          File(img).path,
          filename: img.split('/').last,
        );
        newList.add(multipartFile);
      }
    }
    request.files.addAll(newList);

    var response = await request.send();

    if (response.statusCode == 200) {
      setState(() {});
      print("Image Uloaded");
      Navigator.of(context, rootNavigator: true).pop('dialog');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Profile Picture updated successfully"),
      ));
    } else {
      Navigator.of(context, rootNavigator: true).pop('dialog');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Failed to upload photo"),
      ));
      print("Failed");
    }
  }

  Future<File> _cropImage({File imageFile}) async {
    CroppedFile croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  Future getStory(ImageSource media) async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) return;

    File imageTemporary = File(image.path);
    imageTemporary = await _cropImage(imageFile: imageTemporary);
    setState(() {
      showLoaderDialog(context);
      uploadImageServer1();
      _image = imageTemporary;
    });
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
            margin: const EdgeInsets.only(left: 7),
            child: const Text("Loading..."),
          ),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future getProfile() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('token');
    final response = await http.get(
        Uri.parse(
            'https://fusionclient.live/FTL190160/cabento/api/user-details'),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: "Bearer $token"
        });

    map = jsonDecode(response.body.toString());
    data = map["userDetails"];
    baseUrl = map["baseUrl"];

    if (response.statusCode == 200) {
      return data;
    } else {
      return data;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: getProfile(),
      builder: (context, snapshot) {
        if (data == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    child: Center(
                        child: Text(
                      'MY PROFILE',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 25),
                    )),
                    height: 100,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20)),
                      color: primaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          data["name"],
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 30),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Text(
                                'M: ',
                                style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "+91 " + data["phone"],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 45,
                    ),
                    Stack(
                      children: [
                        ClipOval(
                          child: CircleAvatar(
                            backgroundColor: primaryColor,
                            child: data["profile_image"] == null
                                ? Icon(
                                    Icons.person,
                                    size: 120,
                                  )
                                : Image.network(baseUrl + data["profile_image"]),
                            radius: 60,
                          ),
                        ),
                        Positioned(
                          top: 90,
                          left: 75,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 18,
                            child: IconButton(
                              alignment: Alignment.center,
                              onPressed: () {
                                getStory(ImageSource.gallery);
                              },
                              icon: Icon(
                                Icons.camera_alt,
                                color: primaryColor,
                                size: 25,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              height: 40,
                              width: 320,
                              color: Color.fromARGB(255, 216, 215, 215),
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      child: Icon(
                                        Icons.card_giftcard,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(
                                        'My Order',
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              height: 40,
                              width: 320,
                              color: Color.fromARGB(255, 216, 215, 215),
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      child: Icon(
                                        Icons.description,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(
                                        'My Prescriptions',
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              height: 40,
                              width: 320,
                              color: Color.fromARGB(255, 216, 215, 215),
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      child: Icon(
                                        Icons.battery_std_outlined,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(
                                        'My Lab Test',
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              height: 40,
                              width: 320,
                              color: Color.fromARGB(255, 216, 215, 215),
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      child: Icon(
                                        Icons.medication,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(
                                        'My Consultation',
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              height: 40,
                              width: 320,
                              color: Color.fromARGB(255, 216, 215, 215),
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      child: Icon(
                                        Icons.note_alt_outlined,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(
                                        'My Helth Records',
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              height: 40,
                              width: 320,
                              color: Color.fromARGB(255, 216, 215, 215),
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      child: Icon(
                                        Icons.place,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(
                                        'Manage Address',
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              height: 40,
                              width: 320,
                              color: Color.fromARGB(255, 216, 215, 215),
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      child: Icon(
                                        Icons.credit_card,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(
                                        'Manage Payment Method',
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              height: 40,
                              width: 320,
                              color: Color.fromARGB(255, 216, 215, 215),
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      child: Icon(
                                        Icons.vaccines_rounded,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(
                                        'Medicine Reminder',
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              height: 40,
                              width: 320,
                              color: Color.fromARGB(255, 216, 215, 215),
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      child: Icon(
                                        Icons.attach_money,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(
                                        'Refer & Earn',
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              height: 40,
                              width: 320,
                              color: Color.fromARGB(255, 216, 215, 215),
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      child: Icon(
                                        Icons.people_alt_sharp,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(
                                        'About us',
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              height: 40,
                              width: 320,
                              color: Color.fromARGB(255, 216, 215, 215),
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      child: Icon(
                                        Icons.call,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(
                                        'Contact us',
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              height: 40,
                              width: 320,
                              color: Color.fromARGB(255, 216, 215, 215),
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      child: Icon(
                                        Icons.live_help,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(
                                        'Need Help ?',
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    ));
  }
}
