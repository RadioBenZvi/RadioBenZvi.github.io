// ignore_for_file: non_constant_identifier_names, avoid_init_to_null, curly_braces_in_flow_control_structures

class Episode 
{
    final String title;
    final String description;
    final int    season;
    final int    episodeNumber;
    final String podcast;
    final String imagePath;
    final String UrlPath;

    Episode(this.title, {
        required this.podcast,
        required this.imagePath,
        required this.description,
        required this.season,
        required this.episodeNumber,
        required this.UrlPath
    });
}

class Podcast
{
    final String        title;
    final String        description;
    final String        imagePath;
    final int           NumId;
    final String        urlExtension;
    final String        RssUrl;
    final String        author;
    final String        publisher;
    final String        publisherUrl;
    final String        language;
    final String        category;
    final List          subcategories;
    final List<Episode> Episodes;
    final int           SuggestedEpisode;
    final String?       SpotifyLink;
    final String?       AppleMusicLink;
    final String?       GoogleMusicLink;
    final String?       SpreakerLink;
    late int                 NumberOfEpisodes;
    late Episode             SuggestedEpisodeObject;

    Podcast(this.title, {
        required this.NumId,
        required this.imagePath,
        required this.description,
        required this.RssUrl,
        required this.author,
        required this.subcategories,
        required this.Episodes,
        required this.SuggestedEpisode,
        required this.language,
        required this.category,
        this.SpotifyLink     = null,
        this.AppleMusicLink  = null,
        this.GoogleMusicLink = null,
        this.SpreakerLink    = null,
        this.urlExtension    = "unknown",
        this.publisher       = "Radio Ben Zvi",
        this.publisherUrl    = "https://RadioBenZvi.github.io"
    }) { NumberOfEpisodes = Episodes.length; SuggestedEpisodeObject = Episodes[SuggestedEpisode]; }

    Episode GetEpisodeAtNumber(id, episodeNum)
    {
        if (episodeNum == null || episodeNum < 0 || episodeNum >= NumberOfEpisodes)
            return Episodes[0];
        else
            return Episodes[episodeNum];
    }
}

final Podcasts = [
    Podcast(
        "פודקאסט ללא נושא",
        NumId: 11,
        imagePath: "https://d3wo5wojvuv7l.cloudfront.net/t_square_limited_720/images.spreaker.com/original/35919abd89f45040b7a0defb3339338d.jpg",
        description: "בפודקאסט זה, כל פרק על נושא אחר ומעניין", 
        RssUrl: "https://www.spreaker.com/show/5246375/episodes/feed", 
        author: "ShakedKod",
        category: "Arts",
        subcategories: [
            "History",
            "Science",
            "Music",
            "Literature",
            "Other",
            "Movies",
            "Games",
            "Cartoons",
            "Other"
        ], 
        Episodes: [
            Episode(
                "הבעיה עם אור",
                podcast: "פודקאסט ללא נושא",
                imagePath: "",
                description: "בפרק זה של פודקאסט ללא נושא אני אדבר על זיהום אור, ולמה כל כך הרבה אור זה רע לנו ועל לווייתנאים גם כן. \nהאזנה נעימה,\nשקד\n_____________________________________________________________________\n\nרדיו בן צבי - https://sites.google.com/view/radiobenzvi\n---={תודות וכתוביות}=---\nהלוגו נוצר בבלנדר\n\n---={מוזיקה}=---\nVindsvept - Fimbulwinter, winter following winter\nVindsvept - Across the Plains\nVindsvept - Quest's End\nVindsvept - RAGNARÖK, Naglfar, ship of the dead\nVindsvept - Moonless Night\nVindsvept - Crystal Forest\nVindsvept - Hearthfire\nVindsvept - Woodland Lullaby\nVindsvept - The Fall\nVindsvept - Sleeper\nVindsvept - Clockwork\nVindsvept - Journey to the Middle of Nowhere\nPhaera(The Arcadium) - Rejoice\nRomanSenykMusic - Wonderland\nSilentCrafter - Dream",
                season: 1,
                episodeNumber: 1,
                UrlPath: "Ep1"
            ),
            Episode(
                "אוטובוסים ועוד",
                podcast: "פודקאסט ללא נושא",
                imagePath: "",
                description: "בפרק קצר זה של פודקאסט ללא נושא, אני אדבר על ההיסטוריה, והעתיד של האוטובוסים ועוד כמה דברים,\nהאזנה נעימה,\nשקד\n\nנ\"ב: מצטער שלקח כל כך הרבה זמן לפרק הזה להגיע, אין לי זמן \n\n\n------------------------------------------------------\n\nרדיו בן צבי - https://sites.google.com/view/radiobenzvi\n\nהלוגו נוצר בבלנדר - https://blender.org/ \n\n------------------------------------------------------\n\nרשות למוזיקה\n----\nCC BY 4.0: https://creativecommons.org/licenses/by/4.0/ \nThe Diverse Free\n\nהמוזיקה\n-----\nLuis Humanoide - A Ride in an Automobile == https://youtu.be/xejIrCkkAks\nScott Joplin - The Entertainer(1902) == https://youtu.be/fPmruHc4S9Q\nVindsvept - The Fall == https://youtu.be/7qTjny1qoXs\nBrothaD - No Where == https://prosearch.tribeofnoise.com/artists/show/44327/23835\nVindsvept - Across the Plains == https://youtu.be/ZDokgvuuS7E\nSilentCrafter - Dream == https://youtu.be/hnYDJ7wWWB4\n\n-----------------------------------------\n\nנוצר על ידי שקד\nכל הזכויות שמורות לרדיו בן צבי",
                season: 1,
                episodeNumber: 2,
                UrlPath: "Ep2"
            ),
            Episode(
                "מצות ועוד מצות - חלק א",
                podcast: "פודקאסט ללא נושא",
                imagePath: "",
                description: "בפרק זה של פודקאסט ללא נושא, ספיישל פסח ואיתו הסיפור על המצות מהתקופה התנכית ועד היום\nזהו חלק אחד מתוך שניים, והשני יפורסם בערב חג שני\nהאזנה נעימה,\nשקד\n\n-=מוזיקה=-\nFox Sailor - Fabula\nVindsvept - Lake of Light\nLuis Humanoide - A Ride in an Automobile(strings)\nLuis Humanoide - Clocker Neighborhood\nVindsvept - Filmbulwinter, Winter Following Winter\nLuis Humanoide - The Bridge of Eldevior\nדי דיינו",
                season: 1,
                episodeNumber: 3,
                UrlPath: "Ep3"
            ),
            Episode(
                "מצות ועוד מצות - חלק ב",
                podcast: "פודקאסט ללא נושא",
                imagePath: "",
                description: "בחלק השני של מצות ועוד מצות התמקדתי בעלילות והדם והסיפור שלהם עם המצות\n\nהפרק הזה קצת יותר קריפי מבדרך כלל\nאך מהנה לא פחות\nהאזנה נעימה,\nשקד\n\nנ\"ב: מצטער על איכות ההקלטה בשני הפרקים האחרונים, לא יכולתי להגיע לאולפן בפסח כדי להקליט\n\n-============-\nרדיו בן צבי - https://sites.google.com/view/radiobenzvi\n\nלוגו נוצר בעזרת בלנדר - https://blender.org/\n\n-=מוזיקה=-\nAlexander Nakarda - Passing Greeting\nKevin MacLeod - Awkward Meeting\nKevin MacLeod - Bent And Broken\nDream Cave - The Great Ascent\nAlexander Nakarda - Twin Explorers\nKevin MacLeod - Classic Horror 1\nKevin MacLeod - Controlled Chaos(No Percussion)\nKevin MacLeod - Echoes Of Time\nAlexander Nakarda - Wanderer\nפודקאסט ללא נושא - מצות ועוד מצות, חלק א'\nVindsvept - Clarity\nVindsvept - Wanderer\nVindsvept - Quest's End\nApproaching Nirvana - Keystone\n\n-============-\nנוצר על ידי שקד\nכל הזכויות שמורות לרדיו בן צבי",
                season: 1,
                episodeNumber: 4,
                UrlPath: "Ep4"
            )
        ], 
        SuggestedEpisode: 2, 
        language: "Hebrew", 
        SpotifyLink: "https://open.spotify.com/show/7pCqqvTeWgtT7NXvoXDMc0?si=3826f958ab4e43f3",
        GoogleMusicLink: "https://podcasts.google.com/feed/aHR0cHM6Ly93d3cuc3ByZWFrZXIuY29tL3Nob3cvNTI0NjM3NS9lcGlzb2Rlcy9mZWVk",
        SpreakerLink: "https://www.spreaker.com/show/pwas",
        urlExtension: "PAWS"
    )
];

Podcast GetPodcastAtId(int id) {
    for (Podcast podcast in Podcasts) {
        if (podcast.NumId == id) {
            return podcast;
        }
    }
    return Podcast(
        "Unknown",
        Episodes: [],
        SuggestedEpisode: 0,
        language: "Unknown",
        SpotifyLink: "unknown",
        GoogleMusicLink: "unknown",
        SpreakerLink: "unknown",
        urlExtension: "Unknown", 
        author: "unknown", 
        category: "unknown", 
        description: "unknown", 
        imagePath: "unknown", 
        NumId: -1, 
        RssUrl: "unknown", 
        subcategories: []
    );
}