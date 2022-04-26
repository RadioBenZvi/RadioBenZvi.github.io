// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_init_to_null, unnecessary_null_comparison, prefer_const_declarations, use_key_in_widget_constructors, library_prefixes

import 'package:flutter/material.dart';

import 'package:radio_ben_zvi_website/globals.dart' as g;
import 'package:radio_ben_zvi_website/OORT/app_data.dart' as data;
import 'package:radio_ben_zvi_website/OORT/navigator/navigator.dart' as Navigator;

void main() => runApp(RadioBenZviWebsite());

class RadioBenZviWebsite extends StatefulWidget 
{
    const RadioBenZviWebsite({ Key? key }) : super(key: key);

    @override
    State<RadioBenZviWebsite> createState() => _RadioBenZviWebsiteState();
}

class _RadioBenZviWebsiteState extends State<RadioBenZviWebsite> 
{
    @override
    Widget build(BuildContext context) 
    {
        return MaterialApp.router(
            title: 'Radio Ben Zvi Website',
            routerDelegate: Navigator.Delegate,
            routeInformationParser: Navigator.InformationParser,
            themeMode: ThemeMode.dark,
            theme: ThemeData(
                fontFamily: data.MainFont
            ),
        );
    }
}