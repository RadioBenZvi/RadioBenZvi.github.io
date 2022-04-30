import 'package:flutter/material.dart';

class ImageWidgetPlaceholder extends StatelessWidget 
{
    final ImageProvider image;
    final Widget placeholder;
    final int width;
    final int height;
    final BoxFit fit;

    const ImageWidgetPlaceholder({Key? key, required this.image, required this.placeholder, this.width = 100, this.height = 100, this.fit = BoxFit.contain})
        : super(key: key);

    @override
    Widget build(BuildContext context) 
    {
        return Image(
            image: image,
            width: double.tryParse(width.toString()),
            height: double.tryParse(height.toString()),
            fit: fit,
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                if (wasSynchronouslyLoaded) 
                {
                    return child;
                } 
                else 
                {
                    return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        child: frame != null ? child : placeholder
                    );
                }
            }
        );
    }
}