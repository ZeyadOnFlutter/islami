import 'package:flutter/material.dart';
import 'package:islami/model/app_theme.dart';
import 'package:islami/widgets/functions.dart';

class SuraDetailsScreen extends StatelessWidget {
  const SuraDetailsScreen({super.key});
  static const routeName = '/sura';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.black,
      appBar: AppBar(
        backgroundColor: AppTheme.black,
        leading: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getMediaQueryWidth(0.07441860465116279, context)),
          child: Icon(
            Icons.arrow_back,
            color: AppTheme.primary,
          ),
        ),
        leadingWidth: 0,
        title: Text(
          'Al-Fatiha',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 20,
                color: AppTheme.primary,
                fontFamily: 'jannalt',
                fontWeight: FontWeight.w700,
              ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: [],
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Text('');
              },
            ),
          ),
        ],
      ),
    );
  }
}
