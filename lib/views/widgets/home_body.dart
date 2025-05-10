import 'package:flutter/material.dart';
import 'package:gifts_app/models/gift_model.dart';
import 'package:gifts_app/views/functions/showSnackBarFunction.dart';
import 'package:gifts_app/views/widgets/addToCart.dart';
import 'package:gifts_app/views/widgets/custom_textFormField.dart';
import 'package:gifts_app/views/screens/ProductDetails.dart';

class HomeBody extends StatefulWidget {


  const HomeBody({super.key});


  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final TextEditingController _specialGiftController = TextEditingController();
  String? message;
  GlobalKey<FormState> formKey = GlobalKey();

  String selectedCategory = 'All';

  List<String> categories = ['All', 'Electronics', 'Cakes', 'Flowers','Special Gift'];

  

  @override
  Widget build(BuildContext context) {
    return Padding(
  padding: const EdgeInsets.all(12.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Latest Gifts',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 10),
      SizedBox(
        height: 160,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: latestGifts.length,
          itemBuilder: (context, index) {
            final gift = latestGifts[index];
            return GestureDetector(
              onTap: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetails(model: gift),
                  ),
                );
              },
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.only(right: 8),
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                              child: Image.network(
                                gift.imageUrl,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.broken_image, size: 80);
                                },
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(6),
                            alignment: Alignment.center,
                            child: Text(
                              gift.name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    AddToCart(gift: gift),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      const SizedBox(height: 20),
      const Text(
        'Categories',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 10),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: categories.map((category) {
            final isSelected = selectedCategory == category;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: ChoiceChip(
                label: Text(category),
                selected: isSelected,
                selectedColor: const Color(0xff944BBB),
                backgroundColor: Colors.grey.shade200,
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                ),
                onSelected: (_) {
                  setState(() {
                    selectedCategory = category;
                  });
                },
              ),
            );
          }).toList(),
        ),
      ),
      const SizedBox(height: 10),
      Expanded(
        child: selectedCategory == 'Special Gift'
            ? Form(
          key: formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Describe your special gift:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  controller: _specialGiftController,
                  onChanged: (data) {
                    message = data;
                  },
                  labelText: "Write ...",
                  hintText: "Write your gift idea here...",
                  color: Colors.black,
                  maxLines: 4,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff944BBB),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                  ),
                  onPressed: () {
                    final text = _specialGiftController.text.trim();
                    if (formKey.currentState!.validate()) {
                      if (text.isNotEmpty) {
                        showSnackBar_Function(context,
                            text: 'Request sent to the store!');
                        _specialGiftController.clear();
                      } else {
                        showSnackBar_Function(context, text: 'Message is empty !');
                      }
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        'Send to Store',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.send, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
            : GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.75,
          ),
          itemCount: gifts
              .where((gift) =>
          selectedCategory == 'All' || gift.category == selectedCategory)
              .length,
          itemBuilder: (context, index) {
            final filteredGifts = gifts
                .where((gift) =>
            selectedCategory == 'All' || gift.category == selectedCategory)
                .toList();
            final gift = filteredGifts[index];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetails(model: gift),
                  ),
                );
              },
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(10)),
                            child: Image.network(
                              gift.imageUrl,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons.broken_image, size: 80);
                              },
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(6),
                          alignment: Alignment.center,
                          child: Text(
                            gift.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    AddToCart(gift: gift),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ],
  ),
);
  }
}