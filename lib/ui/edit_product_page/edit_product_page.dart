import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/data/models/category_model.dart';
import 'package:kachpara/domain/entities/product.dart';
import 'package:kachpara/l10n/extensions/localizations_extension.dart';
import 'package:kachpara/ui/edit_product_page/cubit/edit_product_cubit.dart';
import 'package:kachpara/ui/edit_product_page/cubit/utils.dart';
import 'package:kachpara/utils/currency.dart';
import 'package:kachpara/utils/image_picker_utils.dart';
import 'package:kachpara/widgets/button.dart';
import 'package:kachpara/widgets/snackbar.dart';

import '../../domain/entities/category.dart';

class EditProductPage extends StatelessWidget {
  static const String routeName = 'edit_product_page';

  const EditProductPage({
    required this.storeId,
    this.productCategory,
    super.key,
  });

  final Category? productCategory;
  final String storeId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<EditProductCubit>(param1: storeId),
      child: _EditProductPageLayout(
        productCategory: productCategory,
      ),
    );
  }
}

class _EditProductPageLayout extends StatefulWidget {
  const _EditProductPageLayout({
    this.productCategory,
  });

  final Category? productCategory;

  @override
  State<_EditProductPageLayout> createState() => _EditProductPageLayoutState();
}

class _EditProductPageLayoutState extends State<_EditProductPageLayout> {
  final _categoryNameController = TextEditingController();
  Category? oldCategory;
  late Category category;

  final _defaultCategory = Category(
    id: math.Random().nextInt(1000000),
    name: '',
    position: -1,
    products: [],
  );

  @override
  void initState() {
    super.initState();

    // Init category and fields
    oldCategory = widget.productCategory;
    category = widget.productCategory ?? _defaultCategory.copyWith();
    _categoryNameController.text = category.name;
  }

  @override
  void dispose() {
    _categoryNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditProductCubit, EditProductState>(
      listener: (context, state) {
        final message = EditProductStateStatus.getMessage(state.status);

        if (message != null) showSnackBar(context, message);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(category.name.isEmpty ? context.l10n.edit_product_page_add_new_category : category.name),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                context.read<EditProductCubit>().deleteCategory(category: CategoryModel.fromDomain(category));
                context.pop();
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: InputField(
                          fieldController: _categoryNameController,
                          hintText: context.l10n.edit_product_page_category_name,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      onPressed: () async {
                        FocusManager.instance.primaryFocus?.unfocus();

                        // Update category
                        if (_categoryNameController.text.isNotEmpty && _categoryNameController.text.trim() != category.name) {
                          setState(() {
                            category = category.copyWith(name: _categoryNameController.text.trim());
                          });
                          if (widget.productCategory == null && oldCategory == null) {
                            // Add category
                            await context.read<EditProductCubit>().addCategory(
                                  category: category,
                                );

                            oldCategory = category;
                            return;
                          }

                          _updateCategory(context);
                        }
                      },
                      icon: Icon(
                        Icons.check,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey[300],
                ),
                ...category.products.map(
                  (product) => _ProductCard(
                    categoryId: category.id,
                    product: product,
                    updateProduct: _updateProduct,
                    deleteProduct: _deleteProduct,
                  ),
                ),
                Divider(
                  color: Colors.grey[300],
                ),
                if (category.name.isNotEmpty)
                  SizedBox(
                    height: 50,
                    child: ButtonWidget(
                      text: context.l10n.edit_product_page_add_new_product,
                      onPressed: () {
                        final newProduct = Product(
                          id: math.Random().nextInt(1000000),
                          name: '',
                          price: 0.0,
                          currency: "TRY",
                          priceWithSign: "₺0.0",
                          description: '',
                        );

                        setState(() {
                          category.products.add(newProduct);
                        });

                        _updateCategory(context);
                      },
                      showLoadingIndicator: false,
                      iconData: Icons.add,
                      options: const FFButtonOptions(
                        borderRadius: 8.0,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _updateCategory(BuildContext context) async {
    if (oldCategory != null) {
      // Update category
      await context.read<EditProductCubit>().updateCategory(
            oldCategory: oldCategory!,
            newCategory: category,
          );

      oldCategory = category;
    }
  }

  void _updateProduct(Product newProduct) {
    final index = category.products.indexWhere((item) => item.id == newProduct.id);
    setState(() {
      category.products[index] = newProduct;
    });
    _updateCategory(context);
  }

  void _deleteProduct(Product product) {
    setState(() {
      category.products.remove(product);
    });

    _updateCategory(context);
  }
}

class _ProductCard extends StatefulWidget {
  const _ProductCard({
    required this.categoryId,
    required this.product,
    required this.updateProduct,
    required this.deleteProduct,
  });

  final int categoryId;
  final Product product;
  final Function(Product) updateProduct;
  final Function(Product) deleteProduct;

  @override
  State<_ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<_ProductCard> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();

  late CurrencyType _selectedCurrency;

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.product.name;
    _priceController.text = widget.product.price.toString();
    _selectedCurrency = CurrencyType.fromString(widget.product.currency ?? "TRY");
    _descriptionController.text = widget.product.description ?? "";
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: _pickProductImage,
                        child: Container(
                          height: 108,
                          width: 108,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: ((widget.product.imageFileName != null && widget.product.imageFileName != '')
                                  ? NetworkImage(
                                      widget.product.imageFileName!.contains('https://')
                                          ? widget.product.imageFileName!
                                          : "https:${widget.product.imageFileName ?? ''}",
                                    )
                                  : const AssetImage('assets/images/product-placeholder.png') as ImageProvider),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                          child: InputField(
                            fieldController: _nameController,
                            hintText: context.l10n.edit_product_page_product_name,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: SizedBox(
                                height: 50,
                                child: InputField(
                                  fieldController: _priceController,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.end,
                                  hintText: context.l10n.edit_product_page_price,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: DropdownButton<CurrencyType>(
                                  borderRadius: BorderRadius.circular(8),
                                  value: _selectedCurrency,
                                  underline: Container(),
                                  items: CurrencyType.values
                                      .map(
                                        (currencyType) => DropdownMenuItem<CurrencyType>(
                                          value: currencyType,
                                          child: Text(
                                            currencyType.toCurrencySign(),
                                            style: const TextStyle(fontSize: 18),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedCurrency = value ?? _selectedCurrency;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: MediaQuery.of(context).size.width - 48,
                child: InputField(
                  fieldController: _descriptionController,
                  hintText: context.l10n.edit_product_page_description,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 50,
                child: ButtonWidget(
                  text: context.l10n.edit_product_page_save,
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();

                    final productName = _nameController.text.isEmpty ? widget.product.name : _nameController.text;
                    final price = double.tryParse(_priceController.text) ?? widget.product.price;
                    final currency = _selectedCurrency.toString();

                    if (productName.isNotEmpty && !price.isNegative && currency.isNotEmpty) {
                      widget.updateProduct(widget.product.copyWith(
                          name: _nameController.text.isEmpty ? widget.product.name : _nameController.text,
                          price: price,
                          description: _descriptionController.text.isEmpty ? widget.product.description : _descriptionController.text,
                          currency: currency,
                          priceWithSign: '${_selectedCurrency.toCurrencySign()}$price'));
                    }
                  },
                  showLoadingIndicator: false,
                  options: const FFButtonOptions(
                    borderRadius: 8.0,
                  ),
                ),
              ),
              TextButton.icon(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () => widget.deleteProduct(widget.product),
                label: Text(
                  context.l10n.edit_product_page_delete_product,
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _pickProductImage() async {
    final file = await getImage(context);

    if (file != null) {
      final imageUrl = await context.read<EditProductCubit>().uploadProductImage(
            categoryId: widget.categoryId.toString(),
            productId: widget.product.id.toString(),
            image: File(file.path),
          );

      if (imageUrl != null) {
        setState(() {
          widget.updateProduct(widget.product.copyWith(imageFileName: imageUrl));
        });
      }
    }
  }
}

class InputField extends StatelessWidget {
  const InputField({
    required this.fieldController,
    this.keyboardType = TextInputType.text,
    this.textAlign = TextAlign.start,
    this.hintText,
    this.isEnabled = true,
    super.key,
  });

  final TextEditingController fieldController;
  final TextInputType keyboardType;
  final TextAlign textAlign;
  final String? hintText;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: fieldController,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: keyboardType,
      textAlign: textAlign,
      maxLines: null,
      enabled: isEnabled,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
        contentPadding: const EdgeInsets.only(
          top: 30,
          left: 8,
        ),
      ),
    );
  }
}
