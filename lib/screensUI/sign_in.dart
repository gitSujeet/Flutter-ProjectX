import 'package:flutter/material.dart';
import 'package:flutter_projectx/widgets/primary_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  void _onSignIn() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);

      // Simulate network delay
      Future.delayed(const Duration(seconds: 2), () {
        setState(() => _isLoading = false);
        // TODO: Perform Firebase Auth or Next Navigation
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key:_formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 32),
                  Center(
                    child: Text(
                      'Project X',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                   Text(
                    'Welcome back',
                     style: theme.textTheme.headlineMedium?.copyWith(
                       fontWeight: FontWeight.bold,),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Enter your credentials to sign in',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.grey),
                  ),
                  const SizedBox(height: 32),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // TODO: Add Forgot Password logic
                      },
                      child: const Text('Forgot Password?'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  PrimaryButton(
                    label: "Sign In",
                    onPressed: _onSignIn,
                    isLoading: _isLoading,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: const [
                      Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text('or'),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 24),
                  PrimaryButton(
                    label: "Continue with Google",
                    onPressed: () {},
                    backgroundColor: Colors.grey.shade300,
                    textColor: Colors.black,
                    leadingImage: const AssetImage("assets/google_logo.png"),
                  ),
                  const SizedBox(height: 12),
                  PrimaryButton(
                    label: "Continue with Apple",
                    onPressed: () {},
                    backgroundColor: Colors.grey.shade300,
                    textColor: Colors.black,
                    leadingImage: const AssetImage("assets/apple_logo.png"),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
          
                      },
                      child: const Text("Don't have an account? Sign Up"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
