import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/domain/usecases/home/home_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/domain/usecases/home/home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;
  const HomePage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.snackbar(
                "Notification",
                "This is a sample action!",
                backgroundColor: Colors.purple,
                colorText: Colors.white,
              );
            },
            icon: const Icon(Icons.notifications, color: Colors.white),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator(color: Colors.purple));
        }

        if (controller.filteredMovies.isEmpty) {
          return const Center(
            child: Text(
              "No movies found",
              style: TextStyle(color: Colors.white),
            ),
          );
        }

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Banner section
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 230,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          controller.filteredMovies.first['poster'] ??
                              'https://via.placeholder.com/800x400', // fallback
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 16,
                    top: 16,
                    child: Text(
                      'IMBOXO',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        letterSpacing: 3,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 16,
                    top: 16,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/9919?v=4', // example profile image
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),


              const SizedBox(height: 16),

              // Latest Releases Section
              _sectionTitle("Latest Releases"),
              _movieList(controller.filteredMovies),

              const SizedBox(height: 24),

              // Trending Now Section
              _sectionTitle("Trending Now"),
              _movieList(controller.filteredMovies.reversed.toList()),

              const SizedBox(height: 80),
            ],
          ),
        );
      }),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _movieList(List<Map<String, dynamic>> movies) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return GestureDetector(
            onTap: () {
              Get.to(() => DetailsPage(itemIndex: index));
            },
            child: _movieThumbnail(movie['thumbnail'] ?? ''),
          );
        },
      ),
    );
  }

  Widget _movieThumbnail(String url) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage(
            url.isNotEmpty ? url : 'https://via.placeholder.com/100x150',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final int itemIndex;
  const DetailsPage({super.key, required this.itemIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Item $itemIndex"),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text(
          "Details of Item $itemIndex",
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
