import 'package:flutter/material.dart';

class AppEdgeInsets {
  static const EdgeInsets minStockAll =
      EdgeInsets.symmetric(vertical: 1, horizontal: 2);

  static const EdgeInsets minAll = EdgeInsets.all(2);

  static const EdgeInsets sdMin = EdgeInsets.all(5);

  static const EdgeInsets sdAll = EdgeInsets.all(10);

  static const EdgeInsets mmAll = EdgeInsets.all(15);
  static const EdgeInsets intAll = EdgeInsets.all(20);

  static const EdgeInsets mdAll = EdgeInsets.all(24);

  static const EdgeInsets xlAll = EdgeInsets.all(30);

  static const EdgeInsets headerSymmetric = EdgeInsets.symmetric(
    vertical: 20,
    horizontal: 15,
  );

  static const EdgeInsets vmin = EdgeInsets.symmetric(vertical: 5);

  static const EdgeInsets vsd = EdgeInsets.symmetric(vertical: 10);

  static const EdgeInsets vsdm = EdgeInsets.symmetric(vertical: 15);

  static const EdgeInsets vmd = EdgeInsets.symmetric(vertical: 20);

  static const EdgeInsets hmin = EdgeInsets.symmetric(horizontal: 5);

  static const EdgeInsets hsd = EdgeInsets.symmetric(horizontal: 10);

  static const EdgeInsets hsdm = EdgeInsets.symmetric(horizontal: 15);

  static const EdgeInsets hmd = EdgeInsets.symmetric(horizontal: 20);

  static const EdgeInsets hxl = EdgeInsets.symmetric(horizontal: 30);

  static const EdgeInsets sdSymetric = EdgeInsets.symmetric(
    vertical: 20,
    horizontal: 10,
  );

  static const EdgeInsets cardSymetric = EdgeInsets.symmetric(
    vertical: 5,
    horizontal: 10,
  );

  static const EdgeInsets tmin = EdgeInsets.only(top: 5);

  static const EdgeInsets tsd = EdgeInsets.only(top: 10);

  static const EdgeInsets tmd = EdgeInsets.only(top: 15);

  static const EdgeInsets txl = EdgeInsets.only(top: 20);

  static const EdgeInsets bmin = EdgeInsets.only(bottom: 5);

  static const EdgeInsets bsd = EdgeInsets.only(bottom: 10);

  static const EdgeInsets bmd = EdgeInsets.only(bottom: 15);

  static const EdgeInsets bxl = EdgeInsets.only(bottom: 20);

  static const EdgeInsets rmin = EdgeInsets.only(right: 5);

  static const EdgeInsets rsd = EdgeInsets.only(right: 10);

  static const EdgeInsets lmin = EdgeInsets.only(left: 5);

  static const EdgeInsets lsd = EdgeInsets.only(left: 10);

  static const EdgeInsets onlyProduct = EdgeInsets.only(
    top: 15,
    bottom: 3,
  );

  static const EdgeInsets onlyObsCard = EdgeInsets.only(
    bottom: 10,
    left: 15,
    right: 10,
  );

  static const EdgeInsets priceCard = EdgeInsets.only(
    bottom: 10,
    right: 10,
  );

  static const EdgeInsets onlyAlert = EdgeInsets.only(
    top: 30,
    bottom: 20,
  );

  static const EdgeInsets buttonSelect =
      EdgeInsets.symmetric(vertical: 5, horizontal: 20);

  static const SliverGridDelegateWithFixedCrossAxisCount sliverGrid =
      SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 10.0,
    mainAxisSpacing: 10.0,
    childAspectRatio: 1.3,
  );
  static const EdgeInsets spacingCardCart = EdgeInsets.fromLTRB(10, 10, 10, 0);

  static const EdgeInsets spacingCartAction =
      EdgeInsets.only(bottom: 7, left: 10, right: 10);

  static const EdgeInsets symmetricStock =
      EdgeInsets.symmetric(vertical: 1, horizontal: 5);

  static const EdgeInsets roundedTextfield = EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 18,
  );

  static const EdgeInsets addProductButton = EdgeInsets.symmetric(
    vertical: 7,
    horizontal: 7,
  );

  static const EdgeInsets addFuelButton = EdgeInsets.symmetric(
    vertical: 7,
    horizontal: 7,
  );

  static const EdgeInsets symetricSector = EdgeInsets.symmetric(
    horizontal: 15,
    vertical: 10,
  );
}
