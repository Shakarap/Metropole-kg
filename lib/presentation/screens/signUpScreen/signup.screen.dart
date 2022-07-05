import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:metropole/app/constants/app.colors.dart';
import 'package:metropole/app/routes/app.routes.dart';
import 'package:metropole/presentation/screens/signUpScreen/widget/welcome.signup.widget.dart';
import 'package:metropole/presentation/widgets/dimensions.widget.dart';
import 'package:metropole/core/notifiers/authentication.notifer.dart';
import 'package:metropole/core/notifiers/theme.notifier.dart';
import 'package:metropole/presentation/widgets/custom.animated.container.dart';
import 'package:metropole/presentation/widgets/custom.text.field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final TextEditingController userEmailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController userPassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ThemeNotifier _themeNotifier = Provider.of<ThemeNotifier>(context);
    var themeFlag = _themeNotifier.darkTheme;
    AuthenticationNotifier authNotifier(bool renderUI) =>
        Provider.of<AuthenticationNotifier>(context, listen: renderUI);

    _createAccount() {
      if (_formKey.currentState!.validate()) {
        authNotifier(false).createAccount(
            context: context,
            useremail: userEmailController.text,
            username: userNameController.text,
            userpassword: userPassController.text);
      }
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: themeFlag ? AppColors.mirage : AppColors.creamColor,
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            welcomeTextSignup(themeFlag: themeFlag),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(35.0, 10.0, 35.0, 2.0),
                          child: CustomTextField.customTextField(
                              textEditingController: userNameController,
                              hintText: 'Колдонуучу атын жаз',
                              validator: (val) =>
                                  val!.isEmpty ? 'Колдонуучу атын жаз' : null),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(35.0, 10.0, 35.0, 2.0),
                          child: CustomTextField.customTextField(
                            textEditingController: userEmailController,
                            keyboardType: TextInputType.emailAddress,
                            hintText: 'email жаз',
                            validator: (val) =>
                                !RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                        .hasMatch(val!)
                                    ? 'email жаз'
                                    : null,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(35.0, 10.0, 35.0, 2.0),
                          child: CustomTextField.customTextField(
                            onChanged: (val) {
                              authNotifier(false)
                                  .checkPasswordStrength(password: val);
                            },
                            obscureText: true,
                            textEditingController: userPassController,
                            hintText: 'Сыр сөздү жаз',
                            validator: (val) =>
                                val!.isEmpty ? 'Сыр сөздү жаз' : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                  vSizedBox1,
                  Padding(
                    padding: const EdgeInsets.fromLTRB(35.0, 10.0, 35.0, 2.0),
                    child: Row(
                      children: [
                        Text(authNotifier(true).passwordEmoji!),
                        hSizedBox1,
                        if (authNotifier(true).passwordLevel! == 'Weak')
                          CustomAnimatedContainer.customAnimatedContainer(
                            height: 10,
                            width: MediaQuery.of(context).size.width * 0.10,
                            context: context,
                            color: Colors.red,
                            curve: Curves.easeIn,
                          ),
                        if (authNotifier(true).passwordLevel! == 'Medium')
                          CustomAnimatedContainer.customAnimatedContainer(
                            height: 10,
                            width: MediaQuery.of(context).size.width * 0.40,
                            context: context,
                            color: Colors.blue,
                            curve: Curves.easeIn,
                          ),
                        if (authNotifier(true).passwordLevel! == 'Strong')
                          CustomAnimatedContainer.customAnimatedContainer(
                            height: 10,
                            width: MediaQuery.of(context).size.width * 0.70,
                            context: context,
                            color: Colors.green,
                            curve: Curves.easeIn,
                          ),
                      ],
                    ),
                  ),
                  vSizedBox1,
                  MaterialButton(
                    height: MediaQuery.of(context).size.height * 0.05,
                    minWidth: MediaQuery.of(context).size.width * 0.8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    onPressed: () async {
                      _createAccount();
                    },
                    color: AppColors.rawSienna,
                    child: const Text(
                      'Катталуу',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            vSizedBox2,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Аккаунт барбы? ",
                  style: TextStyle(
                    color: themeFlag ? AppColors.creamColor : AppColors.mirage,
                    fontSize: 14.0,
                  ),
                ),
                GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushNamed(AppRouter.loginRoute),
                  child: Text(
                    "Кирүү",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color:
                          themeFlag ? AppColors.creamColor : AppColors.mirage,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
