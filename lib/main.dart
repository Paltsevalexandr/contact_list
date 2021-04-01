import 'package:flutter/material.dart';
/*list: {
        {'name': 'Aleksandr', 'company': 'Hoolie Inc.', 'isFavourite': false, 'image': 'face1.jpg'},
    {'name': 'John', 'company': 'US Berkeley', 'isFavourite': false, 'image': 'face2.jpg'},
    {'name': 'Megan', 'company': 'Husky Energy', 'isFavourite': false, 'image': 'face.jpg'}
      }*/
void main() {
  runApp(MaterialApp(
        title: 'Contact list',
        home: Scaffold(
          body: ContactList(),
        )
    ));
}

class ContactList extends StatefulWidget {
  @override
  _ListState createState() => _ListState();
}

class _ListState extends State<ContactList> {
  List<Map> list = [
    {'name': 'Joshua Alison', 'company': 'Hoolie Inc.', 'isFavourite': true, 'image': 'face1.jpg'},
    {'name': 'John Agnew', 'company': 'Stanford University', 'isFavourite': true, 'image': 'face1.jpg'},
    {'name': 'Sam Barnard', 'company': 'US Berkeley', 'isFavourite': true, 'image': 'face1.jpg'},
    {'name': 'Aleksandr Paltsev', 'company': 'Hoolie Inc.', 'isFavourite': true, 'image': 'face1.jpg'},
    {'name': 'Joel Cahnon', 'company': 'US Berkeley', 'isFavourite': false, 'image': 'face2.jpg'},
    {'name': 'Kyle Dickenson', 'company': 'Pied Piper', 'isFavourite': true, 'image': 'face1.jpg'},
    {'name': 'Lauren Davis', 'company': 'US Berkeley', 'isFavourite': true, 'image': 'face1.jpg'},
    {'name': 'Megan Blakely', 'company': 'Husky Energy', 'isFavourite': false, 'image': 'face4.jpg'}
  ];

  Function addToFavourites(String name, String company) {
    return (
      () {
        setState(() {
          list = [
            for(Map item in list) if(item['name'] == name && item['company'] == company) {...item, 'isFavourite': !item['isFavourite']} else item
          ];
          /*list = list
                .map((item) => item['name'] == name ? {...item, 'isFavourite': true} : item)
                .toList();*/
        });
      }
    );
  }
  List sortContacts() {
    List sortedList = list;
    sortedList.sort((a, b) => a > b ? 1 : 0);
    return sortedList;
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(left: 30),
          child: Column(
            children: list.map((contact) {
              return SingleContact(contact, addToFavourites(contact['name'], contact['company']));
            }).toList()
          )
        )
      ],
    );
  }
}

class SingleContact extends StatelessWidget {
  final contact;
  final addToFavourites;

  SingleContact(this.contact, this.addToFavourites);

  Widget build(BuildContext context) {
    var image = contact['image'];
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: 500,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 20, 
            height: 20,
            child: GestureDetector(
              child: contact['isFavourite']
                  ? Image.asset('assets/images/star.png', width: 20, height: 20)
                  : null,
              onTap: addToFavourites),
            margin: EdgeInsets.only(right: 20)
          ),
          Container(
            width: 40, height: 40,
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/$image'),
              radius: 50,
            )
          ),
          Container(
            child: Column(
              children:[
                Text(
                  contact['name'], 
                  textAlign: TextAlign.center, 
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black)),
                Text(
                  contact['company'], 
                  textAlign: TextAlign.center, 
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black))
              ],
            ),
            margin: EdgeInsets.only(right: 20)),
        ],
      ),
    );
  }
}

