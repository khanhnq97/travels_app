import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travels_app/providers/auth_provider.dart';

class UserProfileScreen extends ConsumerWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("User Profile")),
      body: authState.user == null
          ? const Center(child: Text('Please log in to see your profile'))
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Name: ${authState.user?.name}'),
                  Text('Email: ${authState.user?.email}'),
                  ElevatedButton(
                    onPressed: () {
                      ref.read(authProvider.notifier).logoutUser();
                    },
                    child: const Text('Logout'),
                  )
                ],
              ),
            ),
    );
  }
}
