import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  AboutPage({super.key});

  // 🔥 CHANGE THESE DETAILS
  final String whatsappNumber = "919999999999"; // country code + number
  final String email = "support@kitchenstore.com";
  final String phone = "+91 99999 99999";

  Future<void> openWhatsApp() async {
    final url = Uri.parse("https://wa.me/$whatsappNumber");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> sendEmail() async {
    final url = Uri.parse("mailto:$email?subject=Customer Support");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> callSupport() async {
    final url = Uri.parse("tel:$phone");
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  Widget infoCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    Color color = Colors.orange,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.15),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About & Support"),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🏪 HEADER CARD
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange, Colors.deepOrange],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Kitchen Store",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Your daily kitchen essentials marketplace",
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Text(
              "Customer Support",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            // 📞 SUPPORT OPTIONS
            infoCard(
              icon: Icons.chat,
              title: "WhatsApp Support",
              subtitle: "Chat with us instantly",
              onTap: openWhatsApp,
              color: Colors.green,
            ),

            infoCard(
              icon: Icons.email,
              title: "Email Support",
              subtitle: email,
              onTap: sendEmail,
              color: Colors.blue,
            ),

            infoCard(
              icon: Icons.phone,
              title: "Call Support",
              subtitle: phone,
              onTap: callSupport,
              color: Colors.red,
            ),

            SizedBox(height: 20),

            // ⭐ EXTRA CREATIVITY SECTION
            Text(
              "Why choose us?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Card(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.verified, color: Colors.orange),
                      title: Text("Trusted Kitchen Products"),
                    ),
                    ListTile(
                      leading: Icon(Icons.local_shipping, color: Colors.orange),
                      title: Text("Fast Delivery"),
                    ),
                    ListTile(
                      leading: Icon(Icons.lock, color: Colors.orange),
                      title: Text("Secure Payments"),
                    ),
                    ListTile(
                      leading: Icon(Icons.thumb_up, color: Colors.orange),
                      title: Text("Best Customer Experience"),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            Center(
              child: Text(
                "Made with ❤️ for Kitchen Lovers",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
