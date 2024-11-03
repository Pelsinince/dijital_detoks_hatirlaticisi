import 'package:flutter/material.dart';

class ArticlePage extends StatelessWidget {
  // Örnek makale verileri
  final List<Map<String, String>> articles = [
    {
      'title': 'Dijital Farkındalık Nedir?',
      'summary': 'Dijital farkındalık, bireylerin çevrimiçi ortamda bilinçli ve güvenli bir şekilde hareket edebilme yeteneğidir.',
      'content': 'Dijital farkındalık, bireylerin çevrimiçi ortamda bilinçli ve güvenli bir şekilde hareket edebilme yeteneğidir. İnternetin sunduğu olanakların yanı sıra, olası tehlikelerin de farkında olmak, dijital okuryazarlığın temelini oluşturur. Bu farkındalık, bireylerin bilgiye erişim, sosyal medya kullanımı ve veri güvenliği gibi konularda daha bilinçli kararlar almasına yardımcı olur.'
    },
    {
      'title': 'Dijital Güvenlik ve Kişisel Verilerin Korunması',
      'summary': 'Dijital güvenlik, bireylerin çevrimiçi ortamlarda kişisel verilerini nasıl koruyabileceğini ele alır.',
      'content': 'Dijital güvenlik, bireylerin çevrimiçi ortamda kişisel verilerini koruma yeteneğidir. Güvenli parolalar oluşturmak, iki faktörlü kimlik doğrulama kullanmak ve bilinmeyen bağlantılara tıklamaktan kaçınmak gibi önlemler, kişisel verilerin korunmasında önemlidir.'
    },
    {
      'title': 'Sosyal Medya ve Dijital İzleme',
      'summary': 'Sosyal medya platformlarının veri toplama yöntemleri ve bireylerin bu duruma karşı alması gereken önlemler.',
      'content': 'Sosyal medya, kullanıcıların kişisel verilerini toplamak için çeşitli yöntemler kullanır. Kullanıcıların paylaşımlarının nasıl izlendiğini anlaması, dijital farkındalık açısından önemlidir. Kullanıcılar, gizlilik ayarlarını kontrol ederek ve dikkatli paylaşım yaparak kendilerini koruyabilirler.'
    },
    {
      'title': 'Dijital Okuryazarlık: Bilgiye Erişim ve Kullanım',
      'summary': 'Dijital okuryazarlık, bireylerin çevrimiçi bilgiye erişim ve bunu etkili bir şekilde kullanma becerisini içerir.',
      'content': 'Dijital okuryazarlık, bireylerin çevrimiçi bilgiye erişim sağlama ve bu bilgiyi etkili bir şekilde kullanabilme becerisidir. Doğru bilgi kaynaklarını tanımak ve bilgi doğrulama yöntemlerini bilmek, bireylerin çevrimiçi dünyada daha bilinçli olmalarına yardımcı olur.'
    },
    {
      'title': 'Dijital Dünyada Etik ve Sorumluluk',
      'summary': 'Dijital dünyada etik değerler ve bireylerin bu değerleri nasıl koruması gerektiği üzerine bir inceleme.',
      'content': 'Dijital dünyada etik, bireylerin çevrimiçi ortamda sorumlu bir şekilde davranmasını ifade eder. Başkalarının gizlilik haklarına saygı göstermek, doğru bilgileri paylaşmak ve çevrimiçi etkileşimlerde saygılı olmak, dijital etik değerlerin bir parçasıdır.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Makaleler'),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            elevation: 4,
            shadowColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article['title']!,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey.shade800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    article['summary']!,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {
                        // Makale okuma sayfasına yönlendirme
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ArticleDetailPage(
                              title: article['title']!,
                              content: article['content']!,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue
                      ),
                      child: const Text('Makale Oku'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ArticleDetailPage extends StatelessWidget {
  final String title;
  final String content;

  ArticleDetailPage({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          content,
          style: TextStyle(fontSize: 18, color: Colors.grey.shade800),
        ),
      ),
    );
  }
}
