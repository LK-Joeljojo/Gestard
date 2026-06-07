import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gestard/core/color.dart';
import 'package:gestard/core/enums.dart';
import 'package:gestard/presentation/authentication/view_model/user_auth_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

class SignUpScreen extends HookConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final nameController = useTextEditingController();
    final numberController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final selectRole = useState<UserRole?>(null);
    final obscureText = useState(true);
    final state = ref.watch(userAuthViewModelProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 25, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 10.h),
              Center(
                child: Column(
                  children: [
                    Text(
                      "Create an account",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium!.copyWith(fontSize: 20.sp),
                    ),
                    Text(
                      "Connect with your friends today",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4.h),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintText: "Enter Your Username",
                        hintStyle: TextStyle().copyWith(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: JColor.popupColor,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: TextFormField(
                            controller: numberController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: "Enter Your Phone Number",
                              hintStyle: TextStyle().copyWith(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: JColor.popupColor,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your phone number';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          flex: 2,
                          child: DropdownButtonFormField<UserRole>(
                            isExpanded: true,
                            padding: EdgeInsets.zero,
                            initialValue: selectRole.value,
                            dropdownColor: JColor.darkTextDisabled,
                            hint: Text(
                              "Select role",
                              style: TextStyle().copyWith(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: JColor.popupColor,
                              ),
                            ),
                            items: [
                              DropdownMenuItem(
                                value: UserRole.admin,
                                child: Text(
                                  "Admin",
                                  style: TextStyle().copyWith(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: UserRole.employee,
                                child: Text(
                                  "Employee",
                                  style: TextStyle().copyWith(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                            onChanged: (value) {
                              selectRole.value = value;
                            },
                            validator: (value) {
                              if (value == null) {
                                return "Select role";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Enter Your Email",
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
                    SizedBox(height: 15),
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
                    if (state.isLoading)
                      Center(child: CircularProgressIndicator()),
                    if (state.errorMessage != null)
                      Center(child: Text(state.errorMessage!)),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            ref
                                .read(userAuthViewModelProvider.notifier)
                                .register(
                                  fullName: nameController.text.trim(),
                                  email: emailController.text.trim(),
                                  phoneNumber: int.parse(numberController.text.trim()),
                                  password: passwordController.text.trim(),
                                  role: selectRole.value!,
                                );
                          }
                        },
                        child: Text("Sign Up"),
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
                      Text("Signup with Facebook"),
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
                      Text("Signup with Google"),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 3.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account ? "),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, "/login"),
                    child: Text(
                      "login",
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
