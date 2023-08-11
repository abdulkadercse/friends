// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import '../model/user_model.dart';
import 'package:url_launcher/url_launcher.dart';
class DetailsScreen extends StatelessWidget {
  final Result userDetailsData;
  const DetailsScreen({super.key, required this.userDetailsData});

  //ph call
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  //email
  _launchEmail(String email) async {
    if (await canLaunch("mailto:$email")) {
      await launch("mailto:$email");
    } else {
      throw 'Could not launch';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userDetailsData.name.first.toString() +
            " " +
            userDetailsData.name.last.toString()),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(userDetailsData.picture.thumbnail), //NetworkImage
                  radius: 50,
                ),
              ),
              SizedBox(height: 10,),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.pink,
                  radius: 20.0,
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
                title: const Text(
                  "Full Name",
                  style: TextStyle(
                      color: Color(0xff181D27),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                subtitle: Text(userDetailsData.name.first.toString()+" "+ userDetailsData.name.last.toString(),
                  style: const TextStyle(
                    color: Color(0xff181D27),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.pink,
                  radius: 20.0,
                  child: const Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                ),
                title: const Text(
                  "Location",
                  style: TextStyle(
                      color: Color(0xff181D27),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                subtitle: Text(userDetailsData.location.street.name.toString(),
                  style: const TextStyle(
                    color: Color(0xff181D27),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.pink,
                  radius: 20.0,
                  child: const Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                ),
                title: const Text(
                  "City",
                  style: TextStyle(
                      color: Color(0xff181D27),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                subtitle: Text(userDetailsData.location.city.toString(),
                  style: const TextStyle(
                    color: Color(0xff181D27),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.pink,
                  radius: 20.0,
                  child: const Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                ),
                title: const Text(
                  "State",
                  style: TextStyle(
                      color: Color(0xff181D27),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                subtitle: Text(userDetailsData.location.state.toString(),
                  style: const TextStyle(
                    color: Color(0xff181D27),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.pink,
                  radius: 20.0,
                  child: const Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                ),
                title: const Text(
                  "Country",
                  style: TextStyle(
                      color: Color(0xff181D27),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                subtitle: Text(userDetailsData.location.country.toString(),
                  style: const TextStyle(
                    color: Color(0xff181D27),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.pink,
                  radius: 20.0,
                  child: const Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                ),
                trailing: GestureDetector(
                  onTap: (){
                    _makePhoneCall(userDetailsData.phone.toString());
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.pink,
                    radius: 20.0,
                    child: const Icon(
                      Icons.call,
                      color: Colors.white,
                    ),
                  ),
                ),
                title: const Text(
                  "Phone Number",
                  style: TextStyle(
                      color: Color(0xff181D27),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                subtitle: Text(userDetailsData.phone.toString(),
                  style: const TextStyle(
                    color: Color(0xff181D27),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Divider(
                  color: Colors.grey,
                ),
              ),

              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.pink,
                  radius: 20.0,
                  child: const Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                ),
                trailing: GestureDetector(
                  onTap: (){
                    _launchEmail(userDetailsData.email.toString());
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.pink,
                    radius: 20.0,
                    child: const Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                  ),
                ),
                title: const Text(
                  "Email address",
                  style: TextStyle(
                      color: Color(0xff181D27),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                subtitle: Text(userDetailsData.email.toString(),
                  style: const TextStyle(
                    color: Color(0xff181D27),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Divider(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
