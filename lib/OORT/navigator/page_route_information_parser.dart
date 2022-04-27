// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:radio_ben_zvi_website/OORT/navigator/page_route_path.dart';

class PageRouteInformationParser extends RouteInformationParser<PageRoutePath>
{
    @override
    Future<PageRoutePath> parseRouteInformation(RouteInformation routeInformation) async
    {
        String location = routeInformation.location.toString();

        if (location == "") 
        {
            location = "/"; 
        }

        final uri = Uri.parse(location);

        // Handle '/'
        if (uri.pathSegments.isEmpty) return PageRoutePath.loading();

        // Handle '/home'
        if (uri.pathSegments.first == "home") return PageRoutePath.home();

        // Handle '/podcast'
        if (uri.pathSegments.first == "podcasts") return PageRoutePath.podcasts();
        
        // Handle unknown route
        return PageRoutePath.unknown();
    }

    @override
    RouteInformation restoreRouteInformation(PageRoutePath configuration)
    {
        if (configuration.isUnknown) return RouteInformation(location: "/404");
        if (configuration.isLoadingHomePage) return RouteInformation(location: "/");
        if (configuration.isHomePage) return RouteInformation(location: "/home");
        if (configuration.isPodcastsPage) return RouteInformation(location: "/podcasts");

        return RouteInformation(location: "/404");
    }
}