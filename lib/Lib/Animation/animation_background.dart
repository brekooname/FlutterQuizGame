import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';

class AnimateBackground extends StatefulWidget {
  Widget mainContent;
  Image? particleImage;

  AnimateBackground({
    Key? key,
    required this.mainContent,
    this.particleImage,
  }) : super(key: key);

  @override
  MyAnimatedWidgetState createState() => MyAnimatedWidgetState();
}

class MyAnimatedWidgetState extends State<AnimateBackground>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  ParticleOptions particles = const ParticleOptions(
    baseColor: Colors.cyan,
    spawnOpacity: 0.0,
    opacityChangeRate: 0.25,
    minOpacity: 0.1,
    maxOpacity: 0.4,
    particleCount: 45,
    spawnMaxRadius: 15.0,
    spawnMaxSpeed: 10.0,
    spawnMinSpeed: 5.0,
    spawnMinRadius: 7.0,
  );

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.ease);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.particleImage != null) {
      particles = particles.copyWith(
        image: widget.particleImage,
      );
    }

    return Center(
        child: AnimatedBackground(
      // vsync uses singleTicketProvider state mixin.
      vsync: this,
      behaviour: RandomParticleBehaviour(options: particles),
      child: Container(child: widget.mainContent),
    ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
