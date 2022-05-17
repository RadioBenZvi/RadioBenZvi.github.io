// ignore_for_file: deprecated_member_use, non_constant_identifier_names, prefer_const_constructors, library_prefixes

import 'package:flutter/material.dart';
import 'package:radio_ben_zvi_website/widgets/image_placeholder/image_placeholder.dart';
import 'package:vrouter/vrouter.dart';

import 'package:radio_ben_zvi_website/globals.dart' as g;
import 'package:radio_ben_zvi_website/pages/state_page.dart' as RBZPages;

class NavBarLogo extends RBZPages.Page
{
    const NavBarLogo({Key? key}) : super(key: key);

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
                        child: ImageWidgetPlaceholder(
                            image: AssetImage('assets/images/logo/logo.png'),
                            placeholder: Text("Logo Image"),
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover
                        )
                        ,
                        onPressed: () => context.vRouter.to("/loading?page=home")
                    )
                )
            )
        );
    }
}