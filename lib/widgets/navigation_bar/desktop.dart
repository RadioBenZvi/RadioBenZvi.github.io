// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, library_prefixes

import 'package:flutter/material.dart';

import 'package:radio_ben_zvi_website/pages/stateless_page.dart' as RBZPages;
import 'package:radio_ben_zvi_website/widgets/navigation_bar/items/logo.dart';

class NavigationBarDesktop extends RBZPages.Page 
{
    const NavigationBarDesktop({Key? key, required ToPage}) : super(key: key, ToPage: ToPage);

    @override
    Widget build(BuildContext context) 
    {
        return SizedBox(
            height: 100,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    NavBarLogo(ToPage: ToPage)
                ]
            )
        );
    }
}