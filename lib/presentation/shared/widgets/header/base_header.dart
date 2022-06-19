import 'package:flutter/material.dart';

import 'package:shop_express/presentation/shared/style/app_edge_insets.dart';
import 'package:shop_express/presentation/shared/style/app_text_styles.dart';

class BaseHeader extends StatelessWidget {
  final List<InlineSpan> children;
  final TextAlign textAlign;

  const BaseHeader({
    Key? key,
    required this.children,
    this.textAlign = TextAlign.start,
    this.isPadding = true,
  }) : super(key: key);

  final bool isPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isPadding ? AppEdgeInsets.vsd : const EdgeInsets.only(),
      child: RichText(
        textAlign: textAlign,
        text: TextSpan(
          style: AppTextStyles.heading,
          children: children,
        ),
      ),
    );
  }
}
