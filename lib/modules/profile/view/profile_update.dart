import 'dart:io';

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
                    backgroundImage: profileImage != null
                        ? NetworkImage(profileImage!.path)
                        : null,
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
                  border: const OutlineInputBorder(),
                  labelText: "Your Last Name "),
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
            child: AppUtils.commonButtonFullWidth("Update Profile", () => null),
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
}
