// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:infinite_listview/infinite_listview.dart';
import 'package:vrouter/vrouter.dart';
import 'dart:async';

import 'package:radio_ben_zvi_website/pages/state_page.dart' as RBZPages;
import 'package:radio_ben_zvi_website/globals.dart' as g;

class ImageGalleryBackground extends RBZPages.Page 
{
    const ImageGalleryBackground({Key? key}) : super(key: key);

    @override
    State<ImageGalleryBackground> createState() => _ImageGalleryBackgroundState();
}

class _ImageGalleryBackgroundState extends State<ImageGalleryBackground> 
{
    int imageIndex = 0;
    int imageMax   = g.BGgalleryImages.length;
    Timer? timer;

    //ScrollController _scrollController = ScrollController();
    //
    //_scrollToBottom()
    //{
    //    _scrollController.animateTo(
    //        _scrollController.position.maxScrollExtent,
    //        duration: Duration(milliseconds: 5),
    //        curve: Curves.easeOut
    //    );
    //}

    @override
    void initState() 
    {
        super.initState();
        timer = Timer.periodic(Duration(seconds: 5), (Timer t) { 
            setState(() { 
                imageIndex++;
                if (imageIndex >= imageMax) imageIndex = 0;
            }); 
        });
    }

    @override
    Widget build(BuildContext context)
    {
        return FlatButton(
            child: Container(
                width: double.infinity,
                height: 600,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(g.BGgalleryImages[imageIndex]),
                        alignment: Alignment.center,
                        fit: BoxFit.cover
                    )
                )
            ),
            onPressed: () 
            {
                context.vRouter.to(g.BGgalleryImagesPaths[imageIndex]);
            }
        );
        //return Container(
        //    width: double.infinity,
        //    height: 500,
        //    child: ListView.builder(
        //        itemBuilder: (context, index) 
        //        {
        //            return FlatButton(
        //                child: Container(
        //                    width: double.infinity,
        //                    height: 500,
        //                    decoration: BoxDecoration(
        //                        image: DecorationImage(
        //                            image: AssetImage(g.BGgalleryImages[index]),
        //                            alignment: Alignment.center,
        //                            fit: BoxFit.cover
        //                        )
        //                    )
        //                ),
        //                onPressed: () 
        //                {
        //                    context.vRouter.to(g.BGgalleryImagesPaths[index]);
        //                }
        //            );
        //        },
        //        itemCount: imageMax,
        //        scrollDirection: Axis.horizontal,
        //        //itemExtent: double.infinity,
        //        //controller: _scrollController
        //    )
        //);
    }
}