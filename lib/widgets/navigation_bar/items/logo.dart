// ignore_for_file: deprecated_member_use, non_constant_identifier_names, prefer_const_constructors, library_prefixes

import 'package:flutter/material.dart';

import 'package:radio_ben_zvi_website/globals.dart' as g;
import 'package:radio_ben_zvi_website/pages/loading/load_page.dart';
import 'package:radio_ben_zvi_website/pages/state_page.dart' as RBZPages;
import 'package:radio_ben_zvi_website/pages/home/page.dart' as Home;

class NavBarLogo extends RBZPages.Page
{
    const NavBarLogo({Key? key, required ToPage}) : super(key: key, ToPage: ToPage);

    @override
    State<NavBarLogo> createState() => _NavBarLogoState();
}

// _NavBarLogoState is a state class for the NavBarLogo widget.
// extend the State class to create a state class for a stateful widget.
// with the extension HoverExtensions
class _NavBarLogoState extends State<NavBarLogo>
{
    bool isHover = false;

    @override
    Widget build(BuildContext context)
    {
        final HoveredTransform = Matrix4.identity()
            ..scale(1.2)
            ..translate(-5, -3, 0);
        final ButtonTransform = isHover
            ? HoveredTransform
            : Matrix4.identity();

        return SizedBox(
            height: 100,
            width: 100,
            child: MouseRegion(
                onHover: (event) => setState(() => isHover = true),
                onExit: (event) => setState(() => isHover = false),
                child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    transform: ButtonTransform,
                    child: FlatButton(
                        color: Colors.transparent,
                        hoverColor: Colors.transparent,
                        shape: StadiumBorder(),
                        child: Image.asset('assets/images/logo/logo.png'),
                        onPressed: () => LoadPage(ToPage: widget.ToPage, Page: Home.Home(ToPage: widget.ToPage))
                    )
                )
            )
        );
    }
}