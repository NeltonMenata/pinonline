import 'package:flutter/material.dart';

class CanalizadorView extends StatelessWidget {
  const CanalizadorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  //  color: Colors.blue,
                  ),
              height: MediaQuery.of(context).size.height * 0.3,
              child: Center(
                child: Row(children: [
                  Spacer(),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.28,
                    width: 10,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(15)),
                      color: Colors.orange,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.96,
                    height: MediaQuery.of(context).size.height * 0.28,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.horizontal(right: Radius.circular(15)),
                        color: Colors.green),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [Colors.green, Colors.blue]),
                              color: Colors.black38,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                              ),
                            ),
                            child: Image.network(
                              "https://z-m-scontent.flad4-1.fna.fbcdn.net/v/t1.6435-9/fr/cp0/e15/q65/218271205_349478283509000_3028249886665315534_n.jpg?_nc_cat=106&ccb=1-3&_nc_sid=85a577&efg=eyJpIjoibyJ9&_nc_eui2=AeF7XKRDN4AEWBmaquM9pW0POBFdOTuySng4EV05O7JKeFKbOhhm8_faPLGdGvwig4d7ieRKKh6ERumR4kUtL-kb&_nc_ohc=gjx98vzxzPcAX_OgA0R&_nc_ad=z-m&_nc_cid=1390&_nc_rml=0&_nc_ht=z-m-scontent.flad4-1.fna&oh=a46dfae2fcd542c917634c373c59f689&oe=611F47F0",
                              fit: BoxFit.fitHeight,
                              errorBuilder: (_, __, ___) {
                                return Text(
                                  "\n\n\nImagem não encontratada",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                );
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.96,
                          height:
                              MediaQuery.of(context).size.height * 0.28 * 0.2,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(15))),
                          child: Text(
                            "Meu Perfil",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                ]),
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView(
                children: [
                  Text(
                    "Canalizador",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                  ListTile(
                    title: Text("Adão Pedro"),
                    subtitle: Text("Técnico - Encanador"),
                  ),
                  ListTile(
                    title: Text("Contacto:"),
                    subtitle: Text("941357140 \nEmail: neltonmenataditec@gmail.com"),
                  ),
                  ListTile(
                    title: Text("Localização:"),
                    subtitle: Text("Angola - Luanda - São Paulo"),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      
                      height: 100, width: 100, color: Colors.amber),
                  )
                ],
              ),
            ),
            Container(
              height: 70,
              color: Colors.black54.withOpacity(0.3),
            )
          ],
        ),
      ),
    );
  }
}
