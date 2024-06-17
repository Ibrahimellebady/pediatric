import 'package:flutter/material.dart';
import 'package:pediatric_pt/core/models/patient_model.dart';

import '../widgets/pages_widgets/patient_personal_history_widget.dart';
import '../widgets/pages_widgets/patient_present_history_widget.dart';

class PatientSheet extends StatefulWidget {
  final PatientModel patientModel;

  const PatientSheet({required this.patientModel});

  @override
  State<PatientSheet> createState() => _PatientSheetState();
}

class _PatientSheetState extends State<PatientSheet> {
  // methods to control page view
  PageController _pageController = PageController();
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  void toNextPage() {
    if (currentPageIndex < 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void toPrevoiusPage() {
    if (currentPageIndex > 0) {
      _pageController.previousPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
      print(currentPageIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        children: [
          PatientPersonalHistoryWidget(
            patientModel: widget.patientModel,
            onNextPressed: toNextPage,
            onPreviousPressed: toPrevoiusPage,
          ),
          PatientPresentHistoryWidget(
            patientModel: widget.patientModel,
            onNextPressed: toNextPage,
            onPreviousPressed: toPrevoiusPage,
          )
        ],
      )),
    );
  }
}
