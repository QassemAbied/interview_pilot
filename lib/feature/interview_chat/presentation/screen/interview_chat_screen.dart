import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_pilot/feature/interview_chat/presentation/screen/widget/chat_app_bar.dart';
import 'package:interview_pilot/feature/interview_chat/presentation/screen/widget/chat_input.dart';
import 'package:interview_pilot/feature/interview_chat/presentation/screen/widget/message_list.dart';
import '../../../../core/di/injection_container.dart';
import '../controller/interview_chat_cubit.dart';

class InterviewChatScreen extends StatelessWidget {
  const InterviewChatScreen({super.key, required this.interviewId});

  final String interviewId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<InterviewChatCubit>()..initialize(interviewId),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const InterviewQuestionProgress(),

              Expanded(child: MessageList(interviewId: interviewId)),

              const Divider(height: 1),
              ChatInput(interviewId: interviewId),

            ],
          ),
        ),
      ),
    );
  }
}
