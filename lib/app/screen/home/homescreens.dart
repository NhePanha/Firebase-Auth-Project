import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:project_test/app/logic/bloc/buttons/bloc/button_change_colors_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_test/app/screen/home/profile_drawers.dart';

class CustomBottomNavScreen extends StatefulWidget {
  const CustomBottomNavScreen({Key? key}) : super(key: key);
  @override
  State<CustomBottomNavScreen> createState() => _CustomBottomNavScreenState();
}

class _CustomBottomNavScreenState extends State<CustomBottomNavScreen> {
  int _selectedIndex = 0;
  bool isSelected = false;
  final List<IconData> icons = [
    Icons.menu_book_outlined, // Book
    Icons.directions_run, // Shoe
    Icons.apple_outlined, // Apple
    Icons.person_outline, // Profile
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildNavIcon(int index) {
    return IconButton(
      onPressed: () => _onItemTapped(index),
      icon: Icon(
        icons[index],
        color: _selectedIndex == index ? Colors.indigo : Colors.grey,
        size: 28,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ButtonChangeColorsBloc(),
      child: Scaffold(
        drawer: ProfileDrawers.profileDrawer(context),
        appBar: AppBar(
          leading: Builder(
            builder: (context) => InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://lh3.googleusercontent.com/a/ACg8ocIMPWxuHHENZKmmzXA6KFY-Lxgakhs3tVlUqyNt62OK0cHWix8=s576-c-no"),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        backgroundColor: const Color(0xFFF5F6FC),
        body: BlocConsumer<ButtonChangeColorsBloc, ButtonChangeColorsState>(
          listener: (contextC, state) {
            // Add your listener logic here
            if (state is ChangeColors) {
              isSelected = state.isSelected;
            }
          },
          builder: (contextC, state) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  // image show slider
                  // image_showslid(),
                  Container(
                    width: double.infinity,
                    height: 400,
                    color: isSelected ? Colors.black : Colors.pink,
                  ),
                  Text(
                    'Custom Bottom Navigation Bar',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Color(0xFFE969FF) : Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      print("Test$isSelected");
                      contextC
                          .read<ButtonChangeColorsBloc>()
                          .add(ChangeColorsEvent(isSelected: !isSelected));
                    },
                    child: Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.black : Colors.amber,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: const Center(
                        child: Text("Tap Me",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      print("Test$isSelected");
                      contextC
                          .read<ButtonChangeColorsBloc>()
                          .add(ChangeColorsEvent(isSelected: !isSelected));
                    },
                    child: Container(
                      width: 200,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Color(0xFF6A78F1),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: const Center(
                        child: Text("Tap Me",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
        floatingActionButton: Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [Color(0xFF6A78F1), Color(0xFF4E5DE9)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.4),
                blurRadius: 20,
                spreadRadius: 1,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: IconButton(
            onPressed: () {
              // Handle center button action
            },
            icon: const Icon(Icons.add, color: Colors.white, size: 32),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          elevation: 12,
          notchMargin: 20,
          color: Colors.white,
          child: SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    _buildNavIcon(0),
                    _buildNavIcon(1),
                  ],
                ),
                const SizedBox(width: 32), // space for FAB notch
                Row(
                  children: [
                    _buildNavIcon(2),
                    _buildNavIcon(3),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class image_showslid extends StatelessWidget {
  const image_showslid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: ImageSlideshow(
        indicatorColor: Colors.blue,
        onPageChanged: (value) {
          debugPrint('Page changed: $value');
        },
        autoPlayInterval: 3000,
        isLoop: true,
        children: [
          Image.asset(
            'images/sample_image_1.jpg',
            fit: BoxFit.cover,
          ),
          Image.asset(
            'images/sample_image_2.jpg',
            fit: BoxFit.cover,
          ),
          Image.asset(
            'images/sample_image_3.jpg',
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
