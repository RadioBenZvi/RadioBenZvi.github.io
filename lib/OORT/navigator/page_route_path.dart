// ignore_for_file: non_constant_identifier_names

class PageRoutePath
{
    final int id;
    final bool isUnknown;

    PageRoutePath.loading()
        : id = 0,
        isUnknown = false;

    PageRoutePath.home() 
        : id = 1, 
        isUnknown = false;

    PageRoutePath.podcasts() 
        : id = 2, 
        isUnknown = false;

    PageRoutePath.unknown() 
        : id = -1,
        isUnknown = true;

    bool get isLoadingPage => id == 0;
    bool get isHomePage => id == 1;
    bool get isPodcastsPage => id == 2;
}