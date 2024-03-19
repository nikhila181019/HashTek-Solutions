import 'package:flutter/material.dart';
import 'package:hashtek_solutions/Screens/countrySelectionPage.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedIndex = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'My Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),

        // Assuming battery level from image
      ),
      body: Column(
        children: [
          // Profile picture and name section
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage("assets/img.png"),
                ),
                const SizedBox(
                  width: 20.0,
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Michael Watson',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                    Text(
                      '     (203) 2563-8542',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  height: 3,
                  thickness: 0.3,
                  color: Colors.white,
                  indent: 10,
                  endIndent: 10,
                ),
              ],
            ),
          ),

          // Profile options section
          Expanded(
            child: ListView(
              children: [
                buildListItem(0, Icons.person, 'Profile'),
                buildListItem(1, Icons.favorite, 'Favorite'),
                buildListItem(2, Icons.location_city_outlined, 'Country'),
                buildListItem(3, Icons.doorbell, 'Notification'),
                buildListItem(4, Icons.settings, 'Settings'),
                buildListItem(5, Icons.help, 'Help'),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GestureDetector(
                    onTap: () {
                      // Handle logout tap
                    },
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.white),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.logout,color: Colors.white,size: 24,),
                          SizedBox(width: 05,),
                          Center(
                              child: Text(
                                "Log out",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),

                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: Container(
              height: 60,
              width: 500,
              decoration: BoxDecoration(
                color: Color(0xFF1F1F1F),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                children: [
                  buildIconButton(0, Icons.home),
                  buildIconButton(1, Icons.calendar_month),
                  buildIconButton(2, Icons.document_scanner_outlined),
                  buildIconButton(3, Icons.bookmark),
                  buildIconButton(4, Icons.person),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListItem(int index, IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 12, 15, 0),
      child: Container(
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(80),
        ),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          trailing: const Icon(
            Icons.arrow_right,
            color: Colors.white,
          ),
          leading: Icon(
            icon,
            color: Colors.white,
          ),
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
            // Handle profile menu tap
            if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CountrySelection()),
              );
            }
          },
        ),
      ),
    );
  }

  Widget buildIconButton(int index, IconData icon) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Icon(
          icon,
          color: selectedIndex == index ? Colors.white : Colors.grey,
          size: 40,
        ),
      ),
    );
  }
}
