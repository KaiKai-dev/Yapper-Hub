import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AvatarFrame extends StatelessWidget {
  final String? url;
  final double size;
  const AvatarFrame({
    required this.url,
    this.size = 40,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size / 2),
      child: SizedBox(
        width: size,
        height: size,
        child: switch(url){
          null => Image.asset("assets/app_icons/defaultpfp.jpeg", fit: .fill,),
          _ => CachedNetworkImage(imageUrl: url ?? "", fit: .fill,),
        }
      ),
    );
    // return Container(
    //   width: size,
    //   height: size,
    //   child: CachedNetworkImage(imageUrl: url, fit: .fill,),
    // );
  }
}