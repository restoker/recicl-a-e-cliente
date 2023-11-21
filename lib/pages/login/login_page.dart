import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reciclae/pages/login/login_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:reciclae/utils/my_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _controller = LoginController();

  void refresh() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.init(context, refresh);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 4, 2, 2),
                image: DecorationImage(
                  image: AssetImage('assets/img/bg1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Positioned(
              top: -80.0,
              left: -90.0,
              child: CircleLogin(),
            ),
            const Positioned(
              top: 55,
              left: 30,
              child: TextLogin(),
            ),
            GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // _ImageBanner(),
                    const _ImageBannerLottie(),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: _TextFieldEmail(controlador: _controller),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: _TextFieldPassword(controlador: _controller),
                        ),
                      ),
                    ),
                    _ButtonLogin(controlador: _controller),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: const Text(
                            'O via social Media:',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          child: _CircleButton(
                            onPressed: () {},
                            iconPath: 'assets/page/welcome/apple.svg',
                          ),
                        ),
                        const Gap(50),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          child: _CircleButton(
                            onPressed: () {},
                            iconPath: 'assets/page/welcome/google.svg',
                          ),
                        ),
                      ],
                    ),
                    const Gap(23),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: _TextDontHaveAcount(controlador: _controller),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircleLogin extends StatelessWidget {
  const CircleLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240.0,
      height: 230.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        gradient: const LinearGradient(
          begin: Alignment(-0.95, 0.0),
          end: Alignment(1.0, 0.0),
          colors: [Color(0xff00C9A7), Color(0xff0088C2)],
        ),
      ),
      // child: Text(''),
    );
  }
}

class TextLogin extends StatelessWidget {
  const TextLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Login'.toUpperCase(),
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 22.0,
        fontFamily: 'Oswald',
      ),
    );
  }
}

class _ImageBannerLottie extends StatelessWidget {
  const _ImageBannerLottie({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //     // borderRadius: BorderRadius.circular(25.0),
      //     ),
      margin: EdgeInsets.only(
        top: 110.0,
        bottom: MediaQuery.of(context).size.height * 0.15,
      ),
      child: Lottie.asset(
        'assets/json/recicle.json',
        width: 280.0,
        height: 200.0,
        fit: BoxFit.cover,
        // repeat: false,
      ),
    );
  }
}

class _TextFieldEmail extends StatelessWidget {
  const _TextFieldEmail({
    Key? key,
    required this.controlador,
  }) : super(key: key);

  final LoginController controlador;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(30.0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        controller: controlador.emailController,
        textInputAction: TextInputAction.next,
        // onSubmitted: (texto) => controlador.login(context),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'Email',
          labelStyle: TextStyle(
            color: MyColors.colorprimario,
          ),
          hintText: 'Correo electrónico',
          hintStyle: TextStyle(
            color: MyColors.colorprimario,
          ),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
          prefixIcon: Icon(
            CupertinoIcons.mail,
            color: MyColors.colorprimario,
          ),
        ),
      ),
    );
  }
}

class _TextFieldPassword extends StatelessWidget {
  const _TextFieldPassword({
    Key? key,
    required this.controlador,
  }) : super(key: key);
  final LoginController controlador;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(30.0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        controller: controlador.passwordController,
        textInputAction: TextInputAction.send,
        onSubmitted: (texto) => controlador.login(),
        decoration: InputDecoration(
          hintText: 'Password',
          labelText: 'Password',
          labelStyle: TextStyle(
            color: MyColors.colorprimario,
          ),
          hintStyle: TextStyle(
            color: MyColors.colorprimario,
          ),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
          prefixIcon: Icon(
            CupertinoIcons.padlock_solid,
            color: MyColors.colorprimario,
          ),
          suffixIcon: controlador.isBlind
              ? IconButton(
                  onPressed: () => controlador.mostrarPassword(),
                  icon: Icon(
                    CupertinoIcons.eye,
                    color: MyColors.colorprimario,
                  ),
                )
              : IconButton(
                  onPressed: () => controlador.mostrarPassword(),
                  icon: Icon(
                    CupertinoIcons.eye_slash,
                    color: MyColors.colorprimario,
                  ),
                ),
        ),
        obscureText: controlador.isBlind ? true : false,
      ),
    );
  }
}

class _ButtonLogin extends StatelessWidget {
  const _ButtonLogin({
    Key? key,
    required this.controlador,
  }) : super(key: key);

  final LoginController controlador;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        gradient: const LinearGradient(
          begin: Alignment(-0.95, 0.0),
          end: Alignment(1.0, 0.0),
          colors: [Color(0xff00C9A7), Color(0xff0088C2)],
        ),
      ),
      width: double.infinity,
      height: MediaQuery.of(context).size.height > 720 ? 50 : 30,
      margin: const EdgeInsets.symmetric(horizontal: 20.0)
          .copyWith(top: 40.0, bottom: 20.0),
      child: ElevatedButton(
        onPressed: () => controlador.login(),
        style: ElevatedButton.styleFrom(
          elevation: 5.0,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          // onSurface: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Text(
          'Ingresar'.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}

class _CircleButton extends StatelessWidget {
  const _CircleButton({
    Key? key,
    required this.onPressed,
    required this.iconPath,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.all(11.0),
      onPressed: onPressed,
      child: SvgPicture.asset(iconPath),
    );
  }
}

class _TextDontHaveAcount extends StatelessWidget {
  final LoginController controlador;

  const _TextDontHaveAcount({
    Key? key,
    required this.controlador,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '¿No tienes una Cuenta?',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
          // textAlign: TextAlign.center,
        ),
        const SizedBox(width: 10.0),
        GestureDetector(
          child: Text(
            'Registrate Aquí',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: MyColors.colorprimario,
              fontSize: 16.0,
            ),
          ),
          onTap: () => Navigator.pushNamed(context, 'registro'),
        ),
      ],
    );
  }
}
