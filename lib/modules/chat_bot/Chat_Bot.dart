// ignore_for_file: file_names

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:es3fny_user_app/app_localization.dart';
import 'package:es3fny_user_app/cubit/cubit.dart';
import 'package:es3fny_user_app/models/message_model.dart';
import 'package:es3fny_user_app/modules/chat_bot/cubit/cubit.dart';
import 'package:es3fny_user_app/shared/components/components.dart';
import 'package:es3fny_user_app/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intl;

class ChatBotScreen extends StatelessWidget {
  ChatBotScreen({Key? key}) : super(key: key);
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<ChatBotCubit, List<ChatMessage>>(
      listener: (context, state) {},
      builder: (context, messages) {
        ChatBotCubit cubit = BlocProvider.of(context);
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(65),
            child: AppBar(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              )),
              automaticallyImplyLeading: false,
              backgroundColor: myFavColor,
              title: Padding(
                padding: const EdgeInsets.only(left: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'AidBot',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 20, color: myFavColor9),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        CircleAvatar(
                          backgroundColor: myFavColor10,
                          radius: 25,
                          child: Image.asset(
                            'assets/images/Bot.png',
                            width: 35,
                            height: 35,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.5),
                          child: CircleAvatar(
                            backgroundColor: myFavColor,
                            radius: 5.8,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.8),
                          child: CircleAvatar(
                            backgroundColor: myFavColor11,
                            radius: 5,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: myFavColor,
                  statusBarIconBrightness: Brightness.light),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_outlined),
                onPressed: () {
                  Navigator.pop(context);
                },
                color: myFavColor9,
              ),
            ),
          ),
          body: ConditionalBuilder(
            condition: messages.isNotEmpty,
            builder: (context) => Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      controller: cubit.scrollController,
                      itemCount: messages.length,
                      itemBuilder: (context, index) =>
                          _buildMessage(context, messages[index]),
                    ),
                  ),
                ),
                _buildEnterMessageWidget(context, cubit),
              ],
            ),
            fallback: (context) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Container(
                  width: size.width * 0.754,
                  height: size.height * 0.307,
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadiusDirectional.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.height * 0.0135,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'AidBot',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontSize: 24),
                              ),
                              Text(
                                'للمحادثة السريعة',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontSize: 24),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.0160,
                          ),
                          Image.asset(
                            'assets/images/chat bot.png',
                            width: size.width * 0.32,
                            height: size.height * 0.147,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'كيف يمكنني مساعدتك',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 24),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const Spacer(),
                _buildEnterMessageWidget(context, cubit),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildEnterMessageWidget(BuildContext context, ChatBotCubit cubit) {
    return StreamBuilder<bool>(
      stream: context.read<MainCubit>().internetStream,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData && !snapshot.data!) {
          return GestureDetector(
            onTap: (){
              showNoInternetDialog(context: context);
            },
            child: Container(
              height: 44,
              width: double.infinity,
              color: myFavColor,
              child: Center(
                child: Text(
                  "noInternet".tr(context),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontSize: 12, color: myFavColor9),
                ),
              ),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: 'اكتب رسالتك...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Theme.of(context).cardColor,
                      filled: true,
                      hintStyle:
                      Theme.of(context).textTheme.caption!.copyWith(fontSize: 18),
                    ),
                    onFieldSubmitted: (value) {
                      debugPrint(value);
                    },
                    onTap: () {},
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                const SizedBox(
                  width: 17,
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: myFavColor,
                  child: IconButton(
                      onPressed: () {
                        cubit.sendMessage(messageController.text);
                        messageController.clear();
                      },
                      icon: const Icon(
                        Icons.send,
                        size: 27,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _buildMessage(BuildContext context, ChatMessage message) {
    bool isReceived = message.type == MessageType.received;
    return isReceived
        ? Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Theme.of(context).cardColor,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          message.message,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  height:
                                      message.message.length > 50 ? 1.8 : 1),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 2),
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Text(
                          intl.DateFormat('h:mm a').format(message.time),
                          style:
                              TextStyle(fontSize: 12, color: Colors.grey[500]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    CircleAvatar(
                      backgroundColor: myFavColor,
                      radius: 20,
                      child: Image.asset(
                        'assets/images/Bot_white.png',
                        width: 25,
                        height: 25,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.5),
                      child: CircleAvatar(
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        radius: 5.8,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: CircleAvatar(
                        backgroundColor: myFavColor11,
                        radius: 5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: myFavColor,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          message.message,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  color: Colors.white,
                                  height:
                                      message.message.length > 50 ? 1.8 : 1),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 2),
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Text(
                          intl.DateFormat('h:mm a').format(message.time),
                          style:
                              TextStyle(fontSize: 12, color: Colors.grey[500]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}
