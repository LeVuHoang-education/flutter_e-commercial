import 'package:e_commercial_app/presentation/widgets/layout/layout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/auth/auth_state_cubit.dart';
import '../bottom_navigation_bar.dart';
import 'layout_bloc.dart';
import 'layout_event.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer< LayoutBloc, LayoutState> (
        listener: (context,state){},
        builder: (context, state ) {
          return Scaffold(
            body: Center(child: bottomNavigationBarPages.elementAt(state.tabIndex),),
            bottomNavigationBar: BottomNavigationBar(
              items: List.generate(bottomNavigationBarItems.length, (index) {
                bool isSelected = state.tabIndex == index;
                Icon iconWidget = bottomNavigationBarItems[index].icon as Icon;
                return BottomNavigationBarItem(
                  icon: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.orange.shade100 : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: Transform.scale(
                      scale: isSelected ? 1.5 : 1.0,
                      child: Icon(
                        iconWidget.icon, // Lấy icon từ BottomNavigationBarItem
                        color: isSelected ? Colors.orange : Colors.grey,
                      ),
                    ),
                  ),
                  label: bottomNavigationBarItems[index].label,
                );
              }),
              currentIndex: state.tabIndex,
              selectedItemColor: Colors.orange,
              selectedFontSize: 16,
              unselectedFontSize: 14,
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              onTap: (index) {
                context.read<LayoutBloc>().add(LayoutEventChangeTab(tabIndex: index));
              },
            ),
          );
        },
    );
  }
}