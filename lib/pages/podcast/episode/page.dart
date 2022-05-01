// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:radio_ben_zvi_website/pages/home/page.dart';

import 'package:radio_ben_zvi_website/pages/stateless_page.dart' as RBZPages;

class Episode extends RBZPages.Page 
{
    final int podcastId;
    final int episodeId;
    const Episode({Key? key, required ToPage, required this.podcastId, required this.episodeId}) 
        : super(key: key, ToPage: ToPage);

    @override
    Widget build(BuildContext context) 
    {
        ToPage(Home(ToPage: ToPage));
        return Scaffold(
            appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Text("EpisodePage"),
            ),
            body: Center(
                child: Column(
                    children: [
                        // show all the podcast with link to their details page
                        Text("EpisodePage")
                    ]
                )
            ),
        ); 
    }
}