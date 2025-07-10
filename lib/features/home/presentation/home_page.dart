import 'package:fittest/features/home/presentation/widgets/test_item.dart';
import 'package:fittest/features/test_description/presentation/test_description_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../resources/strings.dart';
import 'bloc/test_list_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECEFF4),
      body: BlocBuilder<TestListBloc, TestListState>(
        builder: (context, state) {
          return Column(
            children: [
              Material(
                elevation: 4,
                shadowColor: Colors.black.withOpacity(0.1),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top + 10,
                    left: 16,
                    right: 20,
                    bottom: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                              const SizedBox(height: 4),
                              Text(
                                Strings.instructions,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: const Color(0xFF737E8A),
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Raleway",
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            icon: ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return LinearGradient(
                                  colors: [Colors.amber, Colors.yellow],
                                ).createShader(bounds);
                              },
                              child: const Icon(Icons.lightbulb, color: Colors.white),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Expanded(
                child: _buildContent(context, state),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, TestListState state) {
    if (state is TestListLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is TestListError) {
      return Center(child: Text(state.message));
    } else if (state is TestListLoaded) {
      return SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
        child: Column(
          children: [
            ...state.tests.map((test) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: TestItem(
                icon: test.name[0],
                title: test.name,
                description: test.description,
                buttonText: Strings.startTestButton,
                gradient: _getTestGradient(test.id),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TestDescriptionPage(test: test),
                    ),
                  );
                },
              ),
            )).toList(),

            TestItem(
              icon: 'R',
              title: Strings.results,
              description: Strings.homepageResDesc,
              buttonText: Strings.myResultsButton,
              gradient: const LinearGradient(
                colors: [Color(0xFF8FBCBB), Color(0xFF8FBCBB)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              onPressed: () {
              },
            ),
          ],
        ),
      );
    }
    return const SizedBox();
  }

  LinearGradient _getTestGradient(int testId) {
    final colors = [
      [const Color(0xFFBF616A), const Color(0xFFD08770)],
      [const Color(0xFFD08770), const Color(0xFFEBCB8B)],
      [const Color(0xFFEBCB8B), const Color(0xFFA3BE8C)],
      [const Color(0xFFA3BE8C), const Color(0xFF8FBCBB)],
    ];
    return LinearGradient(
      colors: colors[testId % colors.length],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );
  }
}