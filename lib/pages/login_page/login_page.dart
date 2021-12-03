import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:test_digistarts/module/auth/domain/usecases/login_usecase.dart';
import 'package:test_digistarts/module/service/service_locator.dart';
import 'package:test_digistarts/pages/home_page/home_page.dart';
import 'package:test_digistarts/store/auth_store/auth_store.dart';
import 'package:test_digistarts/utils/theme.dart';
import '';
import 'widgets/custom_button.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late AuthStore _authStore;

  late TextEditingController txtCode;
  late TextEditingController txtPassword;
  @override
  void initState() {
    txtCode = TextEditingController();
    txtPassword = TextEditingController();
    _authStore = locator.get<AuthStore>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24.0, 40.0, 24.0, 0),
          child: ListView(
            //  crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login to your\naccount',
                    style: heading2.copyWith(color: textBlack),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Image.asset(
                  //   'assets/images/accent.png',
                  //   width: 99,
                  //   height: 4,
                  // ),
                ],
              ),
              SizedBox(
                height: 48,
              ),
              Form(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: textWhiteGrey,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: TextFormField(
                        controller: txtCode,
                        decoration: InputDecoration(
                          hintText: 'Code',
                          hintStyle: heading6.copyWith(color: textGrey),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: textWhiteGrey,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: TextFormField(
                        obscureText: true,
                        controller: txtPassword,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: heading6.copyWith(color: textGrey),
                          suffixIcon: Icon(Icons.visibility_off_outlined),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 32,
              ),
              SizedBox(
                height: 32,
              ),
              Observer(builder: (_) {

                if(_authStore.isLoginLoading){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return GestureDetector(
                  child: CustomPrimaryButton(
                    buttonColor: primaryBlue,
                    textValue: 'Login',
                    textColor: Colors.white,
                  ),
                  onTap: () {
                    _authStore
                        .login(
                            params: LoginParams(
                                codigo: txtCode.text,
                                password: txtPassword.text))
                        .then((value) {
                      _authStore.loginResult(value, context);
                    });
                  },
                );
              }),
              SizedBox(
                height: 24,
              ),
              Center(
                child: Text(
                  'OR',
                  style: heading6.copyWith(color: textGrey),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              CustomPrimaryButton(
                buttonColor: Color(0xfffbfbfb),
                textValue: 'Login with Google',
                textColor: textBlack,
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: regular16pt.copyWith(color: textGrey),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => RegisterPage()));
                    },
                    child: Text(
                      'Register',
                      style: regular16pt.copyWith(color: primaryBlue),
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
