// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_init_to_null, unnecessary_null_comparison, prefer_const_declarations, use_key_in_widget_constructors, library_prefixes

import 'package:flutter/material.dart';
import 'package:radio_ben_zvi_website/pages/loading/loading.dart';
import 'package:vrouter/vrouter.dart';

import 'package:radio_ben_zvi_website/pages/home/page.dart';
import 'package:radio_ben_zvi_website/pages/unknown/page.dart';

void main()
{
    runApp(RadioBenZviWebsite());
}

class RadioBenZviWebsite extends StatefulWidget 
{
    const RadioBenZviWebsite({ Key? key }) : super(key: key);

    @override
    State<RadioBenZviWebsite> createState() => _RadioBenZviWebsiteState();
}

class _RadioBenZviWebsiteState extends State<RadioBenZviWebsite> 
{
    @override
    Widget build(BuildContext context) 
    {
        return VRouter(
            debugShowCheckedModeBanner: false,
            initialUrl: "/",
            routes: [
                VRouteRedirector(path: "/", redirectTo: "/loading?page=home"),
                VWidget(
                    path: "/loading",
                    transitionDuration: Duration(seconds: 0),
                    widget: Loading()
                ),
                VWidget(
                    path: "/home",
                    transitionDuration: Duration(seconds: 0),
                    widget: Home()
                ),
                //VWidget(
                //    path: "/about",
                //    widget: widget
                //),
                //VWidget(
                //    path: "/podcasts",
                //    widget: widget
                //),
                //VPath(
                //    path: "/podcast",
                //    stackedRoutes: [
                //        VWidget(
                //            path: "/podcast/:id",
                //            name: "podcast",
                //            widget: widget,
                //
                //            stackedRoutes: [
                //                VWidget(
                //                    path: ":episode_id",
                //                    name: "podcast_episode",
                //                    widget: widget
                //                )
                //            ]
                //        )
                //    ]
                //),
                //VWidget(
                //    path: "/contact",
                //    widget: widget
                //),
                VWidget(
                    path: "/404",
                    widget: UnknownPage()
                ),

                VRouteRedirector(
                    path: '*',
                    redirectTo: '/404'
                )
            ]
        );
    }
}