// ignore_for_file: non_constant_identifier_names

class PageRoutePath
{
    final int id;
    final int episodeNum;
    final bool isUnknown;

    PageRoutePath.home() 
        : id = 0, 
        episodeNum = -1,
        isUnknown = false;

    PageRoutePath.podcasts() 
        : id = 1, 
        episodeNum = -1,
        isUnknown = false;

    PageRoutePath.podcast(this.id)
        : episodeNum = -1,
        isUnknown = false;
    
    PageRoutePath.podcast_episode(this.id, this.episodeNum)
        : isUnknown = false;

    PageRoutePath.unknown() 
        : id = -1,
        episodeNum = -1,
        isUnknown = true;

    bool get isHomePage => id == 0;
    bool get isPodcastsPage => id == 1;
    bool get isPodcastPage => id >= 10;
    bool get isPodcastEpisodePage => id >= 10 && episodeNum >= 0;
}