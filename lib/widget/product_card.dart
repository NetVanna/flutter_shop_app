import 'package:ecommerce_ui/models/products.dart';
import 'package:ecommerce_ui/provider/favorite_provider.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.products});

  final Products products;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => provider.toggleFavorite(widget.products),
                child: Icon(
                  provider.isExist(widget.products)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.red,
                ),
              )
            ],
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: 130,
            height: 130,
            child: Image.asset(
              widget.products.image,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 0,
            child: Text(
              widget.products.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            widget.products.category,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "\$${widget.products.price}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
