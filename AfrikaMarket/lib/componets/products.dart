import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "Blazer Homme",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 12000,
      "price": 8500,
    },
    {
      "name": "Blazer Femme",
      "picture": "images/products/blazer2.jpeg",
      "old_price": 12000,
      "price": 8500,
    },
    {
      "name": "Robe rouge",
      "picture": "images/products/dress1.jpeg",
      "old_price": 40000,
      "price": 30000,
    },
    {
      "name": "Robe noire",
      "picture": "images/products/dress2.jpeg",
      "old_price": 30000,
      "price": 25000,
    },
    {
      "name": "Talons Beige",
      "picture": "images/products/hills1.jpeg",
      "old_price": 12000,
      "price": 8000,
    },
    {
      "name": "Talons Rouge",
      "picture": "images/products/hills2.jpeg",
      "old_price": 20000,
      "price": 9000,
    },
    {
      "name": "Pantalon Gris",
      "picture": "images/products/pants2.jpeg",
      "old_price": 15000,
      "price": 6000,
    },
    {
      "name": "Jupe Rose",
      "picture": "images/products/skt1.jpeg",
      "old_price": 10000,
      "price": 7000,
    },
    {
      "name": "Jupe Fleur",
      "picture": "images/products/skt2.jpeg",
      "old_price": 11000,
      "price": 9000,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Single_prod(
              prod_name: product_list[index]['name'],
              prod_pricture: product_list[index]['picture'],
              prod_old_price: product_list[index]['old_price'],
              prod_price: product_list[index]['price'],
            ),
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_pricture;
  final prod_old_price;
  final prod_price;

  Single_prod({
    this.prod_name,
    this.prod_pricture,
    this.prod_old_price,
    this.prod_price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: prod_name,
          child: Material(
            child: InkWell(
              onTap: () {},
              child: GridTile(
                  footer: Container(
                    color: Colors.white70,
                    child: ListTile(
                        leading: Text(
                          prod_name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        title: Text(
                          "$prod_price FCFA",
                          style: TextStyle(
                              color: Colors.orange, fontWeight: FontWeight.w800),
                        ),
                        subtitle: Text(
                          "$prod_old_price FCFA",
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w800,
                              decoration
                                  :TextDecoration.lineThrough),
                        ),
                    ),
                  ),
                  child: Image.asset(
                    prod_pricture,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}
