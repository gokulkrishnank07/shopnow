import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopnow/item/item.dart';
import 'package:shopnow/model/productmodel.dart';
import 'package:shopnow/provider/providerclass.dart';

class ShopingItems extends StatefulWidget {
  final Productmodel post;

  const ShopingItems({required this.post, super.key});

  @override
  State<ShopingItems> createState() => _ShopingItemsState();
}

class _ShopingItemsState extends State<ShopingItems> {
  @override
  void initState() {
    super.initState();  
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 1,
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Provider.of<Providerchange>(context, listen: false)
                .getAllDetials(widget.post);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Item(),
              ),
            );
          },
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(widget.post.image ?? ''),
              ),
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 150, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Shirt",
                style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
              ),
              SizedBox(
                height: 35,
                child: Text(
                  widget.post.title ?? '',
                  style: GoogleFonts.poppins(
                      fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 218, left: 10),
          child: Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.amberAccent,
                size: 18,
              ),
              Text(
                "4.9 | 2366",
                style: GoogleFonts.poppins(fontSize: 10, color: Colors.grey),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 200, left: 80),
          child: Center(
            child: Text(
              widget.post.price.toString(),
              style: GoogleFonts.poppins(
                  color: const Color.fromARGB(255, 27, 137, 97),
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ),
        )
      ],
    );
  }
}
