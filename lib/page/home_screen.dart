import 'dart:core';
import 'package:ecommerce_ui/models/my_products.dart';
import 'package:ecommerce_ui/page/details_screen.dart';
import 'package:flutter/material.dart';

import '../widget/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Our Product",
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildProductCategory(index: 0, text: "All Product"),
                  _buildProductCategory(index: 1, text: "Iphone"),
                  _buildProductCategory(index: 2, text: "Infinite"),
                  _buildProductCategory(index: 3, text: "CAMON"),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: isSelected == 0
                  ? _buildAllProducts()
                  : isSelected == 1
                      ? _buildIphoneProducts()
                      : isSelected == 2
                          ? _buildInfiniteProducts()
                          : _buildCAMONProducts(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCategory({required int index, required String text}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = index;
        });
      },
      child: Container(
        width: 120,
        height: 40,
        margin: const EdgeInsets.only(top: 10, right: 10),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected == index ? Colors.red : Colors.red.shade300,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildAllProducts() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: (100 / 140),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12),
        scrollDirection: Axis.vertical,
        itemCount: MyProducts.allProducts.length,
        itemBuilder: (context, index) {
          final allProducts = MyProducts.allProducts[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(products: allProducts),
                ),
              );
            },
            child: ProductCard(
              products: allProducts,
            ),
          );
        },
      );

  Widget _buildIphoneProducts() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: (100 / 140),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12),
        scrollDirection: Axis.vertical,
        itemCount: MyProducts.iphone.length,
        itemBuilder: (context, index) {
          final iphoneProducts = MyProducts.iphone[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(products: iphoneProducts),
                ),
              );
            },
            child: ProductCard(
              products: iphoneProducts,
            ),
          );
        },
      );

  Widget _buildInfiniteProducts() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: (100 / 140),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12),
        scrollDirection: Axis.vertical,
        itemCount: MyProducts.Infinix.length,
        itemBuilder: (context, index) {
          final infiniteProducts = MyProducts.Infinix[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailsScreen(products: infiniteProducts),
                ),
              );
            },
            child: ProductCard(
              products: infiniteProducts,
            ),
          );
        },
      );

  Widget _buildCAMONProducts() => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: (100 / 140),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12),
        scrollDirection: Axis.vertical,
        itemCount: MyProducts.CAMON.length,
        itemBuilder: (context, index) {
          final cAMONProducts = MyProducts.CAMON[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(products: cAMONProducts),
                ),
              );
            },
            child: ProductCard(
              products: cAMONProducts,
            ),
          );
        },
      );
}
