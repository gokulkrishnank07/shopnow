import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopnow/addproduct/productservice.dart';
import 'package:shopnow/imgservice/image_service.dart';
import 'package:shopnow/model/productmodel.dart';

class Addlist extends StatefulWidget {
  const Addlist({super.key});

  @override
  State<Addlist> createState() => _AddlistState();
}

class _AddlistState extends State<Addlist> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  Productmodel? productmodel;
  Productservice productsevice = Productservice();
  String uploadedImage = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 20,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            "ADD YOUR PRODUCT",
            style: GoogleFonts.poppins(
                fontSize: 19,
                color: const Color.fromARGB(255, 27, 137, 97),
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Card(
                color: Colors.white,
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: 'Product Name',
                    labelStyle: GoogleFonts.poppins(color: Colors.grey),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Card(
                color: Colors.white,
                child: TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle: GoogleFonts.poppins(color: Colors.grey),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Card(
                color: Colors.white,
                child: TextField(
                  controller: categoryController,
                  decoration: InputDecoration(
                      labelText: 'Category',
                      labelStyle: GoogleFonts.poppins(color: Colors.grey),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Card(
                color: Colors.white,
                child: TextField(
                  keyboardType: TextInputType.phone,
                  controller: priceController,
                  decoration: InputDecoration(
                      labelText: 'Enter Price',
                      labelStyle: GoogleFonts.poppins(color: Colors.grey),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Upload Your Image",
                style: GoogleFonts.poppins(color: Colors.grey),
              ),
              const SizedBox(
                height: 5,
              ),
              uploadedImage == ""
                  ? const SizedBox()
                  : Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(uploadedImage),
                              fit: BoxFit.cover),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1.0,
                            ),
                          ],
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                    ),
              const SizedBox(
                height: 5,
              ),
              ElevatedButton(
                  onPressed: () async {
                    final ImagePicker picker = ImagePicker();
                    final XFile? image =
                        await picker.pickImage(source: ImageSource.gallery);
                    if (image != null) {
                      Uint8List bytes = await image.readAsBytes();

                      ImageService()
                          .uploadImage(bytes, image.name)
                          .then((value) {
                        print("Resoponse: ${value.toString()}");

                        setState(() {
                          uploadedImage = value["location"].toString();
                        });
                      }).onError((error, stackTrace) {
                        print(error.toString());
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.white),
                  child: Text(
                    "Upload Your Product Picture",
                    style: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 27, 137, 97),
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  )),
              Text(
                "Product Detials",
                style: GoogleFonts.poppins(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5.0,
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            children: [
              const SizedBox(
                width: 90,
              ),
              Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 97, 174, 146),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10))),
                child: const Icon(
                  Icons.save_rounded,
                  color: Colors.white,
                ),
              ),
              Container(
                height: 50,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 39, 61, 81),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10))),
                width: 99,
                child: Center(
                  child: InkWell(
                    onTap: () async {
                      productmodel = Productmodel(
                        title: titleController.text,
                        category: categoryController.text,
                        description: descriptionController.text,
                        image: uploadedImage,
                        price: priceController.text,
                      );
                      bool success =
                          await productsevice.addproduct(productmodel, context);
                      if (success) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Product Created")));
                      }
                    },
                    child: Text(
                      "CONFIRM",
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
