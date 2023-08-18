import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:textfield_search/textfield_search.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  // Search controller
  TextEditingController myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: TextFieldSearch(
             label: 'chat search',
             initialList: ['Ama'],
             controller: myController,
            decoration: const InputDecoration(
              filled: true,
               border: OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderRadius: BorderRadius.all(Radius.circular(90.0)),
                  borderSide: BorderSide.none,
                ),

              fillColor: Color.fromARGB(255, 244, 244, 244),
              hintText: 'Search',
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
          ),
        ),
        SizedBox(width: 20,),
        InkWell(
          onTap: (){},
          borderRadius: BorderRadius.circular(50),
          child: 
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.black,
            ),
            child: 
               SvgPicture.asset('assets/svg/search.svg',
               color: Colors.white,
               )
               ),
        )
      ],
    );
  }
}