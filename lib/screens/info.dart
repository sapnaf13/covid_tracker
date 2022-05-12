import 'package:flutter/material.dart';

class Info extends StatelessWidget {
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
              color: Colors.lightBlue[700],
              size: 28,
            )),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        //Colors.lightBlue[700].withOpacity(0.1),
        elevation: 0,
      ),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
            ),
            child: Container(
              height: 220,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0),
                  ),
                  color: Colors.lightBlue[700].withOpacity(0.2)),
              width: MediaQuery.of(context).size.width,
              child: LayoutBuilder(
                builder: (ctx, constraint) => Stack(
                  children: <Widget>[
                    //Name
                    Positioned(
                      top: constraint.maxHeight * 0.4,
                      left: 20,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: constraint.maxWidth * 0.55,
                          child: Text(
                            "ABOUT US",
                            style: TextStyle(
                              color: Colors.black54,
                              fontFamily: "Montserrat",
                              fontSize: 31,
                              fontWeight: FontWeight.w700,
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ),

                    //Image
                    Positioned.fill(
                      right: -20,
                      bottom: -18,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: LayoutBuilder(
                          builder: (ctx, constraint) => Hero(
                            tag: 'assets/teamwork.png',
                            child: Image(
                              image: AssetImage('assets/profile/teamwork.png'),
                              height: constraint.maxHeight * 0.70,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(left: 50, right: 50, top: 100),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.lightBlue[700].withOpacity(0.2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Tile(
                  img: 'assets/profile/sapna.jpeg',
                  name: 'Sapna Fulwani',
                ),
                Tile(
                  img: 'assets/profile/shilpii.jpg',
                  name: 'Shilpi Kumari',
                ),
                Tile(
                  img: 'assets/profile/shubhalli.jpg',
                  name: 'Shubhali Kashyap',
                ),
                Tile(
                  img: 'assets/profile/shruti.jpg',
                  name: 'S Sai Sruthi',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Tile extends StatelessWidget {
  const Tile({Key key, @required this.img, @required this.name})
      : super(key: key);
  final String img, name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(img),
        ),
        title: Text(
          name,
          style: TextStyle(
            fontFamily: "Montserrat",
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}
