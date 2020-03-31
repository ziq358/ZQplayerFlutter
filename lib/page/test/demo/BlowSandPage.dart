import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image/image.dart' as image;

const avatar_test =
    "http://a.hiphotos.baidu.com/zhidao/pic/item/5243fbf2b21193131848738461380cd791238dff.jpg";

class BlowSandPage extends StatefulWidget {
  @override
  _State createState() {
    return _State();
  }
}

class _State extends State<BlowSandPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.grey,
        child: ListView(
          children: <Widget>[
            Sandable(
              child: userInfoItem(),
            ),
          ],
        ),
      ),
    );
  }

  Widget userInfoItem() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 25.5, 0, 22.5),
      child: Row(
        children: <Widget>[
          ClipOval(
            child: CachedNetworkImage(
              width: 56,
              height: 56,
              imageUrl: avatar_test,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
              child: Container(
            height: 56,
            padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
            child: Text(
              "tianshang22",
              style: TextStyle(
                color: Colors.white,
                fontSize: 19.0,
              ),
            ),
          )),
          Image(
            image: AssetImage('images/white_right_arrow.png'),
            width: 20.0,
            height: 20.0,
          ),
        ],
      ),
    );
  }
}

class Sandable extends StatefulWidget {
  // 将需要沙化的内容包裹起来
  final Widget child;

  // 吹散动画的时间
  final Duration duration;

  // 图层数量  图层越多，吹散效果越好但是更耗时
  final int numberOfLayers;

  Sandable(
      {Key key,
      @required this.child,
      this.duration = const Duration(seconds: 3),
      this.numberOfLayers = 10})
      : super(key: key);

  @override
  _SandableState createState() {
    return _SandableState();
  }
}

class _SandableState extends State<Sandable> with TickerProviderStateMixin {
  // 吹散动画Controller
  AnimationController _mainController;

  // 重叠的分离图层
  List<Widget> layers = [];

  // key of child
  GlobalKey _globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    _mainController =
        AnimationController(vsync: this, duration: widget.duration);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ...layers,
        GestureDetector(
          onTap: () {
            blow();
          },
          child: _mainController.isAnimating
              ? Container()
              : RepaintBoundary(
                  key: _globalKey,
                  child: widget.child,
                ),
        ),
      ],
    );
  }

  Future<void> blow() async {
    // 获取到完整的图像
    image.Image fullImage = await _getImageFromWidget();

    // 获取原图的宽高
    int width = fullImage.width;
    int height = fullImage.height;

    // 初始化与原图相同大小的空白的图层
    List<image.Image> blankLayers =
        List.generate(widget.numberOfLayers, (i) => image.Image(width, height));

    // 将原图的像素点，分布到layer中
    separatePixels(blankLayers, fullImage, width, height);

    // 将图层转换为Widget
    layers = blankLayers.map((layer) => imageToWidget(layer)).toList();

    // 刷新页面
    setState(() {});

    // 开始动画
    _mainController.forward();
  }

  // 将一个Widget转为image.Image对象
  Future<image.Image> _getImageFromWidget() async {
    // _globalKey为需要图像化的widget的key
    RenderRepaintBoundary boundary =
        _globalKey.currentContext.findRenderObject();

    // ui.Image => image.Image
    var img = await boundary.toImage();
    var byteData = await img.toByteData(format: ImageByteFormat.png);
    var pngBytes = byteData.buffer.asUint8List();

    return image.decodeImage(pngBytes);
  }

  void separatePixels(List<image.Image> blankLayers, image.Image fullImage,
      int width, int height) {
    // 遍历所有的像素点
    for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {
        // 获取当前的像素点
        int pixel = fullImage.getPixel(x, y);
        // 如果当前像素点是透明的  则直接continue 减少不必要的浪费
        if (0 == pixel) continue;

        // 随机生成放入的图层index
        int index = Random().nextInt(widget.numberOfLayers);
        // 将像素点放入图层
        blankLayers[index].setPixel(x, y, pixel);
      }
    }
  }

  Widget imageToWidget(image.Image png) {
    // 先将image 转换为 Uint8List 格式
    Uint8List data = Uint8List.fromList(image.encodePng(png));

    // 定义一个先快后慢的动画过程曲线
    CurvedAnimation animation = CurvedAnimation(
        parent: _mainController, curve: Interval(0, 1, curve: Curves.easeOut));

    // 定义位移变化的插值（始末偏移量）
    Animation<Offset> offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      // 基础偏移量+随机偏移量
      end: Offset(50, -20) +
          Offset(30, 30).scale((Random().nextDouble() - 0.5) * 2,
              (Random().nextDouble() - 0.5) * 2),
    ).animate(animation);

    return AnimatedBuilder(
      animation: _mainController,
      child: Image.memory(data),
      builder: (context, child) {
        // 位移动画
        return Transform.translate(
          offset: offsetAnimation.value,
          // 渐隐动画
          child: Opacity(
            opacity: cos(animation.value * pi / 2), // 1 => 0
            child: child,
          ),
        );
      },
    );
  }
}
