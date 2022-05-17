// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, library_prefixes

import 'package:flutter/material.dart';

import 'package:radio_ben_zvi_website/pages/stateless_page.dart' as RBZPages;

class Podcast extends RBZPages.Page 
{
    const Podcast({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) 
    {
        return Scaffold(
            appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Text("APodcastPage"),
            ),
            body: Center(
                child: Column(
                    children: [
                        // show all the podcast with link to their details page
                        Text("APodcastPage")
                    ]
                )
            ),
        ); 
    }
}