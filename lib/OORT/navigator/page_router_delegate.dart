// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison

import 'package:flutter/material.dart';

import 'package:radio_ben_zvi_website/OORT/navigator/page_route_path.dart';
import 'package:radio_ben_zvi_website/pages/podcasts/page.dart';
import 'package:radio_ben_zvi_website/pages/unknown/page.dart';
import 'package:radio_ben_zvi_website/pages/home/page.dart';
import 'package:radio_ben_zvi_website/pages/loading/loading_main.dart';

class PageRouterDelegate extends RouterDelegate<PageRoutePath> with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageRoutePath>
{
    void _handlePageChanged(Widget page) 
    {
        _currentPage = page;
        notifyListeners();
    }

    late Widget _currentPage = Loading(ToPage: _handlePageChanged);
    bool show404 = false;

    @override
    GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

    @override
    PageRoutePath? get currentConfiguration 
    {
        if (show404) return PageRoutePath.unknown();

        if (_currentPage is Loading) return PageRoutePath.loading();

        if (_currentPage is Home) return PageRoutePath.home();

        if (_currentPage is Podcasts) return PageRoutePath.podcasts();

        return null;
    }

    @override
    Widget build(BuildContext context) 
    {
        return Navigator(
            key: navigatorKey,
            pages: [
                MaterialPage(
                    child: Loading(
                        ToPage: _handlePageChanged
                    )
                ),

                if (show404) MaterialPage(
                    key: ValueKey("UnknownKey"),
                    child: UnknownPage(ToPage: _handlePageChanged)
                )
                else if (_currentPage != null)
                    MaterialPage(
                        child: _currentPage
                    )
            ],
            onPopPage: (route, result) {
                if (route.didPop(result)) return false; 

                _currentPage = Loading(ToPage: _handlePageChanged);
                show404 = false;
                notifyListeners();

                return true;
            }
        );
    }

    @override
    Future<void> setNewRoutePath(PageRoutePath configuration) async
    {
        if (configuration.isUnknown)
        {
            show404 = true;
            return;
        }

        else
        {
            if (configuration.isLoadingHomePage) _currentPage = Loading(ToPage: _handlePageChanged);
            if (configuration.isHomePage) _currentPage = Home(ToPage: _handlePageChanged);
            if (configuration.isPodcastsPage) _currentPage = Podcasts(ToPage: _handlePageChanged);

            show404 = false;
        }
    }
}