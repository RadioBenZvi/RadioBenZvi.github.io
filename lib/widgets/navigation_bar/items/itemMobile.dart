// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

import 'package:radio_ben_zvi_website/datamodels/navbar_item_model.dart';

class NavBarItemMobile extends ProviderWidget<NavBarItemModel> 
{
    @override
    Widget build(BuildContext context, NavBarItemModel model) 
    {
        return Padding(
            padding: const EdgeInsets.only(left: 30, top: 60),
            child: Row(
                children: <Widget>[
                    Icon(
                        model.iconData,
                        color: Colors.white
                    ),
                    SizedBox(
                        width: 30
                    ),
                    Text(
                        model.title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                        )
                    )
                ]
            )
        );
    }
}
