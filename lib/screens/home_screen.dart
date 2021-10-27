import 'package:flutter/material.dart';
import 'package:socialmedia/config/palette_config.dart';
import 'package:socialmedia/data/data.dart';
import '../widgets/responsive.dart';
import '../widgets/circle_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../widgets/contacts_list.dart';
import '../widgets/create_post_container.dart';
import '../widgets/more_option_list.dart';
import '../widgets/post_container.dart';
import '../widgets/rooms_ui.dart';
import '../widgets/stories_ui.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackingScrollController _trackingScrollController = TrackingScrollController();
  @override
  void dispose() {
    // TODO: implement dispose
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          body:
          Responsive(
              desktop: _homeDesktop(_trackingScrollController),
              mobile: _homeScreen(_trackingScrollController),
              tablet: _homeScreen(_trackingScrollController))

      ),
    );
  }

  Widget _homeScreen(TrackingScrollController trackingScrollController) {
    return CustomScrollView(controller: trackingScrollController,
      slivers: [
         SliverAppBar(
          floating: true,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          centerTitle: false,
          title:     const Text(
            'Facebook mibolelel',
            style:   TextStyle(
              letterSpacing: -1.2,
              fontSize: 28,
              color: Palette.facebookBlue,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            CircleButton(
              iconSize: 30.0,
              iconData: MdiIcons.facebookMessenger,
              onPressed: () {
                print('facebookMessenger');
              },
            ),
            CircleButton(
              iconSize: 30.0,
              iconData: Icons.search,
              onPressed: () {
                print('search');
              },
            )
          ],
        ),
        const SliverToBoxAdapter(
            child: CreatePostContainer(
          currentUser: currentUser,
        )),
        SliverPadding(
          sliver: SliverToBoxAdapter(child: RoomUi(users: onlineUsers)),
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
        ),
        SliverPadding(
          sliver: SliverToBoxAdapter(
              child: StoryUi(
            stories: stories,
            currentUser: currentUser,
          )),
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return PostContainer(post: posts[index]);
        }, childCount: posts.length))
      ],
    );
  }

  Widget _homeDesktop(TrackingScrollController trackingScrollController) {
    return Row(
      children: [
        const Flexible(flex: 2,
          child: Padding(padding: EdgeInsets.all(12.0),child: MoreOptionsList(currentUser: currentUser,))
        ),
       const Spacer(),
        SizedBox(width: 600.0,
         child: CustomScrollView(
            slivers: [
              SliverPadding(
                sliver: SliverToBoxAdapter(
                    child: StoryUi(
                      stories: stories,
                      currentUser: currentUser,
                    )),
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              ),
              const SliverToBoxAdapter(
                  child: CreatePostContainer(
                    currentUser: currentUser,
                  )),
              SliverPadding(
                sliver: SliverToBoxAdapter(child: RoomUi(users: onlineUsers)),
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              ),

              SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return PostContainer(post: posts[index]);
                  }, childCount: posts.length))
            ],
          ),
        ),  const Spacer(),
        Flexible(flex: 2,
          child:Align(alignment: Alignment.centerRight,child: ContactsList(users: onlineUsers,)),

        ),
      ],
    );
  }
}
