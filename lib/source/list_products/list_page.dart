import 'package:emporio_taruma/source/list_products/card.dart';
import 'package:emporio_taruma/source/utils/color.dart';
import 'package:emporio_taruma/source/utils/size.dart';
import 'package:flutter/material.dart';

const List<String> objetivos = [
  'Mente',
  'Digestão',
  'Fitness',
  'Longevidade',
  'Imunidade'
];

const List<String> categorias = [
  'Açucares',
  'Adoçantes',
  'Aveia',
  'Bebidas',
  'Chás',
  'Chocolates',
  'Conservas',
  'Desidratados',
  'Doces',
  'Drageados',
  'Encapsulados',
  'Especiarias',
  'Farinhas',
  'Granola',
  'Oleaginosas',
  'Sem glúten',
  'Sementes',
  'Snacks',
  'Suplementos',
  'Temperos',
  'Vegano',
];

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
const double appBarElevation = 0.0;
var url;

class ListPage extends StatelessWidget {
  const ListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      onEndDrawerChanged: (isEndDrawer) {
        if (!isEndDrawer) {
          //TODO fetch data of filter here
        }
      },
      endDrawer: Drawer(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: DesignTokens.sizeL,
              top: DesignTokens.sizeS,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.drag_handle),
                    color: CustomColors.greenTaruma,
                    onPressed: () {
                      _scaffoldKey.currentState!.closeEndDrawer();
                    },
                  ),
                ),
                const SizedBox(height: DesignTokens.sizeL),
                const Text(
                  'Objetivos',
                  style: TextStyle(fontSize: DesignTokens.sizeXL),
                ),
                const SizedBox(height: DesignTokens.sizeS),
                const FilterProducts(filtro: objetivos),
                const SizedBox(height: DesignTokens.sizeXL),
                const Text(
                  'Categorias',
                  style: TextStyle(fontSize: DesignTokens.sizeXL),
                ),
                const SizedBox(height: DesignTokens.sizeS),
                const FilterProducts(filtro: categorias),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: CustomColors.white,
        elevation: appBarElevation,
        title: const Text(
          'Emporio Tarumã',
          style: TextStyle(
            color: CustomColors.greenTaruma,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.drag_handle),
            color: CustomColors.greenTaruma,
            onPressed: () {
              _scaffoldKey.currentState!.openEndDrawer();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(DesignTokens.sizeXL),
          child: Center(
            child: Wrap(
              spacing: DesignTokens.sizeSM,
              runSpacing: DesignTokens.sizeL,
              children: List.generate(50, (index) {
                return CardWidget(
                  title: 'Frutas cristalizadas atacado com castanha do Para s s s s ssssssssssssssssssss',
                  image: 'https://cdn.awsli.com.br/1000x1000/36/36210/'
                      'produto/39529749/2860ce9326.jpg',
                  balance: Balance(
                    balance: '2350',
                    type: index % 2 == 0 ? BalanceType.unit : BalanceType.kilo,
                  ),
                  icon: const [],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

final List<String> _filters = <String>[];
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
      spacing: DesignTokens.sizeXS,
      runSpacing: DesignTokens.sizeXS,
      children: widget.filtro.map((filtro) {
        return FilterChip(
          side: const BorderSide(
            color: CustomColors.grey,
            width: filterChipBorderWidth,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(DesignTokens.sizeS)),
          backgroundColor: Colors.transparent,
          labelPadding: const EdgeInsets.symmetric(
            vertical: DesignTokens.sizeXS,
            horizontal: DesignTokens.sizeS,
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
                  _filters.add(filtro);
                }
              } else {
                _filters.removeWhere((String name) {
                  return name == filtro;
                });
              }
              print(_filters);
            });
          },
        );
      }).toList(),
    );
  }
}
