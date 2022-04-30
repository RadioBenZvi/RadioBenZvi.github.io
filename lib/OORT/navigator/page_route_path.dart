// ignore_for_file: non_constant_identifier_names

class PageRoutePath
{
    final int id;
    final int? episodeId;
    final bool isUnknown;

    PageRoutePath.loading()
        : id = 0,
        episodeId = null,
        isUnknown = false;

    PageRoutePath.home() 
        : id = 1, 
        episodeId = null,
        isUnknown = false;

    PageRoutePath.loading_podcasts() 
        : id = 2, 
        episodeId = null,
        isUnknown = false;

    PageRoutePath.podcasts() 
        : id = 3, 
        episodeId = null,
        isUnknown = false;

    PageRoutePath.podcast(this.id)
        : episodeId = null,
        isUnknown = false;
    
    PageRoutePath.podcast_episode(this.id, this.episodeId)
        : isUnknown = false;

    PageRoutePath.unknown() 
        : id = -1,
        episodeId = null,
        isUnknown = true;

    bool get isLoadingHomePage => id == 0;
    bool get isHomePage => id == 1;
    bool get isLoadingPodcastsPage => id == 2;
    bool get isPodcastsPage => id == 3;
    bool get isPodcastPage => id >= 10;
    bool get isPodcastEpisodePage => id >= 10 && episodeId != null;
}