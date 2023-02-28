import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fifa/src/app/dependency_injection.dart';
import 'package:fifa/src/common/environment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path/path.dart';

class AppImage extends StatefulWidget {
  final String image;
  final Size? imageSize;
  final Size? boxSize;
  final WidgetBuilder? placeholder;
  final WidgetBuilder? error;
  final Alignment alignment;
  final bool circularShape;
  final bool forceExplicitUrl;
  final BoxFit? fit;
  final int? memCacheWidth;
  final int? memCacheHeight;

  /// If non-null, this color is blended with each image pixel using [colorBlendMode].
  final Color? color;

  /// Used to combine [color] with this image.
  ///
  /// The default is [BlendMode.srcIn]. In terms of the blend mode, [color] is
  /// the source and this image is the destination.
  ///
  /// See also:
  ///
  ///  * [BlendMode], which includes an illustration of the effect of each blend mode.
  final BlendMode? colorBlendMode;
  const AppImage({
    Key? key,
    String? image,
    this.imageSize,
    this.boxSize,
    this.placeholder,
    this.error,
    this.alignment = Alignment.center,
    this.fit,
    this.memCacheWidth,
    this.memCacheHeight,
    this.circularShape = false,
    this.forceExplicitUrl = false,
    this.color,
    this.colorBlendMode,
  })  : image = image ?? '',
        super(key: key);

  @override
  State<AppImage> createState() => _AppImageState();

  ///Returns an ImageProvider which is not cached. It's useful for Widgets that accept only ImageProviders as parameters.
  ///It does NOT caches the Image
  static ImageProvider<NetworkImage> provider({required String url}) => NetworkImage(buildImageUrl(url, null));
}

class _AppImageState extends State<AppImage> {
  double? imageSizeWidth;
  double? imageSizeHeight;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final url = widget.forceExplicitUrl ? widget.image : buildImageUrl(widget.image, null);
    final size = widget.boxSize ?? widget.imageSize;

    Widget errorBuilder(BuildContext context) => SizedBox.fromSize(
          size: size,
          child: widget.error != null ? widget.error!(context) : null,
        );

    if (url.isEmpty) {
      return errorBuilder(context);
    }

    return SizedBox.fromSize(
      size: size,
      child: Container(
        clipBehavior: widget.circularShape ? Clip.hardEdge : Clip.none,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: MeasureSize(
          onChange: (size) {
            if (mounted) {
              setState(() {
                imageSizeWidth = size.width * 2;
                imageSizeHeight = size.height * 2;
              });
            }
          },
          child: CachedNetworkImage(
            alignment: widget.alignment,
            colorBlendMode: widget.colorBlendMode,
            color: widget.color,
            imageUrl: url,
            fit: widget.fit,
            width: imageSizeWidth,
            memCacheHeight: imageSizeHeight?.toInt(),
            memCacheWidth: imageSizeWidth?.toInt(),
            height: imageSizeHeight,
            errorWidget: widget.error != null
                ? (context, _, dynamic __) => AnimatedSwitcher(
                      duration: const Duration(milliseconds: 150),
                      child: errorBuilder(context),
                    )
                : null,
            placeholder: widget.placeholder != null ? (context, child) => widget.placeholder!(context) : null,
            fadeInDuration: const Duration(milliseconds: 150),
            fadeOutDuration: const Duration(milliseconds: 150),
          ),
        ),
      ),
    );
  }
}

/// The sizes in which the server can serve the images
const _supportedImageSizes = [16, 32, 48, 64, 96, 128, 256, 384, 640, 750, 828, 1080, 1200, 1920, 2048, 3840];

/// Returns the most appropriate size in which the backend server can retrieve the images given a [Size]
Size _optimalSupportedImageSize(Size size) {
  final width = _supportedImageSizes.firstWhere((e) => e >= size.width, orElse: () => 640);
  final height = _supportedImageSizes.firstWhere((e) => e >= size.height, orElse: () => 640);
  return Size(width.toDouble(), height.toDouble());
}

/// If the [fqdn] parameter is passed and optimized image for the provided size is returned
String buildImageUrl(String image, Size? size, [String? fqdn]) {
  final assetUrl = getIt<Environment>().assetsUrl;
  if (image.isEmpty) return '';

  final hash = withoutExtension(image);
  final ext = extension(image);
  late final String url;

  if (fqdn != null && fqdn.isNotEmpty) {
    final _size = size == null ? '640' : '${_optimalSupportedImageSize(size).width.toInt()}';
    url = 'https://$fqdn/_next/image?url=${Uri.encodeFull('$assetUrl/img/$hash/full$ext&w=$_size&q=75')}';
  } else {
    final _size = size == null ? 'full' : '${size.width.toInt()}x${size.height.toInt()}';
    url = '$assetUrl/$hash/$_size$ext';
  }
  return url;
}

Future<void> precacheAppImage(
  BuildContext context,
  String image,
  Size size,
) async {
  final url = buildImageUrl(image, size);

  if (url.isEmpty) {
    return;
  }

  await precacheImage(
    NetworkImage(url),
    context,
  );
}

class AdaptiveImageProvider extends ImageProvider {
  AdaptiveImageProvider(String url) : _delegate = _resolve(url);
  final ImageProvider _delegate;

  static ImageProvider _resolve(String url) {
    final uri = Uri.parse(url);
    switch (uri.scheme) {
      case 'asset':
        final path = uri.toString().replaceFirst('asset://', '');
        return AssetImage(path);
      case 'file':
        final file = File.fromUri(uri);
        return FileImage(file);
      case 'http':
      case 'https':
        return NetworkImage(url);
      default:
        throw ArgumentError('Unsupported scheme: ${uri.scheme}');
    }
  }

  @override
  ImageStreamCompleter load(Object key, DecoderCallback decode) => _delegate.load(key, decode);

  @override
  Future<Object> obtainKey(ImageConfiguration configuration) => _delegate.obtainKey(configuration);
}

typedef OnWidgetSizeChange = void Function(Size size);

class MeasureSizeRenderObject extends RenderProxyBox {
  Size? oldSize;
  final OnWidgetSizeChange onChange;

  MeasureSizeRenderObject(this.onChange);

  @override
  void performLayout() {
    super.performLayout();

    var newSize = child!.size;
    if (oldSize == newSize) return;

    oldSize = newSize;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onChange(newSize);
    });
  }
}

class MeasureSize extends SingleChildRenderObjectWidget {
  final OnWidgetSizeChange onChange;

  const MeasureSize({
    Key? key,
    required this.onChange,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return MeasureSizeRenderObject(onChange);
  }
}
