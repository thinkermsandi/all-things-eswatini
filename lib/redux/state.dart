import 'package:equatable/equatable.dart';

import 'package:all_things_eswatini/model/job.dart';
import 'package:all_things_eswatini/model/job_employer.dart';
import 'package:all_things_eswatini/model/mobile_app.dart';
import 'package:all_things_eswatini/model/mobile_app_permission.dart';
import 'package:all_things_eswatini/model/mobile_app_developer.dart';
import 'package:all_things_eswatini/model/mobile_app_category.dart';
import 'package:all_things_eswatini/model/news_article.dart';
import 'package:all_things_eswatini/model/news_category.dart';
import 'package:all_things_eswatini/model/news_organization.dart';
import 'package:all_things_eswatini/model/tabs_news.dart';
import 'package:all_things_eswatini/model/tabs_tv.dart';
import 'package:all_things_eswatini/model/tv_show.dart';
import 'package:all_things_eswatini/model/tv_channel.dart';
import 'package:all_things_eswatini/model/weather.dart';
import 'package:all_things_eswatini/model/weather_station.dart';
import 'package:all_things_eswatini/model/weather_condition.dart';

import 'package:all_things_eswatini/model/loading_status.dart';

class AppState extends Equatable {
  final LoadingStatus jobsStatus;
  final List<Job> jobs;
  final LoadingStatus mobileAppsStatus;
  final List<MobileApp> mobileApps;
  final LoadingStatus newsStatus;
  final NewsTab newsCurrentTab;
  final List<NewsArticle> news;
  final LoadingStatus tvShowsStatus;
  final TvTab tvCurrentTab;
  final List<TvShow> tvShows;
  final LoadingStatus weatherStatus;
  final List<Weather> weather;

  AppState({
    this.jobsStatus,
    this.jobs,
    this.mobileAppsStatus,
    this.mobileApps,
    this.newsStatus,
    this.newsCurrentTab,
    this.news,
    this.tvShowsStatus,
    this.tvCurrentTab,
    this.tvShows,
    this.weatherStatus,
    this.weather,
  }) : super([
    jobsStatus,
    jobs,
    mobileAppsStatus,
    mobileApps,
    newsStatus,
    newsCurrentTab,
    news,
    tvShowsStatus,
    tvCurrentTab,
    tvShows,
    weatherStatus,
    weather
  ]);

  factory AppState.initial() {
    Job job = new Job(id: 1,
        name: "PHP Developer",
        description: "Do you like building ecommerce products? Then we are looking for you",
        location: "eZulwini",
        expires: DateTime.fromMicrosecondsSinceEpoch(16374644),
        employer: new JobEmployer(id: 213, name: "Ironstamp Investments", photo: ""));

    Job job2 = new Job(id: 2,
        name: "Software Developer",
        description: "Knowledge of programming",
        location: "Mbabane",
        expires: DateTime.fromMicrosecondsSinceEpoch(16374644),
        employer: new JobEmployer(id: 213, name: "Ironstamp Investments", photo: ""));

    MobileApp app1 = new MobileApp(id: 1,
        name: "Uno Player",
        description: "Looking for creative ideas? Whether you’re planning your next big travel adventure, searching for home design concepts, looking for fashion & fitness tips or checking out new recipes, explore lifestyle inspiration on Pinterest. Good ideas start here!",
        version: "4.3",
        size: 483,
        installs: 323,
        minimumAndroidVersion: "21",
        photo: 'https://lh3.googleusercontent.com/01VEchHr1Ke6TnViZH3076ONh94LupPiIS3hZm0o-6oQ-k1LwEnYsOGFcJIK3_LSAQ=s360',
        updated: DateTime.fromMicrosecondsSinceEpoch(732323),
        category: new MobileAppCategory(id: 1, name: "Social", photo: ""),
        developer: new MobileAppDeveloper(id: 2, name: "Rational THinkers", photo: ""),
        permissions: new List());

    MobileApp app2 = new MobileApp(id: 2,
        name: "Uno Messenger",
        version: "4.3",
        description: "Discover wedding tips, beauty inspiration and design concepts for your big day. Explore thousands of recommended or trending images, get travel inspiration or read new recipes and creative food ideas for your next dinner party. With fitness tips, interesting DIY projects to try out and tons of great fashion, style & beauty tips, Pinterest keeps all of your lifestyle inspiration in one place.\n \n You never know what sparks a great design idea or when inspiration for your next DIY project might strike.",
        size: 483,
        installs: 323,
        minimumAndroidVersion: "21",
        photo: 'https://lh3.googleusercontent.com/01VEchHr1Ke6TnViZH3076ONh94LupPiIS3hZm0o-6oQ-k1LwEnYsOGFcJIK3_LSAQ=s360',
        updated: DateTime.fromMicrosecondsSinceEpoch(732323),
        category: new MobileAppCategory(id: 1, name: "Social", photo: ""),
        developer: new MobileAppDeveloper(id: 2, name: "Rational THinkers", photo: ""),
        permissions: new List());

    MobileApp app3 = new MobileApp(id: 3,
        name: "Uno Messenger",
        description: "Get inspired from anywhere on the internet. Save your ideas, organize them by topic and share with others – all from your pocket! \n \n Get ideas for the topics you care about most: - Home design, architecture & DIY \n \n - Creative wedding tips \n - Travel, fitness & beauty \n - Fashion and style inspiration \n - Food, new recipes & cooking",
        version: "4.3",
        size: 483,
        installs: 323,
        minimumAndroidVersion: "21",
        photo: 'https://lh3.googleusercontent.com/01VEchHr1Ke6TnViZH3076ONh94LupPiIS3hZm0o-6oQ-k1LwEnYsOGFcJIK3_LSAQ=s360',
        updated: DateTime.fromMicrosecondsSinceEpoch(732323),
        category: new MobileAppCategory(id: 1, name: "Social", photo: ""),
        developer: new MobileAppDeveloper(id: 2, name: "Rational THinkers", photo: ""),
        permissions: new List());

    Weather weather1 = new Weather(id: 1,
        station: new WeatherStation(id: 1, name: "Mbabane"),
        condition: WeatherCondition.showers,
        minTemp: 6.0,
        maxTemp: 19.0,
        temp: 18.5,
        created: DateTime.fromMicrosecondsSinceEpoch(36372832),
        lastUpdated: DateTime.now());

    Weather weather2 = new Weather(id: 2,
        station: new WeatherStation(id: 2, name: "Manzini"),
        condition: WeatherCondition.showers,
        minTemp: 6.0,
        maxTemp: 19.0,
        temp: 18.5,
        created: DateTime.fromMicrosecondsSinceEpoch(36372832),
        lastUpdated: DateTime.now());

    Weather weather3 = new Weather(id: 3,
        station: new WeatherStation(id: 3, name: "Matsapha"),
        condition: WeatherCondition.showers,
        minTemp: 6.0,
        maxTemp: 19.0,
        temp: 18.5,
        created: DateTime.fromMicrosecondsSinceEpoch(36372832),
        lastUpdated: DateTime.now());

    Weather weather4 = new Weather(id: 4,
        station: new WeatherStation(id: 4, name: "Big Bend"),
        condition: WeatherCondition.showers,
        minTemp: 6.0,
        maxTemp: 19.0,
        temp: 18.5,
        created: DateTime.fromMicrosecondsSinceEpoch(36372832),
        lastUpdated: DateTime.now());

    NewsArticle article1 = new NewsArticle(
        id: 1,
        title: "Man Found Dead",
        description: "Christine Lagarde’s accession to the helm of the European Central Bank for the era after Mario Draghi might augur a very different style of leadership.",
        category: new NewsCategory(id: 1, name: "General", photo: ""),
        organization: new NewsOrganization(id: 1, name: "Times of Eswatini", photo: ""),
        photo: "http://www.times.co.sz/thumbnail.php?file=kill_446221363.jpg&size=article_medium",
        created: DateTime.now()
    );

    NewsArticle article2 = new NewsArticle(
        id: 2,
        title: "Bafana Bafana Knocked Out",
        description: "Pro-democracy politicians appealed for understanding after protesters attacked the legislature building, vandalised and occupied it as police retreated in extraordinary scenes of violence in the Chinese territory.",
        category: new NewsCategory(id: 3, name: "Sports", photo: ""),
        organization: new NewsOrganization(id: 1, name: "Eswatini Observer", photo: ""),
        photo: "http://www.times.co.sz/thumbnail.php?file=kill_446221363.jpg&size=article_medium",
        created: DateTime.now()
    );

    TvShow show1 = new TvShow(
        id: 1,
        title: "Big Bang Theory",
        description: "Sheldon and Amy get married",
        starts: "11:30",
        ends: "12:30",
        rating: "PG",
        image: "http://lorempixel.com/400/200",
        url: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
        channel: new TvChannel(id: 1, name: "Swazi Tv", photo: "")
    );

    TvShow show2 = new TvShow(
        id: 2,
        title: "BBC News",
        description: "Latest News on the hour",
        starts: "13:00",
        ends: "14:30",
        rating: "PG",
        image: "http://lorempixel.com/400/200",
        url: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
        channel: new TvChannel(id: 1, name: "Swazi Tv", photo: "")
    );

    return AppState(
      jobsStatus: LoadingStatus.idle,
      jobs: [job, job2],
      mobileAppsStatus: LoadingStatus.idle,
      mobileApps: [app1, app2, app3],
      newsStatus: LoadingStatus.idle,
      newsCurrentTab: NewsTab.Top,
      news: [article1, article2],
      tvShowsStatus: LoadingStatus.idle,
      tvCurrentTab: TvTab.EswatiniTv,
      tvShows: [show1, show2],
      weatherStatus: LoadingStatus.idle,
      weather: [weather1, weather2, weather3, weather4],
    );
  }

  AppState apply({
    LoadingStatus jobsStatus,
    List<Job> jobs,
    LoadingStatus mobileAppsStatus,
    List<MobileApp> mobileApps,
    LoadingStatus newsStatus,
    NewsTab newsCurrentTab,
    List<NewsArticle> news,
    LoadingStatus tvShowsStatus,
    TvTab tvCurrentTab,
    List<TvShow> tvShows,
    LoadingStatus weatherStatus,
    List<Weather> weather,
  }) {
    return AppState(
      jobsStatus: jobsStatus ?? this.jobsStatus,
      jobs: jobs ?? this.jobs,
      mobileAppsStatus: mobileAppsStatus ?? this.mobileAppsStatus,
      mobileApps: mobileApps ?? this.mobileApps,
      newsStatus: newsStatus ?? this.newsStatus,
      newsCurrentTab: newsCurrentTab ?? this.newsCurrentTab,
      news: news ?? this.news,
      tvShowsStatus: tvShowsStatus ?? this.tvShowsStatus,
      tvCurrentTab: tvCurrentTab ?? this.tvCurrentTab,
      tvShows: tvShows ?? this.tvShows,
      weatherStatus: weatherStatus ?? this.weatherStatus,
      weather: weather ?? this.weather,
    );
  }

}