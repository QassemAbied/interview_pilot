import 'package:flutter/material.dart';

import '../../core/services/supabase_service/supabase_auth.dart';
import '../../core/widgets/app_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: AppButton(
          title: 'Home',
          onPressed: (){
            SupAbaseAuth().signOut();
          },
          isLoading: false,
        ),
      ),
    );
  }
}
