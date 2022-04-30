// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison

import 'package:flutter/material.dart';

import 'package:radio_ben_zvi_website/OORT/navigator/page_route_path.dart';
import 'package:radio_ben_zvi_website/pages/podcasts/page.dart';
import 'package:radio_ben_zvi_website/pages/unknown/page.dart';
import 'package:radio_ben_zvi_website/pages/home/page.dart';
import 'package:radio_ben_zvi_website/pages/loading/loading.dart';

class PageRouterDelegate extends RouterDelegate<PageRoutePath> with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageRoutePath>
{
    @override
    GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();

    @override
    PageRoutePath? get currentConfiguration => super.currentConfiguration;

    @override
    Widget build(BuildContext context) 
    {
        throw UnimplementedError();
    }

    @override
    Future<void> setNewRoutePath(PageRoutePath configuration) 
    {
        throw UnimplementedError();
    }
}