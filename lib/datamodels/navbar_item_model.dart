import 'package:flutter/widgets.dart';

import 'package:radio_ben_zvi_website/pages/stateless_page.dart' as RBZPages;

class NavBarItemModel 
{
    final String   title;
    final RBZPages.Page   navigationToPage;
    final IconData iconData;

    NavBarItemModel({
        required this.title,
        required this.navigationToPage,
        required this.iconData,
    });
}