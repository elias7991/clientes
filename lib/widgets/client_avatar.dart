import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget clientAvatar(BuildContext context, String imageUrl) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(36),
    child: CachedNetworkImage(
      width: 48.0,
      height: 48.0,
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
        CircularProgressIndicator(
          value: downloadProgress.progress,
        ),
      errorWidget: (context, url, error) => const CircleAvatar(
        backgroundColor: Colors.grey,
        child: Icon(Icons.person, color: Colors.white),
      )
    )
  );
}