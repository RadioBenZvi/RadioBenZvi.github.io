// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';

import 'package:radio_ben_zvi_website/pages/stateless_page.dart' as RBZPages;

class UnknownPage extends RBZPages.Page
{
    const UnknownPage({Key? key, required ToPage}) : super(key: key, ToPage: ToPage);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Text("404"),
            ),
            body: Center(
                child: Text("404"),
            ),
        );
    }
}