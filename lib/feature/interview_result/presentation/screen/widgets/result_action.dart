import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/routing/route_names.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/spacing.dart';
import '../../../../interview/domain/entities/interview_entity.dart';
import '../../../domain/entities/interview_evaluation_entity.dart';
import '../../../domain/entities/interview_pdf_args.dart';

class ResultActions extends StatelessWidget {
  const ResultActions({
    super.key,
    required this.evaluation,
    required this.interview,
  });

  final InterviewEvaluationEntity evaluation;
  final InterviewEntity interview;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButton(
          title: 'Back Home',
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        verticalSpace(12),

        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {
              context.pushNamed(
                RouteNames.interviewPdfPreview,
                extra: InterviewPdfArgs(
                  interview: interview,
                  evaluation: evaluation,
                ),
              );
            },
            icon: const Icon(Icons.picture_as_pdf_rounded),
            label: const Text('View PDF Report'),
          ),
        ),
      ],
    );
  }
}
