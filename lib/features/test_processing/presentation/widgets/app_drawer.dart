import 'package:flutter/material.dart';
import 'package:fittest/resources/strings.dart';

class AppDrawer extends StatelessWidget {
  final int questionCount;
  final Function(int) onQuestionSelected;

  const AppDrawer({
    super.key,
    required this.questionCount,
    required this.onQuestionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFECEFF4),
      child: Column(
        children: [
          _buildHeader(context),
          Expanded(child: _buildQuestionsGrid()),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 16,
        bottom: 16,
        left: 24,
        right: 24,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 24,
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    Strings.fittinImage,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Text(
                Strings.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF3D4853),
                  fontFamily: "Raleway",
                ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.close_rounded, color: Color(0xFF3D4853)),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionsGrid() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1,
        ),
        itemCount: questionCount,
        itemBuilder: (context, index) {
          final gradients = const [
            LinearGradient(
              colors: [Color(0xFFBF616A), Color(0xFFD08770)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            LinearGradient(
              colors: [Color(0xFFD08770), Color(0xFFEBCB8B)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            LinearGradient(
              colors: [Color(0xFFEBCB8B), Color(0xFFA3BE8C)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            LinearGradient(
              colors: [Color(0xFFA3BE8C), Color(0xFF8FBCBB)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            LinearGradient(
              colors: [Color(0xFF8FBCBB), Color(0xFF88B2D0)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ];

          return Material(
            borderRadius: BorderRadius.circular(12),
            elevation: 2,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () => onQuestionSelected(index + 1),
              child: Container(
                decoration: BoxDecoration(
                  gradient: gradients[index % gradients.length],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Raleway",
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}