import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key});

  @override
  Widget build(BuildContext context) => Column(
    children: [
      CarouselSlider(
        options: CarouselOptions(height: 400.0),

        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        viewportFraction: 1.0,
        enableInfiniteScroll: true,
        onchange: (index, reason) {
          // Handle slide change if needed
        },
      );

        items: List.generate( 3 , (index)=>
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(s
              borderRadius: BorderRadius.circular(16.0),
              image: DecorationImage(
                image: NetworkImage('https://via.placeholder.com/800x400?text=Slide+${index + 1}'),
                fit: BoxFit.cover,
              ),
            ),
          )

   
        ),
      ),
    ],
    
  );
}
