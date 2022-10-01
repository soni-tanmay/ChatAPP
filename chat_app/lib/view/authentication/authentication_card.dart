part of 'authentication.dart';

class AuthenticationCard extends StatefulWidget {
  const AuthenticationCard({super.key, this.isSignUp = false});
  final bool isSignUp;

  @override
  State<AuthenticationCard> createState() => _AuthenticationCardState();
}

class _AuthenticationCardState extends State<AuthenticationCard> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.28,
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppTheme.lightTheme.colorScheme.primary,
        boxShadow: [
          BoxShadow(
            color: AppTheme.black.withOpacity(0.2),
            offset: const Offset(10, 16),
            blurRadius: 10,
            spreadRadius: -10,
          ),
          BoxShadow(
            color: AppTheme.black.withOpacity(0.2),
            offset: const Offset(-10, 16),
            blurRadius: 10,
            spreadRadius: -10,
          ),
          BoxShadow(
            color: AppTheme.black.withOpacity(0.1),
            offset: const Offset(-16, -16),
            blurRadius: 10,
            spreadRadius: -10,
          ),
          BoxShadow(
            color: AppTheme.black.withOpacity(0.1),
            offset: const Offset(20, -16),
            blurRadius: 10,
            spreadRadius: -10,
          )
        ],
      ),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              widget.isSignUp ? 'Welcome to the family!' : 'Welcome back!',
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (widget.isSignUp) ...[
              const SizedBox(height: 30),
              LabelTextField(
                controller: usernameController,
                labelText: 'Username',
                prefixIcon: Icons.person_outline,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Username is required';
                  }
                  return null;
                },
              ),
            ],
            const SizedBox(height: 30),
            LabelTextField(
              controller: emailController,
              labelText: 'Email',
              prefixIcon: Icons.email_outlined,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Email is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 30),
            LabelTextField(
              controller: passwordController,
              labelText: 'Password',
              prefixIcon: Icons.lock_outline_rounded,
              isObsecure: true,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 30),
            CustomButton(
              onTap: () {
                if (formKey.currentState!.validate()) {}
              },
              height: 45,
              width: double.maxFinite,
              buttonText: widget.isSignUp ? 'Sign Up' : 'Log In',
            ),
          ],
        ),
      ),
    );
  }
}
