part of '../register.dart';

class _Body extends StatefulWidget {
  const _Body();
  static final _formKey = GlobalKey<FormBuilderState>();
  @override
  State<_Body> createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _Body._formKey,
      child: Container(
        padding: const EdgeInsets.all(20),
        color: CustomColors.backgroundColor,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "Register",
                  style: TextStyle(color: CustomColors.darkGrey, fontSize: 70),
                ),
                Spaces.h20,
                AppInputTextField(
                  fieldType: FieldType.email,
                  labelText: "Email",
                ),
                Spaces.h20,
                AppInputTextField(
                  fieldType: FieldType.password,
                  labelText: 'Password',
                  minLength: 6,
                  maxLength: 20,
                ),
                Spaces.h20,
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
                          debugPrint(form.toString());
                          final isValid = form!.saveAndValidate();
                          if (!isValid) return;

                          final data = form.value;
                          setState(
                            () {
                              isLoading = true;
                            },
                          );

                          await AuthProvider.register(
                            data['Password'],
                            data['Email'],
                          );
                          await AuthProvider.login(
                            data['Email'],
                            data['Password'],
                          );
                          setState(
                            () {
                              isLoading = false;
                            },
                          );

                          Navigator.pop(context);
                        },
                        child: const Text("Register")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
