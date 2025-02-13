import 'package:flutter/material.dart';

class SocialDashboard extends StatefulWidget {
  const SocialDashboard({super.key});

  @override
  State<SocialDashboard> createState() => _SocialDashboardState();
}

class _SocialDashboardState extends State<SocialDashboard> {
  int count = 0; // عداد الإعجابات

  // قائمة صور الحسابات الشخصية
  final List<String> profileImages = List.generate(
    6,
        (index) => 'https://cdn-icons-png.flaticon.com/128/10050/10050042.png',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Center(
          child: Text(
            'Social Dashboard',
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // عنوان القسم الأول
            _buildSectionTitle('Profiles'),

            // شبكة الصور الشخصية
            _buildProfileGrid(),

            const SizedBox(height: 50),

            // عنوان المنشور المميز
            _buildSectionTitle('Featured Post'),

            // صورة المنشور مع العنوان
            _buildFeaturedPost(),

            // قسم الإعجابات
            _buildLikeSection(),
          ],
        ),
      ),
    );
  }

  // **ودجت لإنشاء عنوان القسم**
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  // **ودجت لإنشاء شبكة الصور الشخصية**
  Widget _buildProfileGrid() {
    return Wrap(
      spacing: 20, // المسافة بين الصور
      runSpacing: 20, // المسافة بين الصفوف
      alignment: WrapAlignment.center,
      children: profileImages.map((image) => _buildProfileAvatar(image)).toList(),
    );
  }

  // **ودجت لإنشاء صورة حساب شخصي**
  Widget _buildProfileAvatar(String imageUrl) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(imageUrl),
        ),
        const CircleAvatar(
          radius: 12.0,
          backgroundColor: Colors.white,
        ),
        const CircleAvatar(
          radius: 11.0,
          backgroundColor: Colors.green, // تعني أن المستخدم "متصل"
        ),
      ],
    );
  }

  // **ودجت لإنشاء المنشور المميز**
  Widget _buildFeaturedPost() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Image.network(
              'https://media.istockphoto.com/id/841278554/photo/beautiful-morning-light-in-public-park-with-green-grass-field.jpg?s=612x612&w=0&k=20&c=rXOM3Uq9kPbpM5IWnCAnffHOP8KKpVKCJDMuNBlTNls=',
              width: double.infinity,
              height: 270,
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              color: Colors.black.withOpacity(0.5),
              child: const Text(
                'Amazing View!',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // **ودجت لإنشاء قسم الإعجابات**
  Widget _buildLikeSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // عرض عدد الإعجابات
          Text(
            'Likes: $count',
            style: const TextStyle(fontSize: 15),
          ),
          // زر الإعجاب
          Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    count++;
                  });
                },
                icon: const Icon(Icons.thumb_up_alt),
              ),
              const Text('Like'),
            ],
          ),
        ],
      ),
    );
  }
}
