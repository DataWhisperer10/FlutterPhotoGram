import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:photogram/app_sizing.dart';
import 'package:photogram/app_utils.dart';

class ProfileUpdate extends StatefulWidget {
  const ProfileUpdate({super.key});

  @override
  State<ProfileUpdate> createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  final FirebaseStorage storage = FirebaseStorage.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final storageRef = FirebaseStorage.instance.ref();

  File? profileImage;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController fullAddressController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: AppSizing.screenSizeonHeight(10),
          ),
          SizedBox(
            width: AppSizing.screenSizeonWidth(40),
            height: AppSizing.screenSizeonWidth(40),
            child: InkWell(
              onTap: () {
                getPhotoFromGallery();
              },
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: AppSizing.screenSizeonWidth(30),
                    backgroundImage:
                        profileImage != null ? imageProvider() : null,
                    backgroundColor: Colors.blueAccent,
                  ),
                  Container(
                    width: AppSizing.screenSizeonWidth(40),
                    height: AppSizing.screenSizeonWidth(40),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [Colors.transparent, Colors.pink],
                            stops: [0.6, 1],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                  ),
                  const Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.add_a_photo),
                      ))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: firstNameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Your First Name "),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: lastNameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: "Your Last Name "),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: fullAddressController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Your Complete Address "),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                showDatePicker(
                        context: context,
                        firstDate: DateTime.now()
                            .subtract(const Duration(days: 36500)),
                        lastDate:
                            DateTime.now().subtract(const Duration(days: 3650)))
                    .then((value) {
                  if (value != null) {
                    dobController.text =
                        DateFormat("MMMM dd,yyyy").format(value);
                  }
                });
              },
              child: TextField(
                controller: dobController,
                enabled: false,
                decoration: const InputDecoration(
                    disabledBorder: OutlineInputBorder(),
                    border: OutlineInputBorder(),
                    labelText: "Select Your Date of Birth "),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: AppUtils.commonButtonFullWidth("Update Profile", () {
              uploadImage(context);
            }),
          )
        ],
      ),
    ));
  }

  ImagePicker imagePicker = ImagePicker();

  Future<File?> getPhotoFromGallery() async {
    XFile? xfile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (xfile != null) {
      setState(() {
        profileImage = File(xfile.path);
      });
      return profileImage;
    } else {
      return null;
    }
  }

  uploadImage(context) {
    Reference imagesRef = FirebaseStorage.instance
        .ref("gs://photogram2-38a57.appspot.com/profileImage")
        .child("profile_pics")
        .child(
            '/${FirebaseAuth.instance.currentUser?.uid}/${DateTime.now().millisecondsSinceEpoch}');
    final metadata = SettableMetadata(
      contentType: "image/jpeg",
      customMetadata: {"picked-file-data": profileImage!.path},
    );
    UploadTask uploadTask =
        imagesRef.putFile(File.fromUri(profileImage!.uri), metadata);
    uploadTask.whenComplete(() async {
      String imageUrl = await imagesRef.getDownloadURL();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Image Upload Successfully Done $imageUrl")));
    });
  }

  ImageProvider imageProvider() {
    if (kIsWeb == true) {
      return NetworkImage(profileImage!.path);
    }
    return FileImage(profileImage!);
  }
}
