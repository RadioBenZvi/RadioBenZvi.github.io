// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

import 'package:radio_ben_zvi_website/datamodels/navbar_item_model.dart';

class NavBarItemDesktop extends ProviderWidget<NavBarItemModel> 
{
    @override
    Widget build(BuildContext context, NavBarItemModel model) 
    {
        return Text(
            model.title,
            style: TextStyle(
                color: Colors.white,
                fontSize: 18
            )
        );
    }
}