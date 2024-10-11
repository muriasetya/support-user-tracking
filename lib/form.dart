import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _ipController = TextEditingController();
  final SignatureController _tandaTanganController = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Feedback'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTextField(labelText: 'Nama User', controller: _namaController),
            SizedBox(height: 20),
            _buildTextField(labelText: 'IP Address', controller: _ipController),
            SizedBox(height: 20),
            Text('Tanda Tangan', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Signature(
              controller: _tandaTanganController,
              backgroundColor: Colors.grey[200]!,
              height: 200,
              width: MediaQuery.of(context).size.width,
            ),
            SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: ElevatedButton(
                onPressed: () {
                  // Aksi saat tombol ditekan
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF47BD11),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String labelText, required TextEditingController controller}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF0e5922)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF0e5922)),
        ),
        floatingLabelStyle: TextStyle(color: Color(0xFF0e5922)),
      ),
    );
  }
}
