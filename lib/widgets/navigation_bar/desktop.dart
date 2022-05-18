// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, library_prefixes

import 'package:flutter/material.dart';

import 'package:radio_ben_zvi_website/pages/stateless_page.dart' as RBZPages;
import 'package:radio_ben_zvi_website/widgets/navigation_bar/items/logo.dart';

class NavigationBarDesktop extends RBZPages.Page 
{
    const NavigationBarDesktop({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) 
    {
        return Container(
            height: 100,
            // TODO: #1 ADD IMAGE
            //decoration: BoxDecoration(
            //    backgroundBlendMode: BlendMode.screen,
            //    color: Colors.black.withOpacity(0.5),
            //    image: DecorationImage(
            //        image: AssetImage('assets/images/navigation_bar_background.png'),
            //        fit: BoxFit.cover
            //    )
            //),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    NavBarLogo()
                ]
            )
        );
    }
}