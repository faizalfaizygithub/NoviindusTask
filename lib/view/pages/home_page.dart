import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/controller/provider/home_provider.dart';
import 'package:task/view/pages/add_feeds_page.dart';
import 'package:task/view/widgets/exploreTile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeProvider>(context, listen: false).fetchHomeList();
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(children: [
                appBarSection(),
                Consumer<HomeProvider>(
                  builder: (context, value, child) => Container(
                    child: Column(
                      children: [
                        TabBar(
                            isScrollable: true,
                            dividerColor: Colors.black,
                            labelColor: Colors.white,
                            indicator: const BoxDecoration(color: Colors.black),
                            unselectedLabelColor: Colors.grey,
                            controller: tabController,
                            tabs: [
                              Tab(
                                child: categoryList('Explore'),
                              ),
                              Tab(child: categoryList('Trending')),
                              Tab(child: categoryList('AllCategories')),
                            ]),
                        SizedBox(
                            height: 500,
                            child: TabBarView(
                                controller: tabController,
                                children: [
                                  ListView.builder(
                                      itemCount: value.resultList!.length,
                                      itemBuilder: (context, index) {
                                        return ExploreTile(
                                          result: value.resultList![index],
                                        );
                                      }),
                                  const Text(
                                    'trending',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  const Text(
                                    'All Categories',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ]))
                      ],
                    ),
                  ),
                )
              ]),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50))),
            foregroundColor: Colors.white,
            backgroundColor: Colors.red,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const AddFeedsPage();
              }));
            },
            child: const Icon(
              Icons.add,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }

  categoryList(String text) {
    return Container(
      padding: const EdgeInsets.all(2),
      height: 30,
      width: 120,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 8, color: Colors.white),
        ),
      ),
    );
  }
}

appBarSection() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Hello Maria',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold)),
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKj6_ypDu7K10R2a_TAKjTiuO6MiXXMU9f1Q&s'),
          ),
        ],
      ),
      Text(
        'Welcome back to Section',
        style: TextStyle(color: Colors.white70, fontSize: 10),
      ),
    ],
  );
}
