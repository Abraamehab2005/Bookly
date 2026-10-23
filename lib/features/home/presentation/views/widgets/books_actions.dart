import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../data/models/book_model/book_model.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key , required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              text: '19.99 €', backgroundColor: Colors.white, textColor: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () async{
                final Uri uri = Uri.parse(bookModel.volumeInfo.previewLink!);
                if (await canLaunchUrl(uri)) {
                 await launchUrl(uri);
                }
              },
              text: getText(bookModel) , backgroundColor: Color(0xFFEF8262), textColor: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  String getText (BookModel bookModel){
    if(!(bookModel.volumeInfo.previewLink == null)){
      return 'Free preview';
    }else{
      return 'Preview';
    }
  }
}