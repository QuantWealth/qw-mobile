import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quantwealth/app/theme/theme.dart';

import 'default_loading.dart';

class BaseScaffold extends StatefulWidget {
  final String? title;
  final String? bgImage;
  final Widget? titleWidget;
  final Function? onBack;
  final List<Widget>? suffix;
  final bool extendBodyBehindAppBar;
  final bool isCenterTitle;
  final Widget body;
  final Color? backgroundColor;
  final bool onLoading;
  final bool isFirstPage;
  final bool safeArea;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Color? navBarColor;
  final Color? statusBarColor;
  final PreferredSizeWidget? toolbar;

  const BaseScaffold({
    super.key,
    this.safeArea = true,
    this.bgImage,
    this.backgroundColor,
    this.isCenterTitle = false,
    this.title,
    this.titleWidget,
    this.onBack,
    this.suffix,
    required this.body,
    this.extendBodyBehindAppBar = true,
    this.onLoading = false,
    this.isFirstPage = false,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.toolbar,
    this.navBarColor = Colors.transparent,
    this.statusBarColor = Colors.transparent,
  });

  @override
  State<BaseScaffold> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<BaseScaffold> {
  final double APPBAR_HEIGHT = 100.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          color: widget.backgroundColor ?? bg,
          width: double.infinity,
          height: double.infinity,
        ),
        Image.asset(
          widget.bgImage ?? 'assets/images/qw_bg.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light.copyWith(
              systemNavigationBarColor: widget.navBarColor,
              statusBarColor: widget.statusBarColor,
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
              extendBody: false,
              appBar: widget.title != null ||
                      widget.titleWidget != null ||
                      widget.toolbar != null
                  ? AppBar(
                      iconTheme: IconThemeData(color: Colors.white),
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      centerTitle: widget.isCenterTitle,
                      title: widget.titleWidget,
                      actions: widget.suffix,
                      bottom: widget.toolbar,
                    )
                  : null,
              body: widget.body,
              bottomNavigationBar: widget.bottomNavigationBar,
              floatingActionButton: widget.floatingActionButton,
              floatingActionButtonLocation:
                  widget.floatingActionButtonLocation ??
                      FloatingActionButtonLocation.centerFloat,
            ),
          ),
        ),
        if (widget.onLoading) const DefaultLoading(),
      ],
    );
  }
}
