// Expanded(
//           child: FutureBuilder<List<AzkarModel>>(
//             future: AzkarModel.loadAzkar("أذكار الصباح"),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(
//                   child: CircularProgressIndicator(
//                     color: AppTheme.primary,
//                   ),
//                 );
//               } else if (snapshot.hasError) {
//                 return Column(
//                   children: [
//                     Text(
//                       'Error: ${snapshot.error}',
//                       style: const TextStyle(
//                         color: AppTheme.white,
//                         fontFamily: "jannalt",
//                         fontSize: 16,
//                         fontWeight: FontWeight.w700,
//                       ),
//                       textDirection: ui.TextDirection.ltr,
//                     ),
//                     const Text(
//                       'Something went wrong',
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         AzkarModel.loadAzkar("أذكار الصباح");
//                         log('Error loading Azkar: ${snapshot.error}');
//                       },
//                       child: const Text('Retry'),
//                     )
//                   ],
//                 );
//               }
//               List<AzkarModel> azkarList = snapshot.data!;
//               return Padding(
//                 padding: EdgeInsets.only(left: 20.w, bottom: 10.h),
//                 child: ListView.separated(
//                   separatorBuilder: (context, index) => SizedBox(width: 20.w),
//                   scrollDirection: Axis.horizontal,
//                   itemCount: azkarList.length,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       width: 185.w,
//                       height: 259.h,
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 10.w,
//                       ),
//                       decoration: ShapeDecoration(
//                         color: AppTheme.black,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20.r),
//                           side: const BorderSide(
//                             color: AppTheme.primary,
//                           ),
//                         ),
//                       ),
//                       child: AutoSizeText(
//                         azkarList[index].content,
//                         style: TextStyle(
//                           color: AppTheme.primary,
//                           fontFamily: "jannalt",
//                           fontSize: 16.sp,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               );
//             },
//           ),
//         )
