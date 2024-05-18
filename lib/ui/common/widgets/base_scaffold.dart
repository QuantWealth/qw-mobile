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
  final Widget? suffix;
  final bool isCenterTitle;
  final Widget body;
  final Color? backgroundColor;
  final bool onLoading;
  final bool isFirstPage;
  final bool safeArea;
  final Widget? bottomNavigationBar;

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
            value: SystemUiOverlayStyle.light,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: widget.title != null || widget.titleWidget != null
                  ? PreferredSize(
                      preferredSize: Size.fromHeight(70.0),
                      child: widget.titleWidget ??
                          Container(
                            color: Colors.transparent,
                            height: double.infinity,
                            width: double.infinity,
                            child: _appBar(),
                          ),
                    )
                  : null,
              body: widget.body,
              bottomNavigationBar: widget.bottomNavigationBar,
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
                    Container(
                      padding: const EdgeInsets.only(right: 8),
                      child: widget.suffix!,
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
