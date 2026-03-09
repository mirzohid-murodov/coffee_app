import 'package:coffee_mobile/src/features/dashboard/main/screen/main_screen.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  int count = 1;
  int selectedVolume = 350; // ml
  bool isTakeaway = true;

  // Sizdagi ranglar palitrasi (Misol tariqasida)
  final Color primaryColor = const Color(0xFF324A59); // Rasmga mos to'q rang
  final Color greyColor = const Color(0xFFF7F8FA);
  final Color secondaryGrey = const Color(0xFFD1D5DB);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // 1. Scroll bo'ladigan AppBar
          SliverAppBar(
            expandedHeight: 60,
            floating: true,
            backgroundColor: Colors.white,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: const Text(
              "Order",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
            ],
          ),

          // 2. Sahifa mazmuni
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Coffee Image Card
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      color: greyColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.network(
                      'https://pngimg.com/uploads/cappuccino/cappuccino_PNG34.png', // Coffee image URL
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 25),

                  // Name and Counter
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Cappuccino",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      _buildCounter(),
                    ],
                  ),
                  const Divider(height: 40),

                  // Ristretto options
                  _buildSectionTitle("Ristretto"),
                  Row(
                    children: [
                      _buildSelectableChip("One", true),
                      const SizedBox(width: 10),
                      _buildSelectableChip("Two", false),
                    ],
                  ),
                  const SizedBox(height: 25),

                  // Onsite / Takeaway
                  _buildSectionTitle("Onsite / Takeaway"),
                  Row(
                    children: [
                      Icon(
                        Icons.coffee,
                        color: !isTakeaway ? primaryColor : secondaryGrey,
                      ),
                      const SizedBox(width: 20),
                      Icon(
                        Icons.local_cafe,
                        color: isTakeaway ? primaryColor : secondaryGrey,
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),

                  // Volume
                  _buildSectionTitle("Volume, ml"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      250,
                      350,
                      450,
                    ].map((v) => _buildVolumeIcon(v)).toList(),
                  ),
                  const SizedBox(height: 30),

                  // Total Amount and Next Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total Amount",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "BYN 3.00",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Next Button
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Next",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: navbarHeight,
                  ), // Pastki navigatsiya bar uchun joy
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildCounter() {
    return Container(
      decoration: BoxDecoration(
        color: greyColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.remove, size: 18),
          ),
          const Text("1", style: TextStyle(fontWeight: FontWeight.bold)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.add, size: 18)),
        ],
      ),
    );
  }

  Widget _buildSelectableChip(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: isSelected ? primaryColor : secondaryGrey),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label),
    );
  }

  Widget _buildVolumeIcon(int volume) {
    bool isSelected = selectedVolume == volume;
    return Column(
      children: [
        Icon(
          Icons.local_drink,
          size: volume / 10,
          color: isSelected ? Colors.black : secondaryGrey,
        ),
        Text(
          "$volume",
          style: TextStyle(color: isSelected ? Colors.black : secondaryGrey),
        ),
      ],
    );
  }
}
