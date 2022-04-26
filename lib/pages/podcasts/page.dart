// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:radio_ben_zvi_website/pages/home/page.dart';

import 'package:radio_ben_zvi_website/pages/stateless_page.dart' as RBZPages;

class Podcasts extends RBZPages.Page 
{
    const Podcasts({Key? key, required ToPage}) : super(key: key, ToPage: ToPage);

    @override
    Widget build(BuildContext context) 
    {
        ToPage(Home(ToPage: ToPage));
        return Scaffold(
            appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Text("PodcastsPage"),
            ),
            body: Center(
                child: Column(
                    children: [
                        // show all the podcast with link to their details page
                        Text("PodcastsPage")
                    ]
                )
            ),
        ); 
    }
}