import "package:flutter/material.dart";
import 'package:videogameslist/cards/game_card.dart';
import 'package:videogameslist/pages/game_page.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

class Article {
  final String url;
  final String title;
  final String urlImage;

  const Article(
      {required this.url, required this.title, required this.urlImage});
}

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  List<Article> articles = [];

  @override
  void initState() {
    super.initState();
    getWebsiteData();
  }

  Future getWebsiteData() async {
    final url = Uri.parse("https://gamefaqs.gamespot.com/games/topgamesrollup");
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);

    final titles = html
        .querySelectorAll("ol > li > div.content > a")
        .map((element) => element.innerHtml.trim())
        .toList();

    final urls = html
        .querySelectorAll("ol > li > div.content > a")
        .map((element) =>
            "https://gamefaqs.gamespot.com/${element.attributes["href"]}")
        .toList();
    final urlImage = html
        .querySelectorAll("div.list_img.img_small > img")
        .map((element) =>
            "https://gamefaqs.gamespot.com${element.attributes["src"]}")
        .toList();

    print("Count: ${titles.length}");
    for (final title in titles) {
      debugPrint(title);
    }

    setState(() {
      articles = List.generate(
          100,
          (index) => Article(
                title: titles[index],
                url: urls[index],
                urlImage: urlImage[index],
              ));
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        elevation: 10,
        title: const Text("Discover"),
        backgroundColor: Color(0xff121212),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: ((MediaQuery.of(context).size.width / 2.3) / 275),
          ),
          itemCount: articles.length,
          itemBuilder: (context, index) {
            final article = articles[index];
            return GestureDetector(
                child: GameCard(
                    title: article.title, thumbnailUrl: article.urlImage),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => GamePage(article.title),
                  ));
                });
          }));
}



          // body: GridView.count(
          //     crossAxisCount: 2,
          //     padding: EdgeInsets.only(right: 5, left: 5),
          //     childAspectRatio: ((MediaQuery.of(context).size.width / 2.3) / 275),
          //     children: [
          // GestureDetector(
          //     child: RecipeCard(
          //       title: 'Ni no Kuni: Wrath of the White Witch',
          //       thumbnailUrl:
          //           'https://images.nintendolife.com/6e74859c9a9dc/ni-no-kuni-wrath-of-the-white-witch-cover.cover_large.jpg',
          //     ),
          //     onTap: () {
          //       Navigator.of(context).push(MaterialPageRoute(
          //         builder: (context) => GamePage("Ni No Kuni"),
          //         settings: RouteSettings(
          //             arguments: 'Ni no Kuni: Wrath of the White Witch'),
          //       ));
          //     }),
          //       GestureDetector(
          //           child: RecipeCard(
          //             title: 'Xenoblade Chronicles: Definitive Edition',
          //             thumbnailUrl:
          //                 'https://m.media-amazon.com/images/I/71OitR7KnYL._SL1000_.jpg',
          //           ),
          //           onTap: () {
          //             Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                   builder: (context) => GamePage("Xenoblade"),
          //                   settings: RouteSettings(
          //                       arguments:
          //                           'Xenoblade Chronicles: Definitive Edition'),
          //                 ));
          //           }),
          //       GestureDetector(
          //           child: RecipeCard(
          //             title: 'Digimon Survive',
          //             thumbnailUrl:
          //                 'https://media.gamestop.com/i/gamestop/11095444',
          //           ),
          //           onTap: () {
          //             Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                   builder: (context) => GamePage("Digimon"),
          //                   settings: RouteSettings(arguments: 'Digimon Survive'),
          //                 ));
          //           }),
          //       GestureDetector(
          //           child: RecipeCard(
          //             title: 'Hades',
          //             thumbnailUrl:
          //                 'https://upload.wikimedia.org/wikipedia/en/c/cc/Hades_cover_art.jpg',
          //           ),
          //           onTap: () {
          //             Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                   builder: (context) => GamePage("Hades"),
          //                   settings: RouteSettings(arguments: 'Hades'),
          //                 ));
          //           }),
          //       GestureDetector(
          //           child: RecipeCard(
          //             title: 'A Hat in Time',
          //             thumbnailUrl:
          //                 'https://upload.wikimedia.org/wikipedia/en/2/2a/A_Hat_in_Time_cover_art.png',
          //           ),
          //           onTap: () {
          //             Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                   builder: (context) => GamePage("A Hat in Time"),
          //                   settings: RouteSettings(arguments: 'A Hat in Time'),
          //                 ));
          //           }),
          //       GestureDetector(
          //           child: RecipeCard(
          //             title: 'Stardew Valley',
          //             thumbnailUrl:
          //                 'https://upload.wikimedia.org/wikipedia/en/f/fd/Logo_of_Stardew_Valley.png',
          //           ),
          //           onTap: () {
          //             Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                   builder: (context) => GamePage("Stardew Valley"),
          //                   settings: RouteSettings(arguments: 'Stardew Valley'),
          //                 ));
          //           }),
          //     ])