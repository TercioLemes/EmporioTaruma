import 'package:flutter/material.dart';

const double topPadding = 50;
const double bottomPadding = 100;
const double leftPadding = 65;
const double rightPadding = 80;
const Color greenLight = Color(0XFF70F27D);

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(size);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: topPadding,
            //bottom: bottomPadding,
            left: leftPadding,
            right: rightPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Bar(),
              SizedBox(height: 60),
              MediaQuery.of(context).size.width < 800
                  ? Container(
                      color: Colors.green,
                      width: 200,
                      height: 100,
                    )
                  : Body(),
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(30),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.whatsapp,
                        size: 40,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(30),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.whatsapp,
                        size: 40,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(30),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.whatsapp,
                        size: 40,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(240),
            child: Image.network(
                'https://i0.wp.com/www.comexdobrasil.com/wp-content/uploads/2021/05/castanhas-varias.jpg?fit=695%2C455&ssl=1'),
          ),
        ),
        SizedBox(width: 60),
        Flexible(
          child: Column(
            children: [
              Row(
                children: [
                  Spacer(),
                  Column(
                    children: [
                      Text(
                        'Empório',
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Tarumã',
                        style: TextStyle(
                          fontSize: 86,
                          fontWeight: FontWeight.w700,
                          color: greenLight,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 24),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Cultivando vidas saudáveis com ',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    TextSpan(
                      text: 'o melhor da natureza',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Bar extends StatelessWidget {
  const Bar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 125,
          height: 87,
          color: Colors.greenAccent,
        ),
        Spacer(),
        TextButton(
          onPressed: () {},
          child: Text('Produtos'),
        ),
        SizedBox(width: 64),
        TextButton(
          onPressed: () {},
          child: Text('Sobre nós'),
        ),
        SizedBox(width: 64),
        TextButton(
          onPressed: () {},
          child: Text('Contato'),
        ),
        Spacer(),
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {},
          child: Row(
            children: [
              SizedBox(width: 5),
              Text('Login'),
              Icon(
                Icons.person_pin,
                size: 40,
              ),
            ],
          ),
        )
      ],
    );
  }
}
