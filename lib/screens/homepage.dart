import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';

class PortfolioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section

            Container(
              color: AppColors.greycolor,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  upperNavigation(),
                  SizedBox(
                    height: 60,
                  ),
                  Row(
                    children: [
                      FirstHalf_Header(),
                      SizedBox(
                        width: 50,
                      ),
                      SecondHalf_Header(),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // About Me Section
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/image.png',
                        height: 487,
                        width: 433,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 20),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'About Me',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                              'Curabitur euismod, massa nec malesuada luctus, metus justo tincidunt lacus.',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Services Section
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Check My Services',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ServiceCard(
                        iconPath: 'assets/images/image.png',
                        title: 'Landing Page Design',
                      ),
                      ServiceCard(
                        iconPath: 'assets/images/image.png',
                        title: 'Mobile App Design',
                      ),
                      ServiceCard(
                        iconPath: 'assets/images/image.png',
                        title: 'Branding',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondHalf_Header extends StatelessWidget {
  const SecondHalf_Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            'assets/images/image.png',
            height: 375,
            width: 330,
            fit: BoxFit.cover,
          ),
        ),
        // Image.asset(
        //   'assets/images/image.png',
        //   height: 375,
        //   width: 50,
        // ),
        // Image.asset('assets/images/image.png', height: 100),
      ],
    );
  }
}

class FirstHalf_Header extends StatelessWidget {
  const FirstHalf_Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'OLAWALE \n OYINKANSOLA',
            textAlign: TextAlign.center,
            style: AppTextStyles.boldWhite,
          ),
          const SizedBox(height: 5),
          const Text(
            'UI/UX Designer',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Talk With Me'),
              ),
              const SizedBox(width: 10),
              OutlinedButton(
                onPressed: () {},
                child: const Text('See My Work'),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class upperNavigation extends StatelessWidget {
  const upperNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        Row(
          children: [
            TextButton(
              onPressed: () {},
              child: const Text(
                "Home",
                style: AppTextStyles.regular,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "About",
                style: AppTextStyles.regular,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Portfolio",
                style: AppTextStyles.regular,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Services",
                style: AppTextStyles.regular,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Contact Us",
                style: AppTextStyles.regular,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String iconPath;
  final String title;

  ServiceCard({required this.iconPath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Image.asset(iconPath, height: 80),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
