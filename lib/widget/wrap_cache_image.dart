import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WrapCacheImage extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  final BoxFit fit;
  final bool isPlaceholder;
  final String asset;

  const WrapCacheImage(
      {Key key,
      this.url,
      this.width,
      this.height,
      this.fit = BoxFit.fill,
      this.isPlaceholder = true,
      this.asset = 'images/aal.png'})
      : super(key: key);

  Widget _createView() {
    if (isPlaceholder) {
      return Container(
        color: Color(0xFFBEBEBE),
        child: Center(child: Image.asset(asset, width: 120, height: 60)),
      );
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
