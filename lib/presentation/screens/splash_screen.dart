import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travels_app/presentation/widgets/loading_indicator.dart';
import 'package:travels_app/providers/auth_provider.dart';
import 'login_screen.dart';
import 'search_screen.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      body: authState.isLoading
          ? const LoadingIndicator()
          : authState.user != null
              ? const SearchScreen()
              : const LoginScreen(),
    );
  }
}
