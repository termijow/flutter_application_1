import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Login_screen.dart';
import 'package:flutter_application_1/screens/register.dart';
import 'package:flutter_application_1/screens/welcome.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_) => WelcomeScreen(),
        '/login': (_) => LoginScreen.init(context),
        '/register': (_) => RegisterScreen(),
      },
    );
  }
}

// elementos basicos
//
class HomeScreenElementsBasics extends StatelessWidget {
  const HomeScreenElementsBasics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Center(child: Text('Mi primer aplicacion')),
        title: Text(
          'Mi primer aplicacion',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: Colors.blue,
        //backgroundColor: Color(0xFF9598CC),
        centerTitle: true,
        //leading: Icon(Icons.menu, size: 14, color: Colors.white),
        actions: [
          Icon(Icons.person, color: Colors.red, size: 30),
          Icon(Icons.settings, color: Color(0xFFB839DB), size: 15),
        ],
      ),
      drawer: Drawer(child: Center(child: Text('Hola soy un drawer'))),
      body: Center(
        child: Container(
          //color: Colors.red solo se usa cuando no llamamos al decoration
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.red,
            //shape: BoxShape.circle, circulo
            //borderRadius: BorderRadius.circular(20),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              bottomRight: Radius.circular(100),
            ),
            border: Border.all(color: Colors.purple, width: 10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.5),
                spreadRadius: 1,
                blurRadius: 20,
                offset: Offset(20, -10), // mover la posision de la sombra
              ),
            ],
            gradient: LinearGradient(
              colors: [
                Colors.red,
                Colors.pink,
                Colors.yellow,
                Colors.orange,
                Colors.purple,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

// Interfaces Dinamicas
class InterfaDinamic extends StatelessWidget {
  const InterfaDinamic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // MediaQuery.of(context).size.width;
        color: Colors.blue[100],
        width: double.infinity,
        child: Column(
          //aliniacion de los elementos en horizontal
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //Alinacion de los elementos en vertical
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hola soy un Scaffold'),
            Icon(Icons.person),
            Container(width: 200, height: 200, color: Colors.pink),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              color: Colors.purple,
              child: Row(
                children: [
                  Image.network(
                    'https://flutter.dev/assets/shadow-dash.d59d0e8266b087a7a7f8a61c50ad4f6e.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/imagen1.png",
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                  // el expanded me permite tomar todo el espacio disponible solo y solo si estoy en un column o un row
                  Expanded(child: Container(color: Colors.blue)),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.cyan,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Container(
                        width: 200,
                        height: 200,
                        color: Colors.red,
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 150,
                      alignment: Alignment.center,
                      color: Colors.yellow,
                      child: Image.asset(
                        "assets/imagen1.png",
                        width: 50,
                        height: 50,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 50,
                        height: 50,
                        color: Colors.white,
                      ),
                    ),
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

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Store',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.settings, color: Colors.white),
          ),
          //SizedBox(width: 10,)
        ],
      ),
      drawer: Drawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: SingleChildScrollView(
          // physics: NeverScrollableScrollPhysics(),
          physics: BouncingScrollPhysics(),
          // physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(border: Border.all(color: Colors.blue), color: Colors.blue[100], borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Image.network(
                      'https://refurbi.com.co/cdn/shop/files/13_pro_azul_acd28368-565a-4ef8-a75b-43d5984ffb5c.webp?v=1731093820',
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Iphone 13 Pro'
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(color: Colors.blue),
                                    child: Text('Disponible',
                                    style: TextStyle(color: Colors.white),),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',maxLines: 2,overflow: TextOverflow.ellipsis,),
                            ],
                          ),
          
                          Padding(
                            // aplicar un padding a la derecha y abajo
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Text('precio: \$3.000.000'),
                              Container(
                                decoration: BoxDecoration(color: Colors.blue,
                                borderRadius: BorderRadius.circular(5)),
                                child:Text('ver detalle',style: TextStyle(color: Colors.white),),
                              )
                            ],),
                          )
          
          
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(border: Border.all(color: Colors.blue), color: Colors.blue[100]),
                child: Row(
                  children: [
                    Image.network(
                      'https://refurbi.com.co/cdn/shop/files/13_pro_azul_acd28368-565a-4ef8-a75b-43d5984ffb5c.webp?v=1731093820',
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Iphone 13 Pro'
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(color: Colors.blue),
                                    child: Text('Disponible',
                                    style: TextStyle(color: Colors.white),),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',maxLines: 2,overflow: TextOverflow.ellipsis,),
                            ],
                          ),
          
                          Padding(
                            // aplicar un padding a la derecha y abajo
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Text('precio: \$3.000.000'),
                              Container(
                                decoration: BoxDecoration(color: Colors.blue,
                                borderRadius: BorderRadius.circular(5)),
                                child:Text('ver detalle',style: TextStyle(color: Colors.white),),
                              )
                            ],),
                          )
          
          
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(border: Border.all(color: Colors.blue), color: Colors.blue[100]),
                child: Row(
                  children: [
                    Image.network(
                      'https://refurbi.com.co/cdn/shop/files/13_pro_azul_acd28368-565a-4ef8-a75b-43d5984ffb5c.webp?v=1731093820',
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Iphone 13 Pro'
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(color: Colors.blue),
                                    child: Text('Disponible',
                                    style: TextStyle(color: Colors.white),),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',maxLines: 2,overflow: TextOverflow.ellipsis,),
                            ],
                          ),
          
                          Padding(
                            // aplicar un padding a la derecha y abajo
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Text('precio: \$3.000.000'),
                              Container(
                                decoration: BoxDecoration(color: Colors.blue,
                                borderRadius: BorderRadius.circular(5)),
                                child:Text('ver detalle',style: TextStyle(color: Colors.white),),
                              )
                            ],),
                          )
          
          
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(border: Border.all(color: Colors.blue), color: Colors.blue[100]),
                child: Row(
                  children: [
                    Image.network(
                      'https://refurbi.com.co/cdn/shop/files/13_pro_azul_acd28368-565a-4ef8-a75b-43d5984ffb5c.webp?v=1731093820',
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Iphone 13 Pro'
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(color: Colors.blue),
                                    child: Text('Disponible',
                                    style: TextStyle(color: Colors.white),),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',maxLines: 2,overflow: TextOverflow.ellipsis,),
                            ],
                          ),
          
                          Padding(
                            // aplicar un padding a la derecha y abajo
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Text('precio: \$3.000.000'),
                              Container(
                                decoration: BoxDecoration(color: Colors.blue,
                                borderRadius: BorderRadius.circular(5)),
                                child:Text('ver detalle',style: TextStyle(color: Colors.white),),
                              )
                            ],),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Shopping cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}