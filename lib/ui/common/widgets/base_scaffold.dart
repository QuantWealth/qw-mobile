import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quantwealth/app/theme/theme.dart';

import 'default_image.dart';
import 'default_loading.dart';

class BaseScaffold extends StatefulWidget {
  final String? title;
  final String? bgImage;
  final Widget? titleWidget;
  final Function? onBack;
  final List<Widget>? suffix;
  final bool isCenterTitle;
  final Widget body;
  final Color? backgroundColor;
  final bool onLoading;
  final bool isFirstPage;
  final bool safeArea;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final Color? navBarColor;
  final Color? statusBarColor;

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
    this.onLoading = false,
    this.isFirstPage = false,
    this.bottomNavigationBar,
    this.floatingActionButton,
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
              extendBodyBehindAppBar: true,
              extendBody: true,
              appBar: widget.title != null || widget.titleWidget != null
                  ? AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      centerTitle: widget.isCenterTitle,
                      title: widget.titleWidget,
                      actions: widget.suffix,
                    )
                  : null,
              body: widget.body,
              bottomNavigationBar: widget.bottomNavigationBar,
              floatingActionButton: widget.floatingActionButton,
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
            ),
          ),
        ),
        if (widget.onLoading) const DefaultLoading(),
      ],
    );
  }

  _appBar() {
    bool enableBack = widget.onBack != null;
    bool enableTitle = widget.title != null;
    bool enableSuffix = widget.suffix != null;

    if (enableBack || enableSuffix || enableTitle) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        color: Colors.transparent, // widget.backgroundColor ?? bg,
        height: APPBAR_HEIGHT,
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            if (enableBack || enableSuffix)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  (enableBack)
                      ? GestureDetector(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            widget.onBack!();
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            color: Colors.transparent,
                            alignment: Alignment.centerLeft,
                            child: DefaultImage(
                              path: 'assets/icons/ic_back.svg',
                              width: 40,
                              height: 40,
                            ),
                          ),
                        )
                      : Container(),
                  if (widget.suffix != null)
                    Row(
                      children: widget.suffix!,
                    ),
                ],
              ),
            if (enableTitle)
              Container(
                alignment: widget.isCenterTitle ? Alignment.center : null,
                padding: EdgeInsets.only(left: widget.isCenterTitle ? 0 : 50),
                child: Text(
                  widget.title!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: fontTitle(),
                ),
              ),
          ],
        ),
      );
    }
    return Container();
  }
}
