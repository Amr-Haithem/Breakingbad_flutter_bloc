import 'package:bloc_breaking_bad/constants/my_colors.dart';
import 'package:bloc_breaking_bad/constants/strings.dart';
import 'package:bloc_breaking_bad/data/Model/characters.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final Character character;
  const CharacterItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
        padding: EdgeInsetsDirectional.all(4),
        decoration: BoxDecoration(
          color: MyColors.myWhite,
        ),
        child: InkWell(
          onTap: ()=>Navigator.pushNamed(context,characterDetailScreenRoute,arguments: character ),
          child: GridTile(
              child: Hero(
                tag: character.charId,
                child: Container(
                          color: MyColors.myGrey,
                          child: character.image.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      placeholder: 'assets/images/waiting.gif',
                      image: character.image)
                  : Image.asset('assets/images/placeholder.png'),
                        ),
              ),footer: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text("${character.name}",style: TextStyle(
              height: 1.3,
              fontSize: 16,
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
            ),
            
          )
          ,),
        ));
  }
}
