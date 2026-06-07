import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gestard/core/color.dart';
import 'package:gestard/presentation/authentication/view_model/user_auth_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final obscureText = useState(true);
    final stateLogin = ref.watch(userAuthViewModelProvider);
    final isChecked = useState(false);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 25, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 12.h),
              Center(
                child: Text(
                  "Hi, Welcome Back!🖐",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 21.sp,
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                        left: 8,
                        right: 8,
                        bottom: 4,
                      ),
                      child: Text(
                        "Email",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: JColor.popupColor,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "example@gmail.com",
                        hintStyle: TextStyle().copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: JColor.popupColor,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                        ).hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 25,
                        left: 8,
                        right: 8,
                        bottom: 4,
                      ),
                      child: Text(
                        "Password",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: JColor.popupColor,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: obscureText.value,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        hintText: "Enter Your Password",
                        suffixIcon: IconButton(
                          onPressed: () {
                            obscureText.value = !obscureText.value;
                          },
                          icon: Icon(
                            obscureText.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            size: 18.sp,
                          ),
                        ),
                        hintStyle: TextStyle().copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: JColor.popupColor,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Mot de passe requis";
                        }
                        if (value.length < 8) {
                          return "Mininum 8 caracteres";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: isChecked.value,
                              onChanged: (value) {
                                isChecked.value = value!;
                              },
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              visualDensity: VisualDensity.compact,
                            ),
                            Text(
                              "Remember Me",
                              style: Theme.of(context).textTheme.bodyLarge!
                                  .copyWith(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                        Text(
                          "Forgot password?",
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500,
                                color: JColor.redColor.withValues(alpha: 0.6),
                              ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    if (stateLogin.isLoading)
                      Center(child: CircularProgressIndicator()),
                    if (stateLogin.errorMessage != null)
                      Center(child: Text(stateLogin.errorMessage!)),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            ref
                                .read(userAuthViewModelProvider.notifier)
                                .login(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                );
                          }
                        },
                        child: Text("Login"),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 7.h),
              Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text("Or continue with"),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              SizedBox(height: 5.h),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.facebook, size: 20.sp),
                      SizedBox(width: 20),
                      Text("Login with facebook"),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.g_mobiledata, size: 25.sp),
                      SizedBox(width: 20),
                      Text("Login with google"),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 3.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account ? "),
                  GestureDetector(
                    onTap: () {
                      ref.read(userAuthViewModelProvider.notifier).cleanState();
                      Navigator.pushNamed(context, "/signup");
                      },
                    child: Text(
                      "signup",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: JColor.primayColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
