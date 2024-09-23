import 'package:flutter/material.dart';

void main() {
  runApp(GameStoreApp());
}

class GameStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GameStore',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GameStoreScreen(),
    );
  }
}

class GameStoreScreen extends StatelessWidget {
  // Список игр
  final List<Game> games = [
    Game('Forza Horizon 4', 'assets/forza.jpg', 49.99, 'Гоночная игра в открытом мире.'),
    Game('Stardew Valley', 'assets/stardew_valley.jpg', 14.99, 'Симулятор фермы и ролевой игры.'),
    Game('GTA 5', 'assets/gta5.jpg', 29.99, 'Популярная криминальная экшен-игра.'),
    Game('Metro Exodus', 'assets/metro_exodus.jpg', 39.99, 'Шутер с элементами выживания в постапокалиптической России.')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GameStore'),
      ),
      body: ListView.builder(
        itemCount: games.length,
        itemBuilder: (context, index) {
          final game = games[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Image.asset(game.imagePath, width: 100),
              title: Text(game.name),
              subtitle: Text('${game.price} \$'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GameDetailScreen(game: game),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// Модель игры
class Game {
  final String name;
  final String imagePath;
  final double price;
  final String description;

  Game(this.name, this.imagePath, this.price, this.description);
}

class GameDetailScreen extends StatelessWidget {
  final Game game;

  GameDetailScreen({required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(game.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(game.imagePath, width: 300, height: 200),
            SizedBox(height: 20),
            Text(
              game.description,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              '${game.price} \$',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
