import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shop_express/app/injection_container.dart';
import 'package:shop_express/presentation/features/products/mobx/product.store.dart';
import 'package:shop_express/presentation/shared/style/app_edge_insets.dart';
import 'package:shop_express/presentation/shared/style/app_input_border.dart';
import 'package:shop_express/presentation/shared/style/app_spacing.dart';
import 'package:shop_express/presentation/shared/style/app_text_styles.dart';
import 'package:shop_express/presentation/shared/widgets/textfield/simple_textfield.dart';

@immutable
class CardProductDetails extends StatefulWidget {
  const CardProductDetails({
    Key? key,
  }) : super(key: key);

  @override
  _CardProductDetailsState createState() => _CardProductDetailsState();
}

class _CardProductDetailsState extends State<CardProductDetails> {
  late ProductStore productStore;

  @override
  void initState() {
    productStore = sl<ProductStore>();
    _initControllers();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    productStore = sl<ProductStore>();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    titleController.dispose();
    typeController.dispose();
    priceController.dispose();
    titleFocus.dispose();
    typeFocus.dispose();
    priceFocus.dispose();
    super.dispose();
  }

  final TextEditingController titleController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  final FocusNode titleFocus = FocusNode();
  final FocusNode typeFocus = FocusNode();
  final FocusNode priceFocus = FocusNode();

  void _initControllers() {
    titleController.text = productStore.selectedProduct!.title;
    typeController.text = productStore.selectedProduct!.type;
    priceController = TextEditingController(
      text: productStore.selectedProduct!.price.toStringAsFixed(2),
    );
  }

  bool isPriceEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final productSelected = productStore.selectedProduct!;

        return Container(
          decoration: AppInputBorder.borderRadius,
          margin: AppEdgeInsets.sdAll,
          child: Padding(
            padding: AppEdgeInsets.sdAll,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppSpacing.sm,
                          SimpleTextField(
                            textEditingController: titleController,
                            onChanged: productStore.setProductTitle,
                            focusNode: titleFocus,
                            labelText: 'Título',
                            hintText: '',
                            textInputType: TextInputType.text,
                            onSubmitted: (_) {
                              typeFocus.requestFocus();
                              setState(() {});
                            },
                            onTap: () {
                              titleFocus.requestFocus();
                              setState(() {});
                            },
                            suffixIcon: Visibility(
                              visible: titleFocus.hasFocus,
                              child: GestureDetector(
                                onTap: () {},
                                child: const Icon(
                                  Icons.check,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ),
                          AppSpacing.sm,
                          SimpleTextField(
                            textEditingController: typeController,
                            focusNode: typeFocus,
                            onChanged: productStore.setProductType,
                            labelText: 'Tipo',
                            hintText: '',
                            textInputType: TextInputType.text,
                            onSubmitted: (_) {
                              priceFocus.requestFocus();
                            },
                            onTap: () {
                              setState(() {});
                            },
                            suffixIcon: Visibility(
                              visible: typeFocus.hasFocus,
                              child: GestureDetector(
                                onTap: () {},
                                child: const Icon(
                                  Icons.check,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ),
                          AppSpacing.sm,
                          SimpleTextField(
                            enabled: isPriceEnabled,
                            focusNode: priceFocus,
                            textEditingController: priceController,
                            onChanged: (e) =>
                                productStore.setProductPrice(double.parse(e)),
                            labelText: 'Preço R\$',
                            hintText: '',
                            textInputType: TextInputType.number,
                            onSubmitted: (_) {
                              priceFocus.unfocus();
                              setState(() {});
                            },
                            onTap: () {
                              setState(() {});
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^(\d+)?\.?\d{0,2}')),
                            ],
                            suffixIcon: Visibility(
                              visible: priceFocus.hasFocus,
                              child: GestureDetector(
                                onTap: () {},
                                child: const Icon(
                                  Icons.check,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ),
                          AppSpacing.xl,
                          Text(
                            'Descrição do produto: ',
                            style: AppTextStyles.titleButton.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          AppSpacing.min,
                          Text(
                            productSelected.description,
                            style: AppTextStyles.titleButton.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          AppSpacing.md,
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
