// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures, avoid_renaming_method_parameters, body_might_complete_normally_nullable

import 'package:flutter/material.dart';

import 'package:radio_ben_zvi_website/globals.dart' as g;
import 'package:radio_ben_zvi_website/OORT/navigator/page_route_path.dart';

class PageRouteInformationParser extends RouteInformationParser<PageRoutePath>
{
    @override
    Future<PageRoutePath> parseRouteInformation(RouteInformation routeInformation) async
    {
        final uri = Uri.parse(routeInformation.location.toString());

        // Handle '/'
        if (uri.pathSegments.isEmpty) return PageRoutePath.home();

        // Handle '/podcasts'
        if (uri.pathSegments[0] == 'podcasts') return PageRoutePath.podcasts();

        // Handle '/podcast/:id'
        if (uri.pathSegments[0] == 'podcast')
        {
            if (uri.pathSegments.length == 2)
            {
                final id = int.tryParse(g.PodcastIdMap[uri.pathSegments[1]]);

                if (id != null) return PageRoutePath.podcast(id);
                else return PageRoutePath.unknown();
            }
            else if (uri.pathSegments.length == 3)
            {
                final id = int.tryParse(g.PodcastIdMap[uri.pathSegments[1]]);
                final episodeId = int.tryParse(
                    uri.pathSegments[2].toString().toLowerCase().replaceAll("Ep", "")
                );

                if (id != null && episodeId != null) return PageRoutePath.podcast_episode(id, episodeId);
                else return PageRoutePath.unknown();
            }
            else
            {
                return PageRoutePath.unknown();
            }
        }

        // Handle unknown routes
        return PageRoutePath.unknown();
    }

    @override
    RouteInformation? restoreRouteInformation(PageRoutePath path) 
    {
        if (path.isUnknown) return RouteInformation(location: "/404");
        if (path.isHomePage) return RouteInformation(location: "/");
        if (path.isPodcastsPage) return RouteInformation(location: "/podcasts");
        if (path.isPodcastPage) return RouteInformation(
            location: "/podcast/${g.PodcastIdMapInverse[path.id]}"
        );
        if (path.isPodcastEpisodePage) return RouteInformation(
            location: "/podcast/${g.PodcastIdMapInverse[path.id]}/Ep${path.episodeNum}"
        );
        return RouteInformation(location: "/404");
    }
}