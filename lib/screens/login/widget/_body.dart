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
      child: FormBuilder(
        key: _Body._formKey,
        child: Container(
          padding: const EdgeInsets.all(20),
          color: CustomColors.backgroundColor,
          child: Column(
            children: [
              const Text(
                "Login",
                style: TextStyle(color: CustomColors.darkGrey, fontSize: 70),
              ),
              Spaces.h35,
              buildFormBuilderTextField("email", "Email", false),
              const SizedBox(height: 10),
              buildFormBuilderTextField("password", "Password", true),
              const SizedBox(height: 20),
              isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all<Size>(
                            const Size(300, 50)),
                        foregroundColor: MaterialStateProperty.all<Color>(
                            CustomColors.lightGrey),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            CustomColors.accent),
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
                          data['email'],
                          data['password'],
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
                      )),
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
      ),
    );
  }
}
