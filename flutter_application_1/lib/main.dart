import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int indexNow = 0;

  final List<Map<String, String>> carouselItems = [
    {'imageUrl': 'assets/thai.jpg', 'title': 'Thai Style', 'description': '12 Places'},
    {'imageUrl': 'assets/thai.jpg', 'title': 'Thai Style', 'description': '12 Places'},
    {'imageUrl': 'assets/thai.jpg', 'title': 'Thai Style', 'description': '12 Places'},
  ];

  final List<List<Map<String, dynamic>>> smallCardsList = [
    [
      {'imageUrl': 'assets/thai.jpg', 'title': 'KFC Broadway', 'subtitles': ['122 Queen Street', 'Fried Chicken, American']},
      {'imageUrl': 'assets/thai.jpg', 'title': 'KFC Broadway', 'subtitles': ['122 Queen Street', 'Fried Chicken, American']},
      {'imageUrl': 'assets/thai.jpg', 'title': 'KFC Broadway', 'subtitles': ['122 Queen Street', 'Fried Chicken, American']},
      {'imageUrl': 'assets/thai.jpg', 'title': 'KFC Broadway', 'subtitles': ['122 Queen Street', 'Fried Chicken, American']},
      {'imageUrl': 'assets/thai.jpg', 'title': 'KFC Broadway', 'subtitles': ['122 Queen Street', 'Fried Chicken, American']},
    ],
    [
      {'imageUrl': 'assets/thai.jpg', 'title': 'KFC Broadway', 'subtitles': ['122 Queen Street', 'Fried Chicken, American']},
      {'imageUrl': 'assets/thai.jpg', 'title': 'KFC Broadway', 'subtitles': ['122 Queen Street', 'Fried Chicken, American']},
      {'imageUrl': 'assets/thai.jpg', 'title': 'KFC Broadway', 'subtitles': ['122 Queen Street', 'Fried Chicken, American']},
      {'imageUrl': 'assets/thai.jpg', 'title': 'KFC Broadway', 'subtitles': ['122 Queen Street', 'Fried Chicken, American']},
      {'imageUrl': 'assets/thai.jpg', 'title': 'KFC Broadway', 'subtitles': ['122 Queen Street', 'Fried Chicken, American']},
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My First App",
      home: MainPage(
        carouselItems: carouselItems,
        smallCardsList: smallCardsList,
        currentIndex: indexNow,
        onTabTapped: (index) {
          setState(() {
            indexNow = index;
          });
        },
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  final List<Map<String, String>> carouselItems;
  final List<List<Map<String, dynamic>>> smallCardsList;
  final int currentIndex;
  final Function(int) onTabTapped;

  const MainPage({
    Key? key,
    required this.carouselItems,
    required this.smallCardsList,
    required this.currentIndex,
    required this.onTabTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Text(
          "Sydney CBD",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Search for restaurants...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        prefixIcon: const Icon(Icons.search),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 300,
              child: PageView.builder(
                itemCount: carouselItems.length,
                itemBuilder: (context, index) {
                  return CarouselItem(
                    imageUrl: carouselItems[index]['imageUrl']!,
                    title: carouselItems[index]['title']!,
                    description: carouselItems[index]['description']!,
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Most Popular",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SeeAllPage(
                                smallCards: smallCardsList[0],
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          "See All",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: smallCardsList[0].length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return SmallCard(
                          imageUrl: smallCardsList[0][index]['imageUrl']!,
                          title: smallCardsList[0][index]['title']!,
                          subtitles: List<String>.from(smallCardsList[0][index]['subtitles'] ?? []),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Meal Deals",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SeeAllPage(
                                smallCards: smallCardsList[1],
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          "See All",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: smallCardsList[1].length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return SmallCard(
                          imageUrl: smallCardsList[1][index]['imageUrl']!,
                          title: smallCardsList[1][index]['title']!,
                          subtitles: List<String>.from(smallCardsList[1][index]['subtitles'] ?? []),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Settings", icon: Icon(Icons.settings)),
          BottomNavigationBarItem(label: "Info", icon: Icon(Icons.info)),
          BottomNavigationBarItem(label: "Favorites", icon: Icon(Icons.favorite)),
          BottomNavigationBarItem(label: "Help", icon: Icon(Icons.help))
        ],
        currentIndex: currentIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey[350],
        onTap: onTabTapped,
      ),
    );
  }
}

class SeeAllPage extends StatelessWidget {
  final List<Map<String, dynamic>> smallCards;

  const SeeAllPage({Key? key, required this.smallCards}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Items"),
      ),
      body: ListView.builder(
        itemCount: smallCards.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(
                          smallCards[index]['imageUrl']!,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          smallCards[index]['title']!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        for (var subtitle in smallCards[index]['subtitles'] ?? [])
                          Text(
                            subtitle,
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CarouselItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  const CarouselItem({
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[300],
      ),
      child: Stack(
        children: [
          Image.network(
            imageUrl,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 8,
            bottom: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SmallCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final List<String> subtitles;

  const SmallCard({
    required this.imageUrl,
    required this.title,
    required this.subtitles,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[300],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            width: double.infinity,
            height: 85,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 0),
                for (var subtitle in subtitles)
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
