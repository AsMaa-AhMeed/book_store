import 'package:book_store/screens/home_screen.dart';
import 'package:book_store/shared/book_list.dart';
import 'package:book_store/shared/shared_color.dart';
import 'package:flutter/material.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            icon: const Icon(Icons.arrow_back, color: Colors.black)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.turned_in, color: Colors.black))
        ],
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                  height: 320,
                  child: ListView.builder(
                      itemCount: bookList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return bookSection(
                            txt2: bookList2[index].subTitle,
                            url: bookList2[index].img,
                            txt: bookList2[index].title);
                      })),
              Text(
                  '\nNow a major new Netflix film from Noah Baumbach, starring Adam Driver and Greta Gerwig',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: SharedColors.darkPrimaryColor)),
              const SizedBox(height: 10),
              Row(
                children: const [
                  Text('Dec 20,2022'),
                  SizedBox(width: 20),
                  Chip(
                      backgroundColor: Color(0xffEEF4FF),
                      label: Text("History",
                          style:
                              TextStyle(color: SharedColors.darkPrimaryColor)))
                ],
              ),
              const SizedBox(height: 10),
              Text(
                  '''How strange it is. We have these deep terrible lingering fears about ourselves and the people we love. Yet we walk around, talk to people, eat and drink. We manage to function. The feelings are deep and real. Shouldn\’t they paralyze us?\n\nWhite Noise is an effortless combination of social satire and metaphysical dilemma in which Don DeLillo exposes our rampant consumerism, media saturation and novelty intellectualism.\n\n It captures the particular strangeness of life lived when the fear of death cannot be denied, repressed or obscured and ponders the role of the family in a time when the very meaning of our existence is under threat.
\n\nAn astonishing novel . . . unforgettable . . . nearly every page crackles with memorable moments and perfectly turned phrases . . . dizzying, darkly beautiful fiction.''',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 18))
            ],
          ),
        )
      ]),
    );
  }
}
