import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white70.withOpacity(0.93),
      appBar: AppBar(backgroundColor: Colors.white70.withOpacity(0.93),),
body:
SingleChildScrollView(
  physics: const BouncingScrollPhysics(),
  child:   Column(

    children: [

      Padding(
        padding: const EdgeInsets.only(
          right: 19.0
        ),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: Text(
            textAlign: TextAlign.start,
          'الإعدادات' ,
            style: Theme.of(context).textTheme.headline6!.copyWith(
              fontSize: 26 ,
              fontWeight: FontWeight.bold
            ),
  ),
        ),
      ),
  SizedBox(
    height: 31,
  ),
  Padding(
    padding: const EdgeInsets.only(
      bottom: 20
    ),
    child: Container(
      width: double.infinity,
      height: 89,
      color: myFavColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 25
            ),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/3b8ny.jpeg'),
              ),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mohamed Abdelghany',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: 14 ,
                  color: Colors.white
                ),
              ),
              Text(
                'Abdelghany@',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: 11,
                  color: Colors.white
                ),
              ),


            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 95
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10
              ),
              child: Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    ),
  ),
      SizedBox(
        height: 26,
      ),
      Container(
        color: Colors.white,
        child: ListTile(
          onLongPress: (){
            print('onLong pressed');
          },
          onTap: (){
            print('on tap pressed');
          },
          title: Text('حسابي',style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 14),),
          subtitle: Text('تعديل',style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 11),),
          trailing: Icon(Icons.arrow_forward),
         leading: IconButton(icon: Icon(Icons.account_circle,color: myFavColor,), onPressed: () {},),
          contentPadding: EdgeInsetsDirectional.all(15),
        ),
      ),
      Container(
        color: Colors.white,
        child: ListTile(
    onLongPress: (){
    print('onLong pressed');},
          onTap: (){
            print('on tap pressed');
          },
          title: Text('اللغة',style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 14),),
          subtitle: Text('تغيير لغة التطبيق',style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 11),),
          trailing: Icon(Icons.arrow_forward),
          leading: IconButton(icon: Icon(Icons.language,color: myFavColor,), onPressed: () {},),
          contentPadding: EdgeInsetsDirectional.all(15),
        ),
      ),
  Container(
    color: Colors.white,
    child: ListTile(
      onLongPress: (){
        print('onLong pressed');},
      onTap: (){
        print('on tap pressed');
      },
      title: Text('تسجيل خروج',style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 14),),
          subtitle: Text('تسجيل خروج من حسابك',style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 11),),
          trailing: Icon(Icons.arrow_forward),
      leading: IconButton(icon: Icon(Icons.logout,color: myFavColor,), onPressed: () {},),
          contentPadding: EdgeInsetsDirectional.all(15),
        ),
  ),
      SizedBox(
        height: 25,
      ),
      Padding(
        padding: const EdgeInsets.only(
          right: 25
        ),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: Text(
              'المزيد',
            style: Theme.of(context).textTheme.caption!.copyWith(
              fontSize: 14
            ),
          ),
        ),
      ),
      Container(
        color: Colors.white,
        child: ListTile(
          onLongPress: (){
            print('onLong pressed');},
          onTap: (){
            print('on tap pressed');
          },
          title: Text('الدعم والمساعدة',style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 14),),
          trailing: Icon(Icons.arrow_forward),
          leading: IconButton(icon: Icon(Icons.add_alert,color: myFavColor,), onPressed: () {},),
          contentPadding: EdgeInsetsDirectional.all(15),
        ),
      ),
      Container(
        color: Colors.white,
        child: ListTile(
          onLongPress: (){
            print('onLong pressed');},
          onTap: (){
            print('on tap pressed') ;
          },
          title: Text('عن التطبيق',style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 14),),
          trailing: Icon(Icons.arrow_forward),
          leading: IconButton(icon: Icon(Icons.monitor_heart,color: myFavColor,), onPressed: () {},),
          contentPadding: EdgeInsetsDirectional.all(15),
        ),
      ),



    ],

  ),
),
    );
  }
}
