import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int ti = 0, deduct = 0, y1 = 0, y = 0;
  String sch = "";
  double old = 0, neww = 0;
  TextEditingController gross;
  TextEditingController fully;
  TextEditingController partially;
  initState() {
    gross = new TextEditingController();
    fully = new TextEditingController();
    partially = new TextEditingController();
    super.initState();
  }

  void fullDeduct(int x) {
    y = y + x;
    setState(() {
      y = y;
      fully.text = "";
    });
  }

  void partiallyDeduct(x) {
    y1 = y1 + x;
    if (y1 >= 150000) {
      y1 = 150000;
    }
    setState(() {
      y1 = y1;
      partially.text = "";
    });
  }

  void calculate(gr) {
    setState(() {
      deduct = y + y1;
      ti = gr - deduct;
    });
    if (ti <= 250000) {
      old = 0;
    }
    if (ti > 250000 && ti <= 500000) {
      old = (ti - 250000) * 0.05;
    }
    if (ti > 500000 && ti <= 1000000) {
      old = ((ti - 500000) * 0.2) + 12500;
    }
    if (ti > 1000000) {
      old = ((ti - 1000000) * 0.3) + 112500;
    }
    if (gr <= 250000) {
      neww = 0;
    }
    if (gr > 250000 && gr <= 500000) {
      neww = (gr - 250000) * 0.05;
    }
    if (gr > 500000 && gr <= 750000) {
      neww = ((gr - 500000) * 0.1) + 12500;
    }
    if (gr > 750000 && gr <= 1000000) {
      neww = ((gr - 750000) * 0.15) + 37500;
    }
    if (gr > 1000000 && gr <= 1250000) {
      neww = ((gr - 1000000) * 0.2) + 75000;
    }
    if (gr > 1250000 && gr <= 1500000) {
      neww = ((gr - 1250000) * 0.25) + 125000;
    }
    if (gr > 1500000) {
      neww = ((gr - 1500000) * 0.3) + 187500;
    }
    old = 1.04 * old;
    neww = 1.04 * neww;
    (old > neww) ? sch = "New" : sch = "Old";
    if (old == neww) {
      sch = "Any one";
    }
  }

  void reset() {
    setState(() {
      ti = 0;
      deduct = 0;
      y1 = 0;
      y = 0;
      sch = "";
      old = 0;
      neww = 0;
      gross.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tax Scheme Desider"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Gross Income : ',
                  style: TextStyle(fontSize: 20),
                ),
                Flexible(
                  child: TextField(
                    controller: gross,
                    keyboardType: TextInputType.number,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Deduction",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            new Divider(
              color: Colors.black,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                    width: 120,
                    child: Text(
                      "100% Deduct :",
                      style: TextStyle(fontSize: 20),
                    )),
                SizedBox(
                    width: 100,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: fully,
                    )),
                SizedBox(
                    width: 60,
                    child: FlatButton(
                        onPressed: () => fullDeduct(int.parse(fully.text)),
                        child: Text("Add"))),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                    width: 120,
                    child: Text(
                      "Deduction under 80c :",
                      style: TextStyle(fontSize: 20),
                    )),
                SizedBox(
                    width: 100,
                    child: TextField(
                      controller: partially,
                      keyboardType: TextInputType.number,
                    )),
                SizedBox(
                    width: 60,
                    child: FlatButton(
                        onPressed: () =>
                            partiallyDeduct(int.parse(partially.text)),
                        child: Text("Add"))),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () => calculate(int.parse(gross.text)),
              child: Text("Calculate"),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Total deducion : $deduct",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Taxable income : $ti",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Old Regime : $old",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "New Regime : $neww",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Best regime is : $sch",
              style: TextStyle(fontSize: 25,color: Colors.red),
              
            ),
            RaisedButton(
              onPressed: () => reset(),
              child: Text("Reset"),
            )
          ],
        ),
      ),
    );
  }
}
