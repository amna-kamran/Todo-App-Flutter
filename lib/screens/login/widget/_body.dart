part of '../login.dart';

class _Body extends StatefulWidget {
  const _Body();

  static final _formKey = GlobalKey<FormBuilderState>();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding:
            const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [CustomColors.backgroundColor, CustomColors.lightGrey],
            begin: Alignment.topCenter,
            end: Alignment(0, 6),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Hi, ",
                    style: GoogleFonts.openSans(
                        color: CustomColors.white, fontSize: 50),
                  ),
                  TextSpan(
                    text: "Welcome",
                    style: GoogleFonts.openSans(
                      color: CustomColors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: " Back!",
                    style: GoogleFonts.openSans(
                        color: CustomColors.white, fontSize: 50),
                  ),
                ],
              ),
            ),
            Spaces.h35,
            AppInputTextField(
              fieldType: FieldType.email,
              labelText: 'Email',
            ),
            const SizedBox(height: 10),
            AppInputTextField(
              fieldType: FieldType.password,
              labelText: 'Password',
              minLength: 6,
              maxLength: 20,
            ),
            const SizedBox(height: 20),
            isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      onPrimary: CustomColors.lightGrey,
                      fixedSize: const Size(200, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: Colors.white),
                      ),
                    ),
                    onPressed: () async {
                      final form = _Body._formKey.currentState;
                      final isValid = form!.saveAndValidate();
                      if (!isValid) return;

                      final data = form.value;

                      setState(() {
                        isLoading = true;
                      });

                      await AuthProvider.login(
                        data['Email'],
                        data['Password'],
                      );

                      setState(() {
                        isLoading = false;
                      });
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
            Spaces.h40,
            const GoogleLoginButton(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(color: CustomColors.lightGrey),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(color: CustomColors.yellow),
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
