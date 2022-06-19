import 'package:flutter/material.dart';

@immutable
class CardImgProductDetails extends StatelessWidget {
  final String url;
  const CardImgProductDetails({
    Key? key,
    required this.url,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height / 2.5,
      width: MediaQuery.of(context).size.width,
      child: Image.asset(url),
    );
  }
}
