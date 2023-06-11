import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/constants/colors.dart';
import '../../data/constants/textStyles.dart';
import '../../data/models/podacha_adver_model/podacha_avto_adver.dart';

final ImagePicker imagePicker = ImagePicker();
bool hasPhoto = false;

List<XFile>? images = [];

class DobavitPhoto extends StatefulWidget {
  const DobavitPhoto({
    Key? key,
    required this.stNextPage,
    required this.stCanTap,
    required this.paa,
  }) : super(key: key);
  final PodachaAvtoAdver paa;

  final Function stNextPage;
  final Function stCanTap;

  @override
  State<DobavitPhoto> createState() => _DobavitPhotoState();
}

class _DobavitPhotoState extends State<DobavitPhoto> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hasPhoto = false;
  }

  TextEditingController controller = TextEditingController();

  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      images!.addAll(selectedImages);
    }
    print("Image List Length:" + images!.length.toString());
    selectedImages.isNotEmpty
        ? setState(
            () {
              hasPhoto = true;
              widget.stCanTap(
                widget.paa.copyWith(
                  urlToImages:
                      images!.length > 7 ? images!.sublist(0, 7) : images,
                ),
              );
            },
          )
        : setState(() {
            hasPhoto = false;
          });
  }

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 0),
          // color: const Color(0xffFAFAFA),
          color: whitef4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 12),
                child: dobavitPhoto(maxWidth),
              ),
              images!.isNotEmpty
                  ? Column(
                      children: List.generate(
                        images!.length,
                        (index) => photoWidget(maxWidth, index),
                      ),
                    )
                  : SizedBox(),
              SizedBox(
                width: maxWidth / 2,
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }

  Container photoWidget(double maxWidth, int i) {
    return Container(
      width: maxWidth - 26,
      height: maxWidth / 2,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: FileImage(File(images![i].path)),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 11,
            right: 8,
            child: InkWell(
              onTap: () {
                setState(() {
                  images!.removeAt(i);
                });
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  // color: Color(0xff000000).withAlpha(150),
                  color: black11.withAlpha(150),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(
                  Icons.delete,
                  size: 20,
                  // color: Color(0xffFF0000),
                  color: redff0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget dobavitPhoto(double maxW) {
    return ElevatedButton(
      autofocus: true,
      onPressed: () {
        selectImages();
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size.zero, // Set this
        padding: EdgeInsets.zero, // and this
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: maxW - 24,
        decoration: BoxDecoration(
          // color: const Color(0xFF2DC36A),
          color: color_green,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          'Добавить фотографию',
          textAlign: TextAlign.center,
          // style: TextStyle(
          //   fontSize: 16,
          //   fontWeight: FontWeight.w600,
          //   // color: Colors.white,
          //   color: whitef4,
          //   fontFamily: 'Gilroy',
          // ),
          style: tsf4_16_600_0,
        ),
      ),
    );
  }
}
