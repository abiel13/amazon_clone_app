import 'dart:io';

import 'package:amazon_clone/Common/widgets/custom_button.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:amazon_clone/Common/widgets/custom_textfield.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:dotted_border/dotted_border.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/add-product';
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  String category = 'Mobiles';

  @override
  void dispose() {
    super.dispose();
    _priceController.dispose();
    _productNameController.dispose();
    _descriptionController.dispose();
    _quantityController.dispose();
  }

  List<String> cats = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion'
  ];
  List<File> images = [];

  void selectImg() async {
    var res = await pickImages();

    setState(() {
      images = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration:
              const BoxDecoration(gradient: GlobalVariables.appBarGradient),
        ),
        title: const Text(
          'Add Product',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              images.isNotEmpty
                  ? CarouselSlider(
                      items: images
                          .map(
                            (e) => Builder(
                              builder: (BuildContext context) => Image.file(
                                e,
                                fit: BoxFit.cover,
                                height: 200,
                              ),
                            ),
                          )
                          .toList(),
                      options:
                          CarouselOptions(viewportFraction: 1, height: 200),
                    )
                  : GestureDetector(
                      onTap: selectImg,
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(10),
                        dashPattern: const [10, 4],
                        strokeCap: StrokeCap.round,
                        child: Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.folder_outlined,
                                  size: 26,
                                ),
                                Text(
                                  'Select Product Images',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey.shade400),
                                ),
                              ]),
                        ),
                      ),
                    ),
              const SizedBox(
                height: 30,
              ),
              CustomTextField(
                  controller: _productNameController, hintText: 'product name'),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: _descriptionController,
                hintText: 'description',
                maxLines: 5,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: _priceController,
                hintText: 'Price',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: _quantityController,
                hintText: 'Quantity',
              ),
              SizedBox(
                width: double.infinity,
                child: DropdownButton(
                  value: category,
                  icon: const Icon(Icons.keyboard_arrow_down_outlined),
                  items: cats.map((String item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      category = value!;
                    });
                  },
                ),
              ),
              CustomButton(text: 'Sell Product', onTap: () {})
            ],
          ),
        )),
      ),
    );
  }
}
