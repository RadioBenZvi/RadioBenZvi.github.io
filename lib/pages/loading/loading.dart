// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, library_prefixes, prefer_const_literals_to_create_immutables, await_only_futures, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart' as spinkit;

import 'package:radio_ben_zvi_website/globals.dart' as g;
import 'package:radio_ben_zvi_website/pages/home/page.dart';
import 'package:radio_ben_zvi_website/pages/state_page.dart' as RBZPages;
import 'package:radio_ben_zvi_website/pages/loading/load_page.dart';
import 'package:radio_ben_zvi_website/widgets/image_placeholder/image_placeholder.dart';

class Loading extends RBZPages.Page 
{
    final Widget Page;
    const Loading({ Key? key, required ToPage, required this.Page}) : super(key: key, ToPage: ToPage);

    @override
    State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading>
{
    @override
    void initState()
    {
        super.initState();
        LoadPage(ToPage: widget.ToPage, Page: widget.Page);
    }

    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            backgroundColor: Color.fromARGB(255, 0, 15, 39),
            body: Center(
                child: Stack(
                    children: [
                        spinkit.SpinKitSpinningLines(
                            color: Color.fromARGB(255, 186, 216, 255),
                            size: 700
                        ),
                        Center(
                            child: ImageWidgetPlaceholder(
                                image: AssetImage(g.VerySmallLogoPath),
                                placeholder: Text(
                                    'Loading Image',
                                    style: TextStyle(
                                        fontSize: 50,
                                        fontFamily: g.MainFont,
                                        color: Color.fromARGB(255, 186, 216, 255)
                                    )
                                ),
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