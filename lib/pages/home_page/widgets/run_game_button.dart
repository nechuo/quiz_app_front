import 'package:flutter/material.dart';
import '../../../i18n/generated/strings.g.dart';
import 'package:quiz_app_front/pages/matchmaking_page/matchmaking_page.dart';

class RunGameButton extends StatefulWidget {
  const RunGameButton({super.key});

  @override
  State<RunGameButton> createState() => _RunGameButtonState();
}

class _RunGameButtonState extends State<RunGameButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _floatAnim;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
    )..repeat(reverse: true);

    _floatAnim = Tween<double>(
      begin: 0,
      end: 6,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onRunGameButtonPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MatchmakingPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _floatAnim,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, -_floatAnim.value),
          child: child,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(top: 40),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withValues(alpha: 0.25),
              blurRadius: 20,
              spreadRadius: 10,
            ),
          ],
        ),

        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            padding: const EdgeInsets.only(
              top: 30,
              left: 50,
              right: 50,
              bottom: 30,
            ),
            backgroundColor: const Color.fromARGB(255, 157, 110, 237),
            elevation: 0,
          ),

          onPressed: () => _onRunGameButtonPressed(context),

          child: Text(
            t.home_page.run_game,
            style: const TextStyle(
              fontSize: 23,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
