import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test3/components/components.dart';
import 'package:test3/login/login_screen.dart';
import 'package:test3/sign_up/signup.dart';

class Boarding {
  final String image;
  final String title;
  final String body;

  Boarding({required this.image, required this.title, required this.body});
}

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  var controller = PageController();

  List<Boarding> boarding = [
    Boarding(
      image: 'assets/images/on_board1.png',
      title: 'Get food delivery to your doorstep asap',
      body:
          'we have young abd professional delivery team that will bring your food as soon as possible to your doorstep',
    ),
    Boarding(
      image: 'assets/images/on_board2.png',
      title: 'Buy Any Food from your favorite restaurant',
      body:
          'we are constantly adding your favourite restaurant throughout the territory and around your area carefully selected',
    ),
    Boarding(
      image: 'assets/images/on_board2.png',
      title: 'Get the order to reach you quickly and easily',
      body: 'You can search for your order in the application to get it to your door safely without any problems',
    ),
  ];

  void submitedtologin() {
    navigateFinish(context, LoginScreen());
  }


  bool lastscreen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(30),
      child: Column(children: [
        Row(
          children: [
            Spacer(),
            Container(

              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: OutlinedButton(

                onPressed: () {
                  submitedtologin();
                },
                child: Text('Skip', style: TextStyle(color: Colors.black,),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            onPageChanged: (index) {
              if (index == boarding.length - 1) {
                setState(() {
                  lastscreen = true;
                  print('last');
                });
              } else {
                setState(() {
                  lastscreen = false;
                });
                print('not last');
              }
            },
            controller: controller,
            itemBuilder: (context, index) => onborading(boarding[index]),
            itemCount: boarding.length,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: SmoothPageIndicator(
              controller: controller,
              effect: const ExpandingDotsEffect(
                dotColor: Colors.grey,
                activeDotColor: Colors.deepOrange,
                dotHeight:10,
                expansionFactor: 4,
                dotWidth: 10,
                spacing: 5,

              ),
              count: boarding.length),
        ),
        const SizedBox(
          height: 20,
        ),
           Container(
         width: double.infinity,
         decoration: BoxDecoration(
           color: Colors.teal[200],
           borderRadius: BorderRadius.all(
             Radius.circular(8),
           ),
          ),

         child: OutlinedButton(onPressed: (){
           submitedtologin();
         }, child: const Text('Get Started'
         ,style: TextStyle(
color: Colors.white
           ),)),
           ),
        const SizedBox(
          height: 20,
        ),
        Row(children: [
          Text("     Dont Have an account ?",style: TextStyle(fontSize: 16),),
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){return Signup();}));
          }, child: Text("Sign Up",style: TextStyle(fontSize: 16),))
        ],),
      ]),
    ));
  }

  Widget onborading(Boarding model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image(image: AssetImage('${model.image}'))),
          const SizedBox(
            height: 25,
          ),
          Text(
            '${model.title}',
            style: TextStyle(fontSize: 25),
          ),
          const SizedBox(
            height: 14,
          ),
          Text('${model.body}'),
          const SizedBox(
            height: 25,
          ),
        ],
      );
}
// Text Editing Controller
