// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class NavigationBarMobile extends StatelessWidget 
{
    const NavigationBarMobile({Key? key, required }) : super(key: key);

    @override
    Widget build(BuildContext context) 
    {
        return SizedBox(
            height: 80,
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {}
                    )
                ]
            )
        );
    }
}