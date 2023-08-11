// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:friends/controller/user_controller.dart';
import 'package:friends/model/user_model.dart';
import 'package:friends/view/details_screen.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var userData = Get.put(UserController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: FutureBuilder<User>(
              future: userData.getData(),
              builder: (context,snapShort){
                if(snapShort.hasData){
                  return ListView.builder(
                      itemCount: snapShort.data!.results.length??0,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index){
                        var userData = snapShort.data!.results[index];
                        return Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: GestureDetector(
                            onTap: (){
                              Get.to(()=> DetailsScreen(userDetailsData: userData,));
                            },
                            child: Container(
                              height: 70,
                              decoration: BoxDecoration(
                                  color: Colors.deepPurpleAccent,
                                  borderRadius: BorderRadius.circular(10)
                              ),child: ListTile(
                              leading: Image.network(userData.picture.thumbnail),
                              title: Text(userData.name.first+ " "+ userData.name.last,style: TextStyle(color: Colors.white),),
                              subtitle: Text(userData.location.country.toString(),style: TextStyle(color: Colors.white),),
                            ),
                            ),
                          ),
                        );
                      });

                }else{
                  return Center(child: CircularProgressIndicator(color: Colors.red,));
                }

              })
        ),
      ),
    );
  }
}
