// ignore_for_file: camel_case_types, prefer_const_constructors, non_constant_identifier_names, library_prefixes

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart' 
    deferred as ResponsiveBuilder;

import 'package:radio_ben_zvi_website/pages/stateless_page.dart' as RBZPages;
import 'package:radio_ben_zvi_website/widgets/navigation_bar/desktop.dart' 
    deferred as NavigationBarDesktop;
import 'package:radio_ben_zvi_website/widgets/navigation_bar/mobile.dart' 
    deferred as NavigationBarMobile;

class Navigation_bar extends RBZPages.Page 
{
    const Navigation_bar({Key? key, required ToPage}) : super(key: key, ToPage: ToPage);

    @override
    Widget build(BuildContext context) 
    {
        return ResponsiveBuilder.ScreenTypeLayout(
            mobile: NavigationBarMobile.NavigationBarMobile(),
            tablet: NavigationBarDesktop.NavigationBarDesktop(ToPage: ToPage)
        );
    }
}