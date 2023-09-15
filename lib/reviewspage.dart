import 'package:flutter/material.dart';



class ReviewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Reviews'),
      ),
      body: ListView.builder(
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          final review = reviews[index];
          return ReviewCard(review: review);
        },
      ),
    );
  }
}

class Review {
  final String profileName;
  final String reviewText;
  final int rating;
  int likes;
  int dislikes;

  Review({
    required this.profileName,
    required this.reviewText,
    required this.rating,
    this.likes = 0,
    this.dislikes = 0,
  });
}

final List<Review> reviews = [
  Review(
    profileName: 'sindhu',
    reviewText: 'This product is great!',
    rating: 5,
  ),
  Review(
    profileName: 'diya',
    reviewText: 'I don\'t like this product.',
    rating: 2,
  ),
Review(
profileName: 'araya',
reviewText: 'I don\'t like this product.',
rating: 2,
),
  Review(
    profileName: 'liya',
    reviewText: 'I don\'t like this product.',
    rating: 2,
  ),
  Review(
    profileName: 'anamika',
    reviewText: 'I don\'t like this product.',
    rating: 2,
  ),
  // Add more reviews here...
];

class ReviewCard extends StatefulWidget {
  final Review review;

  ReviewCard({required this.review});

  @override
  _ReviewCardState createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  bool liked = false;
  bool disliked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Profile: ${widget.review.profileName}'),
            Text('Rating: ${widget.review.rating} stars'),
            Text(widget.review.reviewText),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.thumb_up),
                      onPressed: () {
                        setState(() {
                          widget.review.likes++;
                          liked = true;
                        });
                      },
                      color: liked ? Colors.blue : Colors.grey,
                    ),
                    Text(widget.review.likes.toString()),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.thumb_down),
                      onPressed: () {
                        setState(() {
                          widget.review.dislikes++;
                          disliked = true;
                        });
                      },
                      color: disliked ? Colors.red : Colors.grey,
                    ),
                    Text(widget.review.dislikes.toString()),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
