import 'package:emporio_taruma/source/adm_page/list_item.dart';
import 'package:emporio_taruma/source/list_products/card.dart';
import 'package:emporio_taruma/source/utils/color.dart';
import 'package:emporio_taruma/source/utils/size.dart';
import 'package:flutter/material.dart';

const List<String> filtro = [
  '7 dias',
  '14 dias',
  '21 dias',
  '28 dias',
  '45 dias',
  '60 dias',
  'Todos'
];

class AdmPage extends StatefulWidget {
  const AdmPage({Key? key}) : super(key: key);

  @override
  State<AdmPage> createState() => _AdmPageState();
}

class _AdmPageState extends State<AdmPage> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 120,
              top: 72,
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Ink.image(
                      image: const NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q='
                        'tbn:ANd9GcQo5TFfqsU1dlMGeQL9RAFAB4wTyOLi8a-'
                        '_BR5T6UxJAwIqSF458c7Zhttf9lur6J6mHlY&usqp=CAU',
                      ),
                    ),
                    const Text(
                      'Produtos',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const FilterProducts(filtro: filtro),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 1,
                      width: 650,
                      child: Material(
                        color: CustomColors.grey.withOpacity(0.5),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 120,
              top: 163,
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: DesignTokens.sizeXL,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: DesignTokens.sizeSM),
                  child: Wrap(
                    spacing: DesignTokens.sizeSM,
                    runSpacing: DesignTokens.sizeL,
                    children: List.generate(100, (index) {
                      return const ListItem();
                    }),
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: CustomColors.green,
            height: media.height,
            width: 60,
          )
        ],
      ),
    );
  }
}

String _filters = '';
const double filterChipBorderWidth = 0.5;

class FilterProducts extends StatefulWidget {
  final List<String> filtro;

  const FilterProducts({
    super.key,
    required this.filtro,
  });

  @override
  State<FilterProducts> createState() => _FilterProductsState();
}

class _FilterProductsState extends State<FilterProducts> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      runSpacing: 6,
      children: widget.filtro.map((filtro) {
        return FilterChip(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: CustomColors.white,
          labelPadding: const EdgeInsets.symmetric(
            horizontal: DesignTokens.sizeL,
          ),
          selectedColor: CustomColors.green,
          showCheckmark: false,
          label: Text(
            filtro,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          selected: _filters.contains(filtro),
          onSelected: (bool value) {
            setState(() {
              if (value) {
                if (!_filters.contains(filtro)) {
                  _filters = filtro;
                }
              }
              print(_filters);
            });
          },
        );
      }).toList(),
    );
  }
}
