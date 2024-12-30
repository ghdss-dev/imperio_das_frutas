import 'package:flutter/material.dart';

import '../../config/app_data.dart' as appData;
import '../../config/app_data.dart';
import '../auth/components/item_tile.dart';
import 'components/category_tile.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  String selectedCategory = 'executivos';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text.rich(
          TextSpan(
            style: const TextStyle(fontSize: 30),
            children: [
              TextSpan(
                text: 'Pontal',
                style: TextStyle(color: Colors.green), // Cor do título
              ),
              const TextSpan(
                text: 'Delivery',
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 15),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                backgroundColor: Colors.red,
                label: const Text(
                  '0',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Barra de pesquisa
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                hintText: 'Pesquise aqui ...',
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 14,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.green,
                  size: 21,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(60),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Lista de categorias abaixo da barra de pesquisa
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: appData.categories.asMap().entries.map((entry) {

                    final index = entry.key; // O índice
                    final category = entry.value; // O valor da categoria

                    return CategoryTile(

                      category: appData.categories[index],
                      isSelected: appData.categories[index] == selectedCategory,

                      onPressed: () {
                        setState(() {
                          selectedCategory = appData.categories[index];
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
          ),

          // Conteúdo adicional (se houver)
          /*Expanded(
            child: Center(
              child: Text(
                'Conteúdo da categoria: $selectedCategory',
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ),*/
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing:10,
                crossAxisSpacing: 10,
                childAspectRatio: 9 / 11.5
              ),
              itemCount: appData.items.length,
              itemBuilder: (_, index) {
                return ItemTile(
                  item: appData.items[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
