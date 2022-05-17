// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';
import 'dart:async';

import 'package:radio_ben_zvi_website/pages/state_page.dart' as RBZPages;
import 'package:radio_ben_zvi_website/globals.dart' as g;

class ImageGalleryBackground extends RBZPages.Page 
{
    const ImageGalleryBackground({Key? key}) : super(key: key);

    @override
    State<ImageGalleryBackground> createState() => _ImageGalleryBackgroundState();
}

class _ImageGalleryBackgroundState extends State<ImageGalleryBackground> 
{
    int imageIndex = 0;
    int imageMax   = g.BGgalleryImages.length;
    Timer? timer;

    @override
    void initState() 
    {
        super.initState();
        timer = Timer.periodic(Duration(seconds: 5), (Timer t) { 
            setState(() { 
                imageIndex++;
                if (imageIndex >= imageMax) imageIndex = 0;
            }); 
        });
    }

    @override
    Widget build(BuildContext context)
    {
        return FlatButton(
            child: Container(
                width: double.infinity,
                height: 500,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(g.BGgalleryImages[imageIndex]),
                        alignment: Alignment.center,
                        fit: BoxFit.cover
                    )
                )
            ),
            onPressed: () 
            {
                context.vRouter.to(g.BGgalleryImagesPaths[imageIndex]);
            }
        );
    }
}