import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pie_chart/pie_chart.dart';

class ExpenseLanding extends StatefulWidget {
  const ExpenseLanding({super.key});

  @override
  State<ExpenseLanding> createState() => _ExpenseLandingState();
}

class _ExpenseLandingState extends State<ExpenseLanding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: Container(
      //   width: MediaQuery.of(context).size.width,
      //   child: FloatingActionButton(
      //       onPressed: () {}, child: Image.asset("assets/images/bottom3.png")),
      // ),
      backgroundColor: Colors.redAccent,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                )),
            title: const Text("Expenses",
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Plus Jakarta Sans',
                    fontSize: 14,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.7142857142857142)),
            backgroundColor: Colors.redAccent,
            expandedHeight: 50,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: SafeArea(
                child: Stack(
                  children: <Widget>[
                    Container(
                        //alignment: Alignment.center,
                        width: double.infinity,
                        //color: Colors.yellow,
                        //width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          'assets/images/landing2.png',
                          fit: BoxFit.fitWidth,
                        )),
                    Container(
                        //alignment: Alignment.center,
                        width: double.infinity,
                        //color: Colors.yellow,
                        //width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          'assets/images/landing3.png',
                          fit: BoxFit.fitWidth,
                        )),

                    // Container(
                    //     //alignment: Alignment.center,
                    //     width: double.maxFinite,
                    //     child: Image.asset(
                    //       'assets/images/landing3.png',
                    //       fit: BoxFit.fitWidth,
                    //     )),

                    // Positioned(
                    //     //width: MediaQuery.of(context).size.width,
                    //     child: Container(
                    //   width: double.maxFinite,
                    //   child: Image.asset(
                    //     'assets/images/landing3.png',
                    //     fit: BoxFit.fitWidth,
                    //   ),
                    // ))
                  ],
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: _buildContents2(context),
          )
        ],
      ),
    );
  }
}

Map<String, double> dataMap = {
  "Submitted": 20,
  "Rejected": 20,
  "Approved": 30,
  "Draft": 10,
  "Closed": 10
};

_buildContents2(BuildContext context) {
  List<String> claimsList = [
    "Trip expenses-Dinner 18 Feb\nINR 4,500",
    "Team Outing With Design Team\nINR 20,000",
    "Figma Subscription\nINR 10,000",
    "Team Outing with Design Team\nINR 20,000"
  ];
  return SingleChildScrollView(
    child: Container(
      decoration: const BoxDecoration(
          color: Color(0xFFF6F6F7),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "     8 Expenses",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(Icons.search),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(Icons.filter_list)
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 42.0),
            child: Column(
              children: [
                Text("Summary Of Claims"),
                Container(
                  child: PieChart(
                    dataMap: dataMap,
                    chartRadius: 140,
                    chartValuesOptions:
                        ChartValuesOptions(showChartValues: false),
                    legendOptions: LegendOptions(
                        showLegendsInRow: true,
                        legendPosition: LegendPosition.bottom),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: claimsList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        margin: EdgeInsets.zero,
                        elevation: 0,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.14,
                          margin: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.030,
                              vertical:
                                  MediaQuery.of(context).size.height * 0.005),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    // color: Colors.green,
                                    borderRadius: BorderRadius.circular(100)
                                    //more than 50% of width makes circle
                                    ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.65,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        claimsList[index],
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                            color:
                                                Color.fromRGBO(17, 20, 52, 1),
                                            fontFamily: 'Plus Jakarta Sans',
                                            fontSize: 14,
                                            letterSpacing:
                                                0 /*percentages not used in flutter. defaulting to zero*/,
                                            fontWeight: FontWeight.normal,
                                            height: 1.7142857142857142),
                                      ),
                                      // FittedBox(
                                      //   child: Padding(
                                      //     padding: const EdgeInsets.all(8.0),
                                      //     child: Text(
                                      //       caselists[index].title,
                                      //       style: TextStyle(
                                      //           fontSize: 15,
                                      //           fontWeight: FontWeight.bold),
                                      //
                                      //       //style: Theme.of(context).textTheme,
                                      //     ),
                                      //   ),
                                      // ),
                                      // const Text(
                                      //   'SAP Success Factors, S4HANA',
                                      //   textAlign: TextAlign.left,
                                      //   style: TextStyle(
                                      //       color: Color.fromRGBO(
                                      //           125, 131, 139, 1),
                                      //       fontFamily: 'Plus Jakarta Sans',
                                      //       fontSize: 12,
                                      //       letterSpacing:
                                      //           0 /*percentages not used in flutter. defaulting to zero*/,
                                      //       fontWeight: FontWeight.normal,
                                      //       height: 1.3),
                                      // ),

                                      // Text(
                                      //   claimsList[index],
                                      //   textAlign: TextAlign.left,
                                      //   style: const TextStyle(
                                      //       color: Color.fromRGBO(
                                      //           242, 122, 108, 1),
                                      //       fontFamily: 'Plus Jakarta Sans',
                                      //       fontSize: 11,
                                      //       letterSpacing:
                                      //           0 /*percentages not used in flutter. defaulting to zero*/,
                                      //       fontWeight: FontWeight.normal,
                                      //       height: 1.4),
                                      // )
                                      // RichText(text: TextSpan(
                                      //   ch
                                      // ))
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                //crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                      padding: EdgeInsets.zero,
                                      icon: const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.grey,
                                        size: 10,
                                      ),
                                      color: Color(0xFFD9D9D9),
                                      onPressed: () {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //         route[index]
                                        //       // DetailedCustomercase(
                                        //       //     caselists[index])
                                        //     ));
                                      }),
                                ],
                              ),

                              // IconButton(
                              //     onPressed: () {
                              //       Navigator.push(
                              //           context,
                              //           MaterialPageRoute(
                              //               builder: (context) =>
                              //                   route[index]
                              //               // DetailedCustomercase(
                              //               //     caselists[index])
                              //               ));
                              //     },
                              //     icon: Icon(Icons.arrow_forward_ios))
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
