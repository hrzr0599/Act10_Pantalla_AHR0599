import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: NuestroEquipoPage()));

class NuestroEquipoPage extends StatelessWidget {
  const NuestroEquipoPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Definición de colores para un look profesional
    const Color primaryRed = Color(0xFFD32F2F);
    const Color primaryBlue = Color(0xFF1976D2);
    const Color darkNavy = Color(0xFF1A1A1A);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SECCIÓN SUPERIOR: Header Recto
            Container(
              height: 150,
              width: double.infinity,
              color: darkNavy,
              child: const Center(
                child: Text(
                  'Nuestro Equipo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 20),

            // LISTA DE MÉDICOS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildMedicoCard(
                    "Dr. Hernandez Roman",
                    "Neurología",
                    "https://hips.hearstapps.com/hmg-prod/images/portrait-of-a-happy-young-doctor-in-his-clinic-royalty-free-image-1661432441.jpg?crop=0.66698xw:1xh;center,top&resize=1200:*",
                    primaryBlue,
                  ),
                  _buildMedicoCard(
                    "Lic. Josue Saul",
                    "Psicología",
                    "https://s1.ppllstatics.com/diariovasco/www/multimedia/202109/08/media/cortadas/67433801-khRF--1248x770@Diario%20Vasco.JPG",
                    primaryRed,
                  ),
                  _buildMedicoCard(
                    "Dra. Maria Montera",
                    "Odontología",
                    "https://www.scripps.org/sparkle-assets/images/new_doctor_fb-32abb9ba141c8223aadebce90782ac68.jpeg",
                    primaryBlue,
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),

            // DECORACIÓN INFERIOR (Restaurada)
            Transform.rotate(
              angle: 3.1416, // Rotado para espejo
              child: ClipPath(
                clipper: HeaderClipper(),
                child: Container(height: 100, color: darkNavy.withOpacity(0.1)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMedicoCard(String nombre, String especialidad, String imageUrl, Color accentColor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 6,
              decoration: BoxDecoration(
                color: accentColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircleAvatar(
                radius: 35,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    nombre,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF212121),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    especialidad.toUpperCase(),
                    style: TextStyle(
                      fontSize: 13,
                      color: accentColor,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey),
            const SizedBox(width: 15),
          ],
        ),
      ),
    );
  }
}

// Clase para crear los picos del boceto
class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 40);
    path.lineTo(size.width * 0.2, size.height);
    path.lineTo(size.width * 0.4, size.height - 30);
    path.lineTo(size.width * 0.7, size.height - 10);
    path.lineTo(size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
