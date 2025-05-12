import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gifts_app/views/screens/message_order_tracking.dart';

class OrderTracking extends StatelessWidget {
  const OrderTracking({super.key});

  Widget _buildTimelineItem({
    required String status,
    required String date,
    required String description,
    required bool isCompleted,
    bool islast = false  ,
    bool isFirst = false,
}){
    return IntrinsicHeight(
      child: Row(
        children: [
          SizedBox(
            width: 60,
            child: Column(
              children: [
                if(!isFirst)
                Container(
                  width: 2, height: 30,
                  color: isCompleted ?  Color(0xff763498) : Colors.grey,
                ),
                Container(
                  width: 24, height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCompleted ? Color(0xff763498) : Colors.white ,
                    border: Border.all(
                      width: 2,
                      color: isCompleted ? Color(0xff763498) : Colors.grey ,
                    ),
                  ),
                  child: isCompleted ? Icon(Icons.check, size: 16, color: Colors.blueGrey,) : null,
                ),
                if(!islast)
                  Container(
                    width: 2, height: 50,
                    color: isCompleted ?  Color(0xff763498) : Colors.grey,
                  ),
              ],
            ),
          ),
          Expanded(child: Container(
            margin: EdgeInsets.only(left :8 , bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(status , style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold ,
                    color: isCompleted ?  Color(0xff763498) : Colors.black, ),),
                SizedBox(height: 4,),
                Text(date , style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold ,
                  color: Colors.grey, ),),
                SizedBox(height: 4,),
                Text(description , style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold ,
                  color: Colors.black, ),),
              ],
            ),
          ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff763498),
        centerTitle: true,
        title: Text('Tracking Order', style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold,
        ),),
      ),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10 ,
                        offset: Offset(0, 5),
                      )
                    ]
                  ),
                  child: Column(
                    children: [
                      Text("Estimated Delivery" , style: TextStyle(
                        fontSize: 14, color: Colors.grey
                      ),),
                      SizedBox(height: 8,),
                      Text("May 25 , 2025" , style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black
                      ),),
                      SizedBox(height: 4,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text("In Transit" , style:
                        TextStyle(color :Colors.orange , fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(height: 19,),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10 ,
                                offset: Offset(0, 5),
                              ), ]
                        ),
                        child: Column(
                          children: [
                            _buildTimelineItem(
                                status: "Order Placed",
                                date: "May 25 , 2025 - 10:30 AM",
                                description: "Your Order has been confirmed and is being processed",
                                isCompleted: true, isFirst: true ),
                            _buildTimelineItem(
                                status: "Order Processed",
                                date: "May 21 , 2025 - 10:30 AM",
                                description: "Your Order has been prepared for shipping",
                                isCompleted: true, ),
                            _buildTimelineItem(
                                status: "In Transit",
                                date: "May 22 , 2025 - 10:30 AM",
                                description: "Your Order is on its way to you",
                                isCompleted: true),
                            _buildTimelineItem(
                                status: "Out for Delivery",
                                date: "Excepted May 23 , 2025",
                                description: "Your Order will be delivered today",
                                isCompleted: false),
                            _buildTimelineItem(
                                status: "Delivered",
                                date: "Excepted May 23 , 2025",
                                description: "Your Order has been delivered",
                                isCompleted: false , islast: true),
                          ],
                        ),
                      ),
                      SizedBox(height: 16,),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10 ,
                                offset: Offset(0, 5),
                              ), ]
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Delivery Details", style:
                               TextStyle(fontSize: 18, fontWeight: FontWeight.bold , color: Colors.black),),
                            SizedBox(height: 16,),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Color(0xff763498).withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12)
                                  ),
                                  child: Icon(Icons.local_shipping_outlined, color: Color(0xff763498),),
                                ),
                                SizedBox(width: 16,),
                                Expanded(child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Tracking Number", style: TextStyle(fontSize: 14, color: Colors.grey),),
                                    SizedBox(height: 5,),
                                    Text("TRK123456789", style: TextStyle(fontSize: 14,
                                        fontWeight: FontWeight.bold ,color: Colors.black),),
                                  ],
                                ),),
                                IconButton(onPressed: (){}, icon: Icon(Icons.copy , color: Color(0xff763498),))
                              ],
                            ),
                            Divider(),
                            SizedBox(height: 16,),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      color: Color(0xff763498).withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                  child: Icon(Icons.location_on_outlined, color: Color(0xff763498),),
                                ),
                                SizedBox(width: 16,),
                                Expanded(child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Delivery Address", style: TextStyle(fontSize: 14, color: Colors.grey),),
                                    SizedBox(height: 5,),
                                    Text("123 Maim Street \n New York", style: TextStyle(fontSize: 15,
                                        fontWeight: FontWeight.w500 ,color: Colors.black),),
                                  ],
                                ),),
                                IconButton(onPressed: (){}, icon: Icon(Icons.copy , color: Color(0xff763498),))
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 50,),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child:
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MessageOrderTracking(),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff763498),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Center(
                        child: Text(
                          'Next',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),



    );
  }
}
