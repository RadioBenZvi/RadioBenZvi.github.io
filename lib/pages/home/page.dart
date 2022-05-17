// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, non_constant_identifier_names, library_prefixes

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:radio_ben_zvi_website/pages/state_page.dart' as RBZPages;
import 'package:radio_ben_zvi_website/pages/home/desktop.dart' as HomeDesktops;
import 'package:radio_ben_zvi_website/pages/home/phones.dart' as HomePhones;

class Home extends RBZPages.Page 
{
    const Home({Key? key}) : super(key: key);

    @override
    State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>
{
    @override
    Widget build(BuildContext context) 
    {
        return ScreenTypeLayout(
            mobile: HomePhones.HomePhone(),
            desktop: HomeDesktops.HomeDesktop()
        );
    }
}