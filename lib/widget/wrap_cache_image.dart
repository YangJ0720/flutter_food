import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WrapCacheImage extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final BoxFit fit;
  final bool isPlaceholder;

  const WrapCacheImage(
      {Key key,
      this.url,
      this.width,
      this.height,
      this.fit = BoxFit.fill,
      this.isPlaceholder = true})
      : super(key: key);

  Widget _createView() {
    if (isPlaceholder) {
      return Container(color: Color(0xFFF0F0F0));
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) => _createView(),
    );
  }
}
