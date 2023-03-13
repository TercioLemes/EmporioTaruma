import 'package:emporio_taruma/source/utils/color.dart';
import 'package:emporio_taruma/source/utils/size.dart';
import 'package:flutter/material.dart';

const double borderSideSize = 0.5;

class ListItem extends StatelessWidget {
  const ListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 232,
      height: 80,
      child: Material(
        color: CustomColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignTokens.sizeSM),
          side: const BorderSide(
            color: CustomColors.grey,
            width: borderSideSize,
          ),
        ),
        child: Row(
          children: [
            const Flexible(
              flex: 2,
              child: Image(
                  image:
                      'https://cdn.awsli.com.br/1000x1000/36/36210/produto/39529749/2860ce9326.jpg'),
            ),
            Flexible(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: DesignTokens.sizeS,
                  vertical: DesignTokens.sizeXS,
                ),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Frutas Cristalizadas atacado',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: DesignTokens.fontXS),
                        Text(
                          'Lote: 00011',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: DesignTokens.fontXS),
                        Text(
                          '23/05/2023',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Positioned(
                      right: -12,
                      bottom: -8,
                      child: PopupMenuButton(
                        splashRadius: DesignTokens.sizeL,
                        padding: EdgeInsets.zero,
                        itemBuilder: (BuildContext context) {
                          return [
                            PopupMenuItem(
                              value: '\Editar Produto',
                              child: const Text('Editar Produto'),
                              onTap: () {
                                Future.delayed(
                                  const Duration(seconds: 0),
                                  () => showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Editar Produto'),
                                      scrollable: true,
                                      content: Wrap(
                                        spacing: DesignTokens.sizeSM,
                                        runSpacing: DesignTokens.sizeL,
                                        children: List.generate(30, (index) {
                                          return ListItem();
                                        }),
                                      ),
                                      actions: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Material(
                                            child: Padding(
                                              padding: EdgeInsets.all(8),
                                              child: Text('Voltar'),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            const PopupMenuItem(
                              child: Text('Editar Lote'),
                            ),
                            const PopupMenuItem(
                              child: Text('Remover Lote'),
                            )
                          ];
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Image extends StatelessWidget {
  const Image({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(DesignTokens.sizeSM),
        topRight: Radius.circular(DesignTokens.sizeSM),
      ),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(DesignTokens.sizeSM),
            bottomLeft: Radius.circular(DesignTokens.sizeSM),
          ),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(image),
          ),
        ),
      ),
    );
  }
}
