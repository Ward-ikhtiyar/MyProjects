import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Model>(builder: (context, model, child) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            showSearch(context: context, delegate: search());
          },
          child: const Icon(
            Icons.favorite,
            color: Colors.white,
          ),
        ),
        ////////////////////////////////////APPBAR//////////////////////////////
        appBar: AppBar(
          bottom: TabBar(
              labelStyle: const TextStyle(color: Colors.white),
              indicatorColor: Colors.white,
              controller: tabController,
              tabs: const [
                Tab(
                  child: Text("Products"),
                ),
                Tab(
                  child: Text("Stores"),
                ),
              ]),
          elevation: 0.2,
          backgroundColor: Colors.black,
          shadowColor: Colors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "SpeedOrder",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                  height: 42,
                  width: context.read<Model>().screenWidth(context) * 0.55,
                  child: TextField(
                    onTap: () {
                      showSearch(context: context, delegate: search());
                    },
                    canRequestFocus: false,
                    textAlignVertical: TextAlignVertical.bottom,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        focusColor: Colors.white,
                        hintText: "Search",
                        hintStyle: TextStyle(fontSize: 20),
                        prefixIcon: Icon(Icons.search),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        )),
                  ))
            ],
          ),
        ),
        //////////////////////////BODY//////////////////////////////////////////
        body: Container(), ////////////////SHOULD BE TABBARVIEW
      );
    });
  }
}

//////////////////////////SEARCH DELEGATE///////////////////////////////////////
class search extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.backspace_outlined),
        color: Colors.black,
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(Icons.arrow_back),
      color: Colors.black,
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}

///////////////////////////////////PRODUCTS TAB/////////////////////////////////
class ProductsTab extends StatefulWidget {
  const ProductsTab({super.key});

  @override
  State<ProductsTab> createState() => _ProductsTabState();
}

class _ProductsTabState extends State<ProductsTab> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

/////////////////////////////STORES TAB/////////////////////////////////////////
class StoresTab extends StatefulWidget {
  const StoresTab({super.key});

  @override
  State<StoresTab> createState() => _StoresTabState();
}

class _StoresTabState extends State<StoresTab> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
