// ignore_for_file: non_constant_identifier_names, import_of_legacy_library_into_null_safe, library_prefixes

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart' 
    deferred as ResponsiveBuilder;

import 'package:radio_ben_zvi_website/widgets/navigation_bar/items/itemDesktop.dart' 
    deferred as NavigationBarDesktop;
import 'package:radio_ben_zvi_website/widgets/navigation_bar/items/itemMobile.dart' 
    deferred as NavigationBarMobile;
import 'package:radio_ben_zvi_website/datamodels/navbar_item_model.dart' 
    deferred as NavBarItemModel;
import 'package:radio_ben_zvi_website/pages/stateless_page.dart' as RBZPages;
import 'package:radio_ben_zvi_website/extensions/hover_extensions.dart';

class NavBarItem extends RBZPages.Page 
{
    final String title;
    final RBZPages.Page navigationToPage;
    final IconData icon;

    const NavBarItem(
        this.title,
        this.navigationToPage,
        {
            Key? key,
            this.icon = Icons.home,
            required ToPage
        }
    ) : super(key: key, ToPage: ToPage);

    @override
    Widget build(BuildContext context) 
    {
        var model = NavBarItemModel.NavBarItemModel(
            title: title,
            navigationToPage: navigationToPage,
            iconData: icon,
        );

        return GestureDetector(
            onTap: () {
                ToPage(navigationToPage);
            },
            child: Provider.value(
                value: model,
                child: ResponsiveBuilder.ScreenTypeLayout(
                    tablet: NavigationBarDesktop.NavBarItemDesktop(),
                    mobile: NavigationBarMobile.NavBarItemMobile()
                ).showCursorOnHover
            )
        );
    }
}