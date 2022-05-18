// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, library_prefixes

import 'package:flutter/material.dart';

import 'package:radio_ben_zvi_website/globals.dart' as g;
import 'package:radio_ben_zvi_website/pages/state_page.dart' as RBZPages;
import 'package:radio_ben_zvi_website/widgets/image_gallery_background/image_gallery_background.dart';
import 'package:radio_ben_zvi_website/widgets/navigation_bar/init.dart' as NavigationBar;


class HomeDesktop extends RBZPages.Page 
{
    const HomeDesktop({Key? key}) : super(key: key);

    @override
    State<HomeDesktop> createState() => _HomeDesktopState();
}

class _HomeDesktopState extends State<HomeDesktop>
{
    @override
    Widget build(BuildContext context) 
    {
        return Scaffold(
            backgroundColor: Color.fromARGB(255, 0, 14, 26),
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    Stack(
                        children: [
                            ImageGalleryBackground(),
                            NavigationBar.Navigation_bar()
                        ]
                    )
                ]
            )
        );
    }
}