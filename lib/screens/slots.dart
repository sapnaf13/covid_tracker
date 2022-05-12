import 'package:flutter/material.dart';

class Slot extends StatefulWidget {
  final List slots;

  const Slot({Key key, this.slots}) : super(key: key);
  @override
  _SlotState createState() => _SlotState();
}

class _SlotState extends State<Slot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.redAccent[700],
            size: 28,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0),
                ),
                color: Colors.redAccent[700].withOpacity(0.2),
              ),
              width: MediaQuery.of(context).size.width,
              child: LayoutBuilder(
                builder: (ctx, constraint) => Stack(
                  children: <Widget>[
                    //Title
                    Positioned(
                      top: constraint.maxHeight * 0.45,
                      left: 20,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: constraint.maxWidth * 0.7,
                          child: Text(
                            "Available Slots",
                            style: TextStyle(
                              color: Colors.redAccent[700],
                              fontFamily: "Montserrat",
                              fontSize: 31,
                              fontWeight: FontWeight.w700,
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: widget.slots.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.redAccent[700].withOpacity(0.2),
                    ),
                    // height: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Center ID - ' +
                              widget.slots[index]['center_id'].toString(),
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 16,
                              color: Colors.white60),
                        ),
                        Text(
                          'Center Name - ' +
                              widget.slots[index]['name'].toString(),
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Montserrat",
                            color: Colors.white60,
                          ),
                        ),
                        Text(
                          'Center Address - ' +
                              widget.slots[index]['address'].toString(),
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Montserrat",
                              color: Colors.white60),
                        ),
                        Divider(),
                        Text(
                          'Vaccine Name - ' +
                              widget.slots[index]['vaccine'].toString(),
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Montserrat",
                              color: Colors.white60),
                        ),
                        Divider(),
                        Text(
                          'Slots - ' + widget.slots[index]['slots'].toString(),
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Montserrat",
                              color: Colors.white60),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
