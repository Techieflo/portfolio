import 'dart:collection';

import 'package:flutter/material.dart';

import 'package:portfolio/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Portfolioscreen extends StatefulWidget {
  @override
  _PortfolioscreenState createState() => _PortfolioscreenState();
}

class _PortfolioscreenState extends State<Portfolioscreen> {
  final ScrollController _scrollController = ScrollController();

  // GlobalKeys to identify each section
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  bool _hovering = false;
  bool _isHovered = false;

  // Track the active section
  String activeSection = "about";

  // Function to scroll to a specific section
  void scrollToSection(GlobalKey key, String section) {
    final RenderBox? box = key.currentContext?.findRenderObject() as RenderBox?;
    if (box != null) {
      final position = box.localToGlobal(Offset.zero).dy +
          _scrollController.offset -
          kToolbarHeight;
      _scrollController.animateTo(
        position,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
      setState(() {
        activeSection = section;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1D),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A1D),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () => scrollToSection(aboutKey, "about"),
                  child: Text(
                    "About",
                    style: TextStyle(
                      color: activeSection == "about"
                          ? Colors.orange
                          : Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => scrollToSection(skillsKey, "skills"),
                  child: Text(
                    "My Skills",
                    style: TextStyle(
                      color: activeSection == "skills"
                          ? Colors.orange
                          : Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => scrollToSection(projectsKey, "projects"),
                  child: Text(
                    "Projects",
                    style: TextStyle(
                      color: activeSection == "projects"
                          ? Colors.orange
                          : Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => scrollToSection(contactKey, "contact"),
                  child: Text(
                    "Contact",
                    style: TextStyle(
                      color: activeSection == "contact"
                          ? Colors.orange
                          : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage(
                        "assets/images/mypic.jpg"), // Replace with your image
                  ),
                  const SizedBox(width: 25),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "I am ",
                            style: TextStyle(
                              fontSize: 28,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Olaniyan Favour",
                            style: TextStyle(
                              fontSize: 28,
                              fontFamily: 'poppins',
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        "Flutter Mobile Application Developer",
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          scrollToSection(contactKey, "contact");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shadowColor: Colors.grey,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        child: const Text(
                          "Let's build something",
                          style: AppTextStyles.mediumWhite,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                height: 0.009,
                color: Colors.grey,
              ),
              const SizedBox(height: 24),

              // About Section
              Container(
                key: aboutKey,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "About",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
//                       '''I am olaniyan favour.  A User-centered Flutter Developer driven by a passion for crafting outstanding mobile applications with over two years of experience.\nThroughout my career, I've consistently delivered high-quality and innovative solutions, showcasing my problem-solving abilities and a sharp focus on UI/UX design.\nI enjoy turning complex ideas into functional, user-friendly apps, focusing on both the small details and the bigger picture.
// Over the years, I’ve worked on projects that required innovative solutions, strong problem-solving skills, and collaboration with talented teams. I’m particularly skilled at using Dart and tools like GetX, provider, and BLOC for state management to build scalable apps that are both efficient and easy to maintain. I also have a knack for designing intuitive interfaces that people enjoy using.
// What drives me is the opportunity to solve real-world problems through technology. I’m always exploring new tools and trends to stay ahead in this fast-paced field. When I’m not coding, you’ll likely find me mentoring other developers, learning something new, or brainstorming creative ways to tackle challenges in app development.
// ''',      abo
                      aboutMe,
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 0.009,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 20,
              ),
              // My Skills Section
              Container(
                key: skillsKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "My Skills",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      "Below are some of my skills: ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w100,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 16),
                    GridView.count(
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      childAspectRatio: 3 / 2,
                      children: [
                        _buildSkillCard("Flutter", Icons.flutter_dash_rounded),
                        _buildSkillCard("Dart", Icons.code),
                        _buildSkillCard("FireBase", Icons.dashboard),
                        _buildSkillCard("API Integration",
                            Icons.connect_without_contact_outlined),
                        _buildSkillCard("Git Source Control", Icons.cloud),
                        _buildSkillCard("BLOC, Getx, Provider",
                            Icons.manage_history_outlined),
                        _buildSkillCard("Python", Icons.code),
                        _buildSkillCard("NoSQL DB", Icons.storage),
                        _buildSkillCard("HTML & CSS", Icons.web),
                      ],
                    ),
                  ],
                ),
              ),

              // Projects Section
              Container(
                key: projectsKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Projects",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 16.0,
                      physics: const NeverScrollableScrollPhysics(),
                      childAspectRatio: 3 / 1,
                      children: [
                        _buildProjectCard(
                          "assets/images/whatsapp.png",
                          "https://play.google.com/store/apps/details?id=com.smarttech.instasave",
                          "Project 1:All Status Saver: A complete All socials status saver app integrating API ",
                        ),
                        _buildProjectCard(
                          "assets/images/nysc.png",
                          "https://appetize.io/embed/b_zwurpttmed4ebki3vfcq6xsi3e",
                          "Project 2: An innovative e-commerce solution built with flutter",
                        ),
                        GestureDetector(
                          onTap: () {
                            scrollToSection(aboutKey, "about");
                          },
                          child: _buildProjectCard(
                            "assets/images/s1.png",
                            "  https://appetize.io/embed/b_zwurpttmed4ebki3vfcq6xsi3e",
                            "Project 3: Portfolio website built with flutter",
                          ),
                        ),
                        _buildProjectCard(
                          "assets/images/home.png",
                          "https://appetize.io/embed/b_vizwrcekly4inharvge74raxmu",
                          "Project 4: IOT Based Home Automation system with flutter",
                        ),
                        _buildProjectCard(
                          "assets/images/Plain credit.png",
                          "https://appetize.io/embed/b_5kryddtm45irvgkjk4nmbfmhha",
                          "Project 5: A finTech App currently in build",
                        ),
                        _buildProjectCard(
                          "assets/images/google.png",
                          "https://appetize.io/embed/b_eyqivqoxuqtsv4m5ztytkpstai",
                          "Project 6: NaijaMeter a quiz App with flutter",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Contact Section
              Container(
                key: contactKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Contact",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Feel free to reach out to me for any opportunities or inquiries.",
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            try {
                              if (await canLaunch(
                                  "in/olaniyan-favour-175928215")) {
                                await launch("in/olaniyan-favour-175928215");
                              }
                            } catch (e) {
                              print(e);
                            }
                          },
                          child: TextButton(
                              onPressed: () async {
                                try {
                                  if (await canLaunchUrlString(
                                      "in/olaniyan-favour-175928215")) {
                                    await launchUrlString(
                                        "in/olaniyan-favour-175928215");
                                  }
                                } catch (e) {
                                  print(e);
                                }
                              },
                              child: const Text(
                                "LinkedIn: $linkendin",
                                style: TextStyle(
                                    color: Colors.orange, fontSize: 16),
                              )),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              email,
                              style:
                                  TextStyle(color: Colors.orange, fontSize: 16),
                            )),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Phone: $phone",
                              style:
                                  TextStyle(color: Colors.orange, fontSize: 16),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Center(
                      child: Text(
                        "© website built with flutter",
                        style: TextStyle(
                            color: Colors.grey, fontStyle: FontStyle.italic),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkillCard(String title, IconData icon) {
    return Card(
      color: const Color(0xFF2D2D2D),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.orange, size: 40),
            const SizedBox(height: 8),
            Text(
              title,
              style: AppTextStyles.mediumWhite,
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildProjectCard(String imagePath, String url, String description) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          // Trigger a zoom effect when hovering over the card
          // _hovering = true;
        });
      },
      onExit: (_) {
        setState(() {
          // Reset the zoom effect when not hovering
          _hovering = false;
        });
      },
      child: AnimatedScale(
        scale: _hovering ? 1.1 : 1.0, // Apply zoom effect (1.1 is zoomed in)
        duration: const Duration(milliseconds: 200), // Speed of the zoom effect
        child: Card(
          color: const Color(0xFF2D2D2D),
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      description,
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    TextButton(
                        onPressed: () async {
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {}
                        },
                        child: const Text(
                          "View Project",
                          style: TextStyle(
                            color: Colors.orange,
                            decoration: TextDecoration.underline,
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
