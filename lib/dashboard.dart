import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_reusable_ui/app_designs.dart';
import 'package:flutter_reusable_ui/db_helper.dart';
import 'package:flutter_reusable_ui/login.dart';
import 'package:flutter_reusable_ui/product_detail_page.dart';
import 'package:flutter_reusable_ui/splash_screen.dart';
import 'package:flutter_reusable_ui/widgets/app_carsouel.dart';
import 'package:flutter_reusable_ui/widgets/app_textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
   Dashboard({super.key});

  @override
  State<StatefulWidget> createState() => _DashboardState();
 }
class _DashboardState extends State<Dashboard>{
  final List<String>images =[
    "https://www.nestleprofessionalmena.com/sites/default/files/styles/np_article_small/public/2025-03/BANNER-3-EN.png?itok=m6nSijEO",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQENMzzK8H5In_HsuBAK5s65yVz2qomdCz-j-2O4Q4Xlw&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhpA_e6yu5Crz47DvJKMmYizK980s5ll_R5bWEKiI0n5pxpRZDlEdlTgI&s=10"
  ];
  final List<String> images2=[
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7CBJorho6YGePkRtqPY5gj9l2RwFyfdqGTNlddvpwwLiN5b6RyrkbjMJo&s=10",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw6q_9vfWskod3LT7uvQqe2w5ArN8G74SUzZaa6f1XDA&s"
  ];


  final List<Map<String,String>> items = [
    {
      "image" :"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdeUEf-zC7DED6-wqq6zEr3i_vffyYjsBmstsEwGxB3Q&s",
      "name" : "Tomato"
    },
    {
      "image":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5EtNEHzJE8QB1iL-FA1fxuJYG65oV7qmnGceHb07rZw&s",
      "name" : "Fruits"
    },
    {
      "image" : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3mnpsg1yzeZLXVRwPdhvwuX5DDfDuMgQYZDhr4I8Uow&s=10",
      "name" : "orange"
    },
    {
      "image" : "https://images.everydayhealth.com/images/2025/fruits-with-protein-help-boost-intake-pomegranate-1440x810.jpg",
      "name" : "red fruit",
    },
    {
      "image": "https://i.pinimg.com/originals/9c/25/85/9c258525e4eb471d29b3c0a2c22d000b.jpg",
      "name": "apple"
    }
  ];

  int index=0;
  var titleController = TextEditingController();
  var descController = TextEditingController();
  List<Map<String,dynamic>> notes =[];

  DbHelper? dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper.getInstance();
    getNotes();
  }
 getNotes() async {
    notes = await dbHelper!.getAllNotes();
    setState(() {

    });

 }
  @override
  Widget build(BuildContext context) {
    return PopScope( //this prevents also back btn to go back to main route
      //expanded never works inside expanded it just works with row and col
      canPop: false,
      child: Scaffold(
        appBar: AppBar( //main thing app bar real ma che j nai je apde use kryo che so e hataine krisu etle effect avse proper
            automaticallyImplyLeading: false, //removes back btn from app bar
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors:
                  [
                    Color(0xfff9f5f1),
                    Color(0xfffbe5da),
                    Color(0xfff9f5f1)

                  ],
                    // begin: AlignmentGeometry.bottomCenter,
                    // end: AlignmentGeometry.bottomEnd

                  )
              ),
            ),
            title: Row(
              children: [
                CircleAvatar(backgroundImage: NetworkImage(
                    "https://img.magnific.com/free-vector/woman-with-long-brown-hair-pink-shirt_90220-2940.jpg?semt=ais_hybrid&w=740&q=80")
                  ,radius: 25,),
                SizedBox(width: 15,),
                Column( //remove appbar  and add safearea
                  //instead of this column we can use listtile
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    Text("Morning, Roamina"),
                    Text("What would you buy today ?",style: AppDesigns.textSmall,)
                  ],
                ),
              ],
            ),

            actions:[
              Container(decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle
              ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                        onTap: () async {
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setBool(SplashScreen.loginKey,false);
                          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Loginscreen(),));
                        },
                        child: ClipOval(child: Icon(Icons.logout),)),
                  )),
              SizedBox(width: 15,),

            ]
        ),
        body:
        Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(

              colors: [
              Color(0xfffdebd3),
              Color(0xfffce6db),

            ],
            radius: 0.7,
              center: AlignmentGeometry.center,
            )
          ),
          child: SingleChildScrollView(

            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                  AppCarsouel(images: images),
                // AppCarsouel(images: images2),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppTextfield(hintText: 'Search', labelText: 'Enter Your Search',icon:Icon(Icons.search) ),
                ),
                //category
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Categories",style: AppDesigns.textTitle,),
                      Text("See all",style: AppDesigns.textSmall,)
                    ],
                  ),
                ),
                _Category(items: items),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Fresh Products",style: AppDesigns.textTitle,),
                      Text("See all",style: AppDesigns.textSmall,)
                    ],
                  ),
                ),
                GridView.builder(itemCount: items.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent( //they given fix we given dynamic
                    maxCrossAxisExtent: 200, //means same height and width
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailPage(items: items,index: index,),));
                      },
                      child: Hero(
                        tag: index,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage(items[index]["image"]!),
                                fit: BoxFit.cover
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child: Text(items[index]["name"]!)),
                                  Icon(Icons.favorite)
                                ],
                              ),
                              // SizedBox(height: 80,)
                            ],
                          ),
                        ),
                      ),
                    );
                  },),
                 notes.isNotEmpty ? ListView.builder(itemCount: notes.length,

                     shrinkWrap: true, //= Don't take all available space; take only the space your children need.
                   physics:  NeverScrollableScrollPhysics() ,// means let parent handle scrolling aanuy potanu b scrolling che je apde disbled krie chie,

                     itemBuilder: (context, index) {
                   return ListTile(
                     title: Text(notes[index][DbHelper.noteTitle]),
                     subtitle: Text(notes[index][DbHelper.noteDescription]),
                     trailing: Row(
                       mainAxisSize: MainAxisSize.min,
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         IconButton(onPressed: () {
                            showModalBottomSheet(context: context, builder: (context) {
                              return _bottomSheetUI();
                            },);
                         }, icon: Icon(Icons.edit)),
                         IconButton(onPressed: () async {
                            bool isDeleted =await dbHelper!.deleteNote(Id: index);
                            if(isDeleted){
                              getNotes();
                            }
                         }, icon: Icon(Icons.delete)),

                       ],
                     ),
                   );
                 },)
                     : Center(
                        child: CircularProgressIndicator(),
                 )

               ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(onPressed: () {
              showModalBottomSheet(context: context, builder:(context) {
                return _bottomSheetUI();
                },);
        }, label:Text("Add note"),
        icon: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat ,
      ),
    );
  }

  @override
  void dispose() {

  }
//rn we faced issue on hero nav during back button because what we doing is we have taken entire row in appbar which causes an issue

  Widget _bottomSheetUI({bool? isEdit}){
    return Container(
      decoration: BoxDecoration(
          gradient: RadialGradient(

            colors: [
              Color(0xfffdebd3),
              Color(0xfffce6db),

            ],
            radius: 0.7,
            center: AlignmentGeometry.center,
          )
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.close)
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    controller : titleController,
                    decoration: AppDesigns.inputDecoration(text: 'Enter Title', label: 'Title'),
                  ),
                  SizedBox(height: 25,),
                  TextField(
                    maxLines: 4,
                    controller : descController,
                    decoration: AppDesigns.inputDecoration(text: 'Enter Description', label: 'Description'),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: ElevatedButton(style: AppDesigns.elevatedBtStyle(bgcolor: Colors.red),onPressed: () {
                    Navigator.pop(context);
                  }, child: Text("Cancel")),
                ),
                SizedBox(width: 5,),
                Expanded(
                  child: ElevatedButton(style: AppDesigns.elevatedBtStyle(),onPressed: () async {
                    bool isAdded  =  await dbHelper!.add(title: titleController.text, description: descController.text);
                    if(isAdded){
                      getNotes();
                      titleController.clear();
                      descController.clear();
                      Navigator.pop(context);

                    }


                  }, child: Text("Add")),
                ),

              ],
            )

          ],
        ),
      ),

    );

  }

}

Widget _Category({required List<Map<String,String>> items}){
  return  Container(
      decoration: BoxDecoration(
          color: Color(0xfff4eed6)
      ),
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,itemBuilder: (context, index) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [
                ClipOval(child: Image.network(items[index]["image"]!,height: 90,width: 90,fit: BoxFit.cover,),),
                Text(items[index]["name"]!),
              ],
            )
          ],
        );
      },)
  );

}