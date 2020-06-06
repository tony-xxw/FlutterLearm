import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "Shoping App",
    home: new ShopingList(
      products: [
        new Product(name: "Eggs"),
        new Product(name: "flour"),
        new Product(name: "Chocolate cips")
      ],
    ),
  ));
}

class Product {
  const Product({this.name});

  final String name;
}

typedef void CartChangeCallBack(Product project, bool inCart);

class ShopingListItem extends StatelessWidget {
  ShopingListItem({Product project, this.inCard, this.onCartChanged})
      : project = project,
        super(key: new ObjectKey(project));

  final Product project;
  final bool inCard;
  final CartChangeCallBack onCartChanged;

  Color _getColor(BuildContext context) {
    return inCard ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (!inCard) return null;

    return new TextStyle(
        color: Colors.black54, decoration: TextDecoration.lineThrough);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListTile(
      onTap: () {
        onCartChanged(project, !inCard);
      },
      leading: new CircleAvatar(
        backgroundColor: _getColor(context),
        child: new Text(project.name[0]),
      ),
      title: new Text(project.name, style: _getTextStyle(context)),
    );
  }
}

class ShopingList extends StatefulWidget {
  ShopingList({Key key, this.products}) : super(key: key);

  final List<Product> products;

  @override
  _ShopingList createState() {
    // TODO: implement createState
    return new _ShopingList();
  }
}

class _ShopingList extends State<ShopingList> {
  Set<Product> _shopingCart = new Set();

  void _handleCartChange(Product project, bool inCard) {
    setState(() {
      if (inCard)
        _shopingCart.add(project);
      else
        _shopingCart.remove(project);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Shoping List"),
      ),
      body: new ListView(
        padding: new EdgeInsets.symmetric(horizontal: 8),
        children: widget.products.map(
          (Product product) {
            return new ShopingListItem(
              project: product,
              inCard: _shopingCart.contains(product),
              onCartChanged: _handleCartChange,
            );
          },
        ).toList(),
      ),
    );
  }
}
