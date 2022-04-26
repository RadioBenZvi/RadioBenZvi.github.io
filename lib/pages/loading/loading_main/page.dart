// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, library_prefixes, prefer_const_literals_to_create_immutables

import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:radio_ben_zvi_website/globals.dart' as g;
import 'package:radio_ben_zvi_website/pages/state_page.dart' as RBZPages;
import 'package:radio_ben_zvi_website/pages/home/page.dart';

class Loading extends RBZPages.Page 
{
    const Loading({ Key? key, required ToPage }) : super(key: key, ToPage: ToPage);

    @override
    State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading>
{
    @override
    void initState()
    {
        super.initState();
        Future.delayed(Duration(seconds: 1), () => widget.ToPage(Home(ToPage: widget.ToPage)));
    }

    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            backgroundColor: Color.fromARGB(255, 0, 15, 39),
            body: Center(
                child: Stack(
                    children: [
                        SpinKitSpinningLines(
                            color: Color.fromARGB(255, 186, 216, 255),
                            size: 700
                        ),
                        Center(
                            child: Image.asset(
                                "assets/images/logo/logo_very_small.png",
                                width: 100,
                                height: 100,
                                fit: BoxFit.contain
                            )
                        )
                    ]
                )
            )
        );
    }
}