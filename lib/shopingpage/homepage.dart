import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopnow/item/addlist/addlist.dart';
import 'package:shopnow/model/productmodel.dart';
import 'package:shopnow/provider/providerclass.dart';
import 'package:shopnow/shopingpage/shopping_product/shoping_items.dart';
import 'package:textfield_shadow/custom_textfield.dart';

class Homepage extends StatefulWidget {
  const Homepage({
    super.key,
  });

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        Provider.of<Providerclass>(context, listen: false).getAllData();
        // print();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        extendBodyBehindAppBar: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          title: Text('Shopnow',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 27, 137, 97),
              )),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: IconButton(
                icon: const Icon(
                  Icons.add,
                  color: Color.fromARGB(255, 27, 137, 97),
                  size: 30,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Addlist()));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                icon: const Icon(
                  Icons.shopping_bag,
                  color: Color.fromARGB(255, 27, 137, 97),
                  size: 30,
                ),
                onPressed: () {},
              ),
            ),
          ],
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomTextfield(
                size: Size(100, 50),
                hintStr: 'Search your product',
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
        body: Consumer<Providerclass>(builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          List<Productmodel> posts = value.posts;
          return GridView.builder(
            padding: const EdgeInsets.only(left: 10, right: 10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 7,
              mainAxisSpacing: 7,   
              mainAxisExtent: 250,
            ),
            itemCount: posts.length,
            itemBuilder: (context, index) {
              print(posts);

              return ShopingItems(
                post: posts[index],
              );
            },
          );
        }),
      ),
    );
  }
}
