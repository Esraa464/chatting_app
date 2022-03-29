import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class Storage extends StatefulWidget {
  Storage({Key? key}) : super(key: key);

  @override
  State<Storage> createState() => _StorageState();
}

class _StorageState extends State<Storage> {
  File? file;

  var imagePicker = ImagePicker();

  @override
  void initState() {
    getImagesAndFolders();
    super.initState();
  }

  ///to be sure that the image name will never be repeated.
  var random = Random().nextInt(100000000);

  ///we use the method random because if i upload an image twice or two images have the same name there will be override on it and one of them will be canceled.
  Future uploadImage() async {
    var pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      file = File(pickedImage.path);
      var imageName = basename(pickedImage.path);
      imageName = '$random  $imageName';
      print('=============================');
      print(imageName + '========================');
      print('=============================');
      print(pickedImage.path);
      print(file);

      ///to create a ref for containing images and put the image name next;
      ///two ways to create folders on the storage one by / and one by child.
      /////it is optional to use imageName.
      // var refStorage = FirebaseStorage.instance.ref('images/$imageName');
      var refStorage = FirebaseStorage.instance
          .ref('avatar')
          .child('part1')
          .child('$imageName');

      ///to put the image on the file we have just created and put the image on it ,
      await refStorage.putFile(file!);

      ///   how to reach the image path
      var imageUrl = await refStorage.getDownloadURL();
      print('imageUrl:          $imageUrl');
    } else {
      print('please choose image' * 30);
    }
  }

  getImagesAndFolders() async {
    ///this step will access just images on ref and will not access the images on folder image ..
    // var ref = await FirebaseStorage.instance.ref().list();
    ///this step will access what inside the folder image on the ref
    // var ref = await FirebaseStorage.instance.ref('image').list();
    // var ref = await FirebaseStorage.instance.ref('image').listAll();

    ///if i have so much images on my ref in the storage and i just want to get just two images from it
    ///so in the list i can spacify a max result but in the listAll will bring all the images on the ref even it is million.
    // var ref = await FirebaseStorage.instance.ref().list(const ListOptions(maxResults: 1,));
    var ref = await FirebaseStorage.instance.ref().listAll();

    ///prefixes will bring the folders name.
    for (var element in ref.prefixes) {

    // for (var element in ref.items) {
      print(element.name);
      // print(element.fullPath);
    }
    print('========================');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () async {
                  await uploadImage();
                },
                child: Text('get image')),
          )
        ],
      ),
    );
  }
}
