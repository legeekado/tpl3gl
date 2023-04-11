import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  final Function(int) onNext;
  const AuthScreen({super.key, required this.onNext});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _formGlobalKey = GlobalKey<FormState>();

  String adr_email = "";
  final RegExp emailRegExp = RegExp(r"[a-z0-9\._-]+@[a-z0-9\._-]+\.[a-z]+");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(),
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            child: Column(
              children: [
                //   SizedBox(
                //     height: 200.0,
                //   ),
                RichText(
                  text: TextSpan(
                    text: 'Authentifiez'.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: '-'.toUpperCase(),
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'vous'.toUpperCase(),
                      ),
                      TextSpan(
                        text: ' !'.toUpperCase(),
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Merci de renseignez vos infos',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Form(
                  key: _formGlobalKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Entrez votre adresse email',
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            adr_email = value;
                          });

                          // _formGlobalKey.currentState!.validate();
                          print("input = ${adr_email}");
                        },
                        validator: (value) => adr_email.isEmpty ||
                                !emailRegExp.hasMatch(adr_email)
                            ? 'Vérifier l\'email saisi...'
                            : null,
                        decoration: InputDecoration(
                          hintText: 'ex: bilal@groupe-isi.com',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2.0),
                            borderSide: BorderSide(
                              color: Colors.amber,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.amber,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      ElevatedButton(
                        onPressed: adr_email.isEmpty ||
                                !emailRegExp.hasMatch(adr_email)
                            ? null
                            : () {
                                if (_formGlobalKey.currentState!.validate()) {
                                  print('form validé');
                                  widget.onNext(1);
                                } else {
                                  print('form non validé');
                                }
                              },
                        child: Text(
                          'Suivant'.toUpperCase(),
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 5.0,
                          backgroundColor: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
