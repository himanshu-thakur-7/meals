import "package:flutter/material.dart";

class BasicInfoCard extends StatelessWidget {
  final String title;
  final IconData icon;
  BasicInfoCard(this.title, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, color: Colors.amber[700], size: 34),
          SizedBox(height: 15),
          Text(title)
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.amber[100],
      ),
    );
  }
}
