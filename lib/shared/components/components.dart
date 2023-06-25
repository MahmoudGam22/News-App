import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

Widget buildarticleitem(article, context) => InkWell(
  onTap: (){},
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage('${article['urlToImage']}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
Widget articlebuilder(list, context,{isserach=false}) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildarticleitem(list[index], context),
        separatorBuilder: (context, index) => mydivider(),
        itemCount: 10,
        shrinkWrap: true,
      ),
      fallback: (context) =>isserach? Container() : Center(child: CircularProgressIndicator()),
    );

void navigateto(context, Widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Widget,
      ),
    );

Widget defaultff({
  required TextEditingController controller,
  required TextInputType kType,
  void Function(String)? onsubmit,
  void Function(String)? onChanged,
  required String? Function(String?)? validate,
  required String label,
  required Icon prefix,
  IconData? suffix,
  bool ispassword = false,
  void Function()? suffixpressed,
  void Function()? tap,
  bool isclickable = true,
}) =>
    TextFormField(
      obscureText: ispassword,
      validator: validate,
      controller: controller,
      keyboardType: kType,
      onChanged: onChanged,
      onFieldSubmitted: onsubmit,
      onTap: tap,
      enabled: isclickable,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        prefixIcon: prefix,
        suffixIcon: suffix != null
            ? IconButton(onPressed: suffixpressed, icon: Icon(suffix))
            : null,
      ),
    );
Widget mydivider() => Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey[300],
      ),
    );
