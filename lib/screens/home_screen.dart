import 'package:book_store/models/book_data_model.dart';
import 'package:book_store/models/book_model.dart';
import 'package:book_store/repository/book_repo_model.dart';
import 'package:book_store/screens/book_details.dart';
import 'package:book_store/shared/book_list.dart';
import 'package:book_store/shared/shared_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 7,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
            ),
            elevation: 0.0,
            backgroundColor: Colors.white,
            toolbarHeight: 180,
            //leading: Icon(Icons.dehaze),
            title: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Welcome back, Asmaa!',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: SharedColors.darkGreyColor, fontSize: 18)),
                    Text('What do you want to read today?',
                        style: TextStyle(
                            color: SharedColors.blackColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w500)),
                    SizedBox(height: 20)
                  ],
                ),
                subtitle: const TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search,
                            color: SharedColors.primaryColor),
                        suffixIcon:
                            Icon(Icons.mic, color: SharedColors.primaryColor),
                        hintText: 'Search',
                        filled: true,
                        fillColor: SharedColors.lightColor,
                        focusColor: SharedColors.primaryColor,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: SharedColors.lightColor),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: SharedColors.primaryColor),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))))),
            bottom: const TabBar(
              labelColor:
                  SharedColors.darkPrimaryColor, //<-- selected text color
              unselectedLabelColor: SharedColors.darkGreyColor,
              indicatorColor: SharedColors.darkPrimaryColor,
              isScrollable: true,
              //  indicatorWeight: 3,
              tabs: <Tab>[
                Tab(text: 'Novel'),
                Tab(text: 'Science'),
                Tab(text: 'History'),
                Tab(text: 'Romance'),
                Tab(text: 'Biography'),
                Tab(text: 'Sports'),
                Tab(text: 'Poetry'),
              ],
            ),
          ),
          body: ListView(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 320,
                    child: TabBarView(
                      children: [
                        _tabBarSection(bookList: bookList),
                        FutureBuilder<List<Book>>(
                            future: BookRepository().getBookData(),
                            builder: (context, snapshot) {
                              final bookData = snapshot.data;
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const SizedBox(
                                    height: 100,
                                    child: Center(
                                        child: CircularProgressIndicator()));
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return _tabBarSection2(bookData: bookData);
                              }
                              return const Text('Page Loading');
                            }),
                        //   _tabBarSection(bookList: bookList),

                        _tabBarSection(bookList: bookList3),
                        _tabBarSection(bookList: bookList4),
                        _tabBarSection(bookList: bookList5),
                        _tabBarSection(bookList: bookList6),
                        _tabBarSection(bookList: bookList3),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _titleSection('New Arrival'),
                      _tabBarSection(bookList: bookList2),
                      _titleSection('Best Seller'),
                      _tabBarSection(bookList: bookList3),
                      _titleSection('Recommeded Books'),
                      _tabBarSection(bookList: bookList4),
                      _titleSection('Featured Books'),
                      _tabBarSection(bookList: bookList5),
                      _titleSection('Trending Books'),
                      _tabBarSection(bookList: bookList6),
                    ],
                  )
                ],
              ),
            ),
          ]),
        ));
  }
}

_titleSection(String txt) {
  return ListTile(
    onTap: (() {}),
    leading: Text(
      txt,
      textAlign: TextAlign.left,
      style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: SharedColors.darkPrimaryColor),
    ),
    trailing: const Text('See More',
        style: TextStyle(
            fontWeight: FontWeight.w700, color: SharedColors.priceColor)),
  );
}

SizedBox _tabBarSection2({List<Book>? bookData}) {
  return SizedBox(
      height: 320,
      child: ListView.builder(
          itemCount: bookData?.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BookDetails()));
              }),
              child: bookSection2(
                  txt2: bookData?[index].subtitle,
                  url: bookData?[index].image,
                  txt: bookData?[index].title),
            );
          }));
}

SizedBox _tabBarSection({List<BookModel>? bookList}) {
  return SizedBox(
      height: 320,
      child: ListView.builder(
          itemCount: bookList!.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BookDetails()));
              }),
              child: bookSection(
                  txt2: bookList[index].subTitle,
                  url: bookList[index].img,
                  txt: bookList[index].title),
            );
          }));
}

Container bookSection2({String? url, String? txt, String? txt2}) {
  return Container(
      margin: const EdgeInsets.all(10),
      height: 300,
      width: 170,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.network(url!,
                fit: BoxFit.cover, width: double.infinity, height: 220)),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 10),
          child: Text(
            txt!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            txt2!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: SharedColors.darkGreyColor),
          ),
        ),
      ]));
}

Container bookSection({String? url, String? txt, String? txt2}) {
  return Container(
      margin: const EdgeInsets.all(10),
      height: 300,
      width: 170,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.network(url!,
                fit: BoxFit.cover, width: double.infinity, height: 240)),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 10),
          child: Text(
            txt!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            txt2!,
            style: const TextStyle(color: SharedColors.darkGreyColor),
          ),
        ),
      ]));
}
