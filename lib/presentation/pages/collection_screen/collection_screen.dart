import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:untitled/domain/usecases/collection/collection_controller.dart';
import 'package:flutter/material.dart';
import 'package:untitled/domain/usecases/home/home_controller.dart';

class CollectionsPage extends StatelessWidget {
  final HomeController controller;
  CollectionsPage({super.key, required this.controller});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
              ),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Top bar
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                          },
                          child: Icon(Icons.arrow_back, color: Colors.white),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Collections',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.notifications_none,
                          color: Colors.white,
                          size: 26,
                        ),
                        SizedBox(width: 10),
                        CircleAvatar(
                          radius: 18,
                          backgroundImage: NetworkImage(
                            'https://i.pravatar.cc/150?img=3',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // 🔹 Category Tabs (Languages)
              // Replace this part inside your Column:

              // 🔹 Category Tabs (Languages)
              SizedBox(
                height: 40,
                child: Obx(
                  () => ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.languages.length,
                    itemBuilder: (context, index) {
                      final lang = controller.languages[index];
                      final isSelected = controller.selectedLanguage.value == lang;

                      return GestureDetector(
                        onTap: () => controller.selectLanguage(lang),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Chip(
                            key: ValueKey(lang),
                            label: Text(
                              lang,
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.grey,
                              ),
                            ),
                            backgroundColor: isSelected
                                ? Colors.purple
                                : Colors.transparent,
                            side: BorderSide(
                              color: isSelected ? Colors.purple : Colors.grey,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              SizedBox(height: 10),

              // 🔹 Movies Grid (Filtered by selected language)
              Expanded(
                child: Obx(
                      () => StaggeredGridView.countBuilder(
                    crossAxisCount: 4, // Number of columns in grid
                    itemCount: controller.filteredMovies.length,
                    itemBuilder: (context, index) {
                      final movie = controller.filteredMovies[index];
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          movie['thumbnail'] ?? '',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[800],
                              child: Icon(
                                Icons.broken_image,
                                color: Colors.white54,
                              ),
                            );
                          },
                        ),
                      );
                    },
                    staggeredTileBuilder: (index) {
                      // Make odd items big, even items small (or vice versa)
                      return StaggeredTile.count(
                        (index % 3 == 0) ? 4 : 2, // width in columns (4 means full width, 2 means half width)
                        (index % 3 == 0) ? 3 : 2, // height in rows (3 rows tall or 2 rows tall)
                      );
                    },
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                ),
              ),

            ],
          );
        }),
      ),
    );
  }
}
