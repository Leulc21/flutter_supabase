import 'package:flutter/material.dart';

import '../utils/CustomColor.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool smartLampValue = true;
  bool smartTVValue = false;
  bool routerValue = false;
  bool climateValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const CustomIcons(icon: Icons.menu),
        actions: const [CustomIcons(icon: Icons.notifications)],
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [CustomColor.kBackground2, CustomColor.kBackground1])),
        child: SafeArea(
          child: ListView(
            children: [
              const SizedBox(height: 20),
              AccountInfoCard(addCallback: () {}),
              const SizedBox(height: 20),
              const WeatherInfoCard(),
              const SizedBox(height: 20),
              const CustomTabbar(),
              const SizedBox(height: 20),
              const HomePortionTabs(),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                      child: CustomSwitchCard(
                    icon: Icons.bubble_chart,
                    label: 'Smart Lamp',
                    switchValue: smartLampValue,
                    onChanged: (value) {
                      smartLampValue = value;
                      setState(() {});
                    },
                    onTap: () {},
                  )),
                  const SizedBox(width: 20),
                  Expanded(
                      child: CustomSwitchCard(
                    icon: Icons.tv,
                    label: 'Smart TV',
                    switchValue: smartTVValue,
                    onChanged: (value) {
                      smartTVValue = value;
                      setState(() {});
                    },
                    onTap: () {},
                  )),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                      child: CustomSwitchCard(
                    icon: Icons.alt_route_rounded,
                    label: 'Router',
                    switchValue: routerValue,
                    onChanged: (value) {
                      routerValue = value;
                      setState(() {});
                    },
                    onTap: () {},
                  )),
                  const SizedBox(width: 20),
                  Expanded(
                      child: CustomSwitchCard(
                    icon: Icons.snowing,
                    label: 'Climate',
                    switchValue: climateValue,
                    onChanged: (value) {
                      climateValue = value;
                      setState(() {});
                    },
                    onTap: () {},
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AccountInfoCard extends StatelessWidget {
  final VoidCallback addCallback;
  const AccountInfoCard({super.key, required this.addCallback});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          children: [
            Text(
              "Hi, Vitaliy",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Manage your home",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: addCallback,
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightGreenAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25))),
          child: const Row(
            children: [
              Icon(Icons.add, color: Colors.white),
              Text(
                "Add",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class CustomIcons extends StatelessWidget {
  final IconData icon;

  const CustomIcons({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: CustomColor.kBackground1)),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      child: Icon(icon, color: Colors.white),
    );
  }
}

class CustomTabbar extends StatelessWidget {
  const CustomTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Container(
          height: 75,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white.withOpacity(0.1)),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TabBar(
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.lightBlueAccent,
            ),
            labelColor: Colors.white,
            labelStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
            unselectedLabelColor: Colors.white,
            tabs: const [
              Tab(
                text: 'Energy',
              ),
              Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("13.5 kmph",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18)),
                    Text("Energy Usage of Light",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class HomePortionTabs extends StatelessWidget {
  const HomePortionTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
        length: 4,
        child: TabBar(
            indicatorColor: Colors.lightGreenAccent,
            indicatorSize: TabBarIndicatorSize.label,
            isScrollable: true,
            labelColor: Colors.white,
            labelStyle: TextStyle(color: Colors.white, fontSize: 14),
            unselectedLabelStyle: TextStyle(color: Colors.grey, fontSize: 12),
            tabs: [
              Tab(
                text: 'Living Room',
              ),
              Tab(
                text: 'Bedroom',
              ),
              Tab(
                text: 'Bathroom',
              ),
              Tab(
                text: 'Kitchen',
              )
            ]));
  }
}

class CustomSwitchCard extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool switchValue;
  final VoidCallback onTap;
  final void Function(bool)? onChanged;

  const CustomSwitchCard(
      {super.key,
      required this.icon,
      required this.label,
      required this.switchValue,
      required this.onTap,
      this.onChanged});

  @override
  State<CustomSwitchCard> createState() => _CustomSwitchCardState();
}

class _CustomSwitchCardState extends State<CustomSwitchCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _colorTween;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _colorTween =
        ColorTween(begin: CustomColor.kBackground2, end: CustomColor.kNavyBlue)
            .animate(_animationController);
    widget.switchValue
        ? _animationController.reverse()
        : _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _colorTween,
        builder: (context, child) {
          return GestureDetector(
            onTap: widget.onTap,
            child: Container(
              height: 150,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: _colorTween.value,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white)),
                    child: Icon(
                      widget.icon,
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  Center(
                    child: Text(widget.label,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.switchValue ? 'ON' : 'OFF',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400)),
                      Switch(
                          activeColor: Colors.lightGreenAccent,
                          inactiveThumbColor: Colors.grey,
                          inactiveTrackColor: Colors.grey,
                          value: widget.switchValue,
                          onChanged: (value) {
                            widget.onChanged!(value);
                            setState(() {});
                            if (widget.switchValue == true) {
                              _animationController.forward();
                            } else {
                              _animationController.reverse();
                            }
                          })
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}

class WeatherInfoCard extends StatelessWidget {
  const WeatherInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topLeft,
        children: [
          Container(
            height: 110,
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [CustomColor.kLightOrange, CustomColor.kOrange])),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Cloudy",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "27°",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  "27 January 2023",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          Positioned(
            right: 130,
            bottom: -35,
            child: Image.asset(
              'assets/cloudy.png',
              height: 250,
              width: 250,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
