// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison, avoid_renaming_method_parameters

import 'package:flutter/material.dart';

import 'package:radio_ben_zvi_website/OORT/navigator/page_route_path.dart';
import 'package:radio_ben_zvi_website/datamodels/podcast.dart' as podcasts_data;
import 'package:radio_ben_zvi_website/pages/podcast/page.dart';
import 'package:radio_ben_zvi_website/pages/podcasts/page.dart';
import 'package:radio_ben_zvi_website/pages/unknown/page.dart';
import 'package:radio_ben_zvi_website/pages/home/page.dart';
import 'package:radio_ben_zvi_website/pages/loading/loading.dart';
import 'package:radio_ben_zvi_website/pages/podcast/episode/page.dart';

class PageRouterDelegate extends RouterDelegate<PageRoutePath> with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageRoutePath>
{
    void _handlePageChanged(Widget page) 
    {
        _currentPage = page;
        notifyListeners();
    }

    late podcasts_data.Podcast _selectedPodcast;
    late podcasts_data.Episode _selectedEpisode;
    late               Widget  _currentPage = Loading(ToPage: _handlePageChanged, Page: Home(ToPage: _handlePageChanged));
    bool                       show404 = false;

    @override
    GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();

    @override
    PageRoutePath? get currentConfiguration 
    {
            if (show404) return PageRoutePath.unknown();

            if (_currentPage == null) return PageRoutePath.loading();

            if (_currentPage is Home) return PageRoutePath.home();

            if (_currentPage is Podcasts) return PageRoutePath.podcasts();

            if (_currentPage is Podcast) return PageRoutePath.podcast(_selectedPodcast.NumId);

            if (_currentPage is Episode) return PageRoutePath.podcast_episode(_selectedPodcast.NumId,   _selectedEpisode.episodeNumber);

            return PageRoutePath.unknown();
    }

    @override
    Widget build(BuildContext context) 
    {
        return Navigator(
            pages: [
                MaterialPage(
                    key: ValueKey("Loading"),
                    child: Loading(
                        ToPage: _handlePageChanged,
                        Page: Home(ToPage: _handlePageChanged)
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

                _currentPage = Loading(ToPage: _handlePageChanged, Page: Home(ToPage: _handlePageChanged));
                show404 = false;
                notifyListeners();

                return true;
            }
        );
    }

    @override
    Future<void> setNewRoutePath(PageRoutePath path) async
    {
        if (path.isUnknown)
        {
            show404 = true;
            return;
        }

        if (path.isLoadingHomePage)
        {
            _currentPage = Loading(ToPage: _handlePageChanged, Page: Home(ToPage: _handlePageChanged));
            return;
        }

        if (path.isHomePage)
        {
            _currentPage = Home(ToPage: _handlePageChanged);
            return;
        }

        if (path.isLoadingPodcastsPage)
        {
            _currentPage = Loading(ToPage: _handlePageChanged, Page: Podcasts(ToPage: _handlePageChanged));
            return;
        }

        if (path.isPodcastsPage)
        {
            _currentPage = Podcasts(ToPage: _handlePageChanged);
            return;
        }

        if (path.isPodcastPage)
        {
            if (path.id <= 10 || path.id > 20)
            {
                show404 = true;
                return;
            }

            _selectedPodcast = podcasts_data.GetPodcastAtId(path.id);
            _currentPage = Podcast(ToPage: _handlePageChanged, podcastId: path.id);
            return;
        }

        if (path.isPodcastEpisodePage)
        {
            if (path.id <= 10 || path.id > 20)
            {
                show404 = true;
                return;
            }

            _selectedPodcast = podcasts_data.GetPodcastAtId(path.id);

            if (path.episodeNum <= 0 || path.episodeNum > _selectedPodcast.NumberOfEpisodes)
            {
                show404 = true;
                return;
            }

            _selectedEpisode = _selectedPodcast.GetEpisodeAtNumber(path.id, path.episodeNum);
            _currentPage = Episode(ToPage: _handlePageChanged, podcastId: path.id, episodeId: path.episodeNum);
            return;
        }
    }
}