// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import 'package:radio_ben_zvi_website/globals.dart' as g;
import 'package:radio_ben_zvi_website/pages/state_page.dart' as RBZPages;

class HomePhone extends RBZPages.Page 
{
    const HomePhone({Key? key}) : super(key: key);

    @override
    State<HomePhone> createState() => _HomePhoneState();
}

class _HomePhoneState extends State<HomePhone>
{
    @override
    Widget build(BuildContext context) 
    {
        return Scaffold(
            appBar: AppBar(
                automaticallyImplyLeading: false,
                centerTitle: true,
                toolbarHeight: 100,
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Image.asset(
                    "assets/images/logo/logo_small.png",
                    width: 100,
                    height: 100,
                    fit: BoxFit.fill
                )
            )
        );
    }
}