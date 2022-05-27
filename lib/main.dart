import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _getContainerCarro({required String nomeCarro, required String textoCarro, required String urlImage}) {
    return GestureDetector(
      onTap: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(nomeCarro, style: TextStyle(fontSize: 30)),
          content: Text(textoCarro, style: TextStyle(fontSize: 22),),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('Comprar'),
            ),
          ],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Container(
          width: 200,
          height: 100,
          child: Image.network(
            urlImage,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MECHANIC ",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black87,
        leading: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            SizedBox(
              height: 355,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: PageView(scrollDirection: Axis.horizontal, controller: controller, children: [
                  Image.network('https://i.pinimg.com/originals/89/5e/68/895e68b091756a9e1451224fe81ca5a4.png', fit: BoxFit.fill), //Mechanic
                  Image.network('https://wallpaperaccess.com/full/3603286.jpg', fit: BoxFit.cover), //Supra
                  Image.network('https://wallpaperaccess.com/full/3894581.jpg', fit: BoxFit.cover), //Skyline
                  Image.network('https://wallpaperaccess.com/full/486864.jpg', fit: BoxFit.cover), //Tesla
                  Image.network('https://wallpaperaccess.com/full/1553983.jpg', fit: BoxFit.cover), //Fusca
                  Image.network('https://wallpaperaccess.com/full/1554005.jpg', fit: BoxFit.cover), // Kombi
                ]),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Row(
                  children: [
                    _getContainerCarro(nomeCarro: 'Skyline R34 - Blue', textoCarro: 'O R34 mais rapido da Jamaica', urlImage: 'https://wallpaperaccess.com/full/3894581.jpg'),
                    const Text(
                      "Skyline R34 - Blue",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontStyle: FontStyle.italic, wordSpacing: 1.5),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    _getContainerCarro(nomeCarro: 'Supra - White', textoCarro: 'O Supra mais rapido do Imperio Japonês', urlImage: 'https://wallpaperaccess.com/full/3603286.jpg'),
                    const Text(
                      "Supra - White",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontStyle: FontStyle.italic, wordSpacing: 1.5),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    _getContainerCarro(nomeCarro: 'Tesla Model 3 - Red', textoCarro: 'Apenas um Tesla vermei', urlImage: 'https://wallpaperaccess.com/full/486864.jpg'),
                    const Text(
                      "Tesla Model 3 - Red",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontStyle: FontStyle.italic, wordSpacing: 1.5),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    _getContainerCarro(nomeCarro: 'Fuscão - Green', textoCarro: 'O Fuscão mais verde da India', urlImage: 'https://wallpaperaccess.com/full/1553983.jpg'),
                    const Text(
                      "Fuscão - Green",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontStyle: FontStyle.italic, wordSpacing: 1.5),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    _getContainerCarro(nomeCarro: 'Kombin - Green', textoCarro: 'O Kombin mais velho da Guatemala', urlImage: 'https://wallpaperaccess.com/full/1554005.jpg'),
                    const Text(
                      "Kombin - Green",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontStyle: FontStyle.italic, wordSpacing: 1.5),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}