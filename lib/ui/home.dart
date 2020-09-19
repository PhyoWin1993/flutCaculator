import 'package:flutter/material.dart';

class Caculator extends StatefulWidget {
  @override
  _CaculatorState createState() => _CaculatorState();
}

class _CaculatorState extends State<Caculator> {
  int _countPerson = 1;
  int _tipPercent = 0;
  double _billAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.5),

          /// Two  field
          children: [
            // Top Container
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(14.0),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Each Person get"),
                    Text(
                      "\$${caculateTotalPerson(caculateTotalTip(_billAmount, _countPerson, _tipPercent), _billAmount, _countPerson)}",
                      style: TextStyle(
                        fontSize: 22.9,
                        color: Colors.lightBlueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
            // End top container

            /// Second Conatiner
            Container(
              padding: EdgeInsets.all(12.0),
              margin: EdgeInsets.only(top: 20.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                    color: Colors.blueGrey.shade300, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color: Colors.purple.shade600),
                    decoration: InputDecoration(
                      prefixText: "Bill Amount ",
                      prefixIcon: Icon(Icons.attach_money),
                    ),
                    onChanged: (String value) {
                      try {
                        _billAmount = double.parse(value);
                      } catch (e) {
                        _billAmount = 0.0;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Split",
                        style: TextStyle(color: Colors.deepPurple.shade700),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (_countPerson > 1) {
                                  _countPerson--;
                                }
                              });
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0),
                                color: Colors.grey.shade300,
                              ),
                              child: Text(
                                "-",
                                style: TextStyle(
                                  color: Colors.deepPurple.shade700,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "$_countPerson",
                            style: TextStyle(
                              fontSize: 22.9,
                              color: Colors.lightBlueAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          //newt plus

                          InkWell(
                            onTap: () {
                              setState(() {
                                if (_countPerson > 0) {
                                  _countPerson++;
                                }
                              });
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0),
                                color: Colors.grey.shade300,
                              ),
                              child: Text(
                                "+",
                                style: TextStyle(
                                  color: Colors.deepPurple.shade700,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),

                  // third row under Colunm
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tip"),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          "\$ ${caculateTotalTip(_billAmount, _countPerson, _tipPercent)}",
                          style: TextStyle(
                            fontSize: 22.9,
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Forth Row
                  Column(
                    children: [
                      Text(
                        "$_tipPercent  %",
                        style: TextStyle(
                            color: Colors.purple,
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Slider(
                          min: 0,
                          max: 100,
                          value: _tipPercent.toDouble(),
                          onChanged: (double nvalue) {
                            setState(() {
                              _tipPercent = nvalue.round();
                            });
                          })
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  caculateTotalPerson(double totalTip, double billamoutn, int splitBy) {
    var totalPerson = (totalTip + billamoutn) / splitBy;
    return totalPerson.round();
  }

  caculateTotalTip(double billAmount, int splitBy, int tipPercent) {
    double totalTip = 0.0;
    if (billAmount < 0 || billAmount.toString().isEmpty || billAmount == null) {
      totalTip = 0.0;
    } else {
      totalTip = (billAmount * tipPercent) / 100;
    }
    return totalTip;
  }
}
