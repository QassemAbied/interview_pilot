import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_pilot/feature/profile/screen/profile_body.dart';
import '../../auth/presentation/controller/auth_cubit.dart';
import '../../auth/presentation/controller/auth_state.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _bioController;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _bioController = TextEditingController();
    context.read<AuthCubit>().getUser();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.user != null) {
          _nameController.text = state.user!.name;
          _emailController.text = state.user?.email ?? '';
          _bioController.text = state.user?.bio ?? '';
        }
      },
      builder: (context, state) {
        final user = state.user;

        return Scaffold(
          appBar: AppBar(title: Text("Profile")),
          body: SafeArea(
            child: ProfileBody(
              formKey: _formKey,
              user: user,
              nameController: _nameController,
              emailController: _emailController,
              bioController: _bioController,
              state: state,
            ),
          ),
        );
      },
    );
  }
}
