import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(const SuperCoolApp());
}

class SuperCoolApp extends StatelessWidget {
  const SuperCoolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CoolHome(),
    );
  }
}

class CoolHome extends StatefulWidget {
  const CoolHome({super.key});

  @override
  State<CoolHome> createState() => _CoolHomeState();
}

class _CoolHomeState extends State<CoolHome> {
  double _scale = 0.8;
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // Simple entry animation trigger
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _scale = 1.0;
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Deep mesh-style gradient background
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
          ),
        ),
        child: Center(
          child: AnimatedOpacity(
            duration: const Duration(seconds: 1),
            opacity: _opacity,
            child: AnimatedScale(
              duration: const Duration(milliseconds: 800),
              scale: _scale,
              curve: Curves.elasticOut,
              child: GlassCard(),
            ),
          ),
        ),
      ),
    );
  }
}

class GlassCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 250,
          width: 320,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.white.withOpacity(0.2)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.bolt, color: Colors.cyanAccent, size: 50),
              const SizedBox(height: 20),
              Text(
                'Hello Flutter',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(0.9),
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Build something amazing.',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}