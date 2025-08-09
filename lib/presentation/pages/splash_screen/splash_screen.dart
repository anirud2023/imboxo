import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/domain/usecases/splash/splash_controller.dart';
import 'package:untitled/presentation/common_widgets/imboxo_logo.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final SplashController controller = Get.find();


    return Scaffold(
      body: Stack(
        children: [
          // Black gradient background from top to bottom
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Color(0xFF111111),
                    Colors.black,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),

          // Haphazard positioned poster images (larger size)
          ...[
            const Positioned(
              top: 60,
              left: 30,
              child: _PosterImage(path: 'assets/images/poster1.webp'),
            ),
            const Positioned(
              top: 160,
              right: 40,
              child: _PosterImage(path: 'assets/images/poster2.webp'),
            ),
            const Positioned(
              bottom: 160,
              left: 50,
              child: _PosterImage(path: 'assets/images/poster3.webp'),
            ),
            const Positioned(
              bottom: 80,
              right: 30,
              child: _PosterImage(path: 'assets/images/poster4.webp'),
            ),
          ],

          // Centered app name (transparent box with white border & white text)
          Center(
            child: ImboxoLogo(
              fontSize: 40,
              borderColor: Colors.white,
              textColor: Colors.white,
            ),
          ),





          // Bottom black gradient overlay (optional if top to bottom already used)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 150,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black87,
                    Colors.black,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PosterImage extends StatelessWidget {
  final String path;

  const _PosterImage({required this.path});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.25,
      child: SizedBox(
        height: 250,
        width: 150,
        child: Image.asset(path, fit: BoxFit.cover),
      ),
    );
  }
}
