import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class FormScreen extends StatefulWidget {
  final String maintainer;

  FormScreen({required this.maintainer});

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final TextEditingController _waktuPerbaikanController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _kodeAssetController = TextEditingController();
  final TextEditingController _detailActionController = TextEditingController();
  final SignatureController _tandaTanganController = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
  );

  String _departemen = 'AKT';
  String _tipePerbaikan = 'Preventif';
  String _jenisPerangkat = 'Laptop';

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 60,
              ),
              SizedBox(height: 16),
              Text(
                'Data berhasil direkam',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Support User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildFixedTextField(labelText: 'Maintainer', initialValue: widget.maintainer),
            SizedBox(height: 20),
            TextField(
              controller: _waktuPerbaikanController,
              decoration: InputDecoration(
                labelText: 'Waktu Perbaikan',
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
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  setState(() {
                    _waktuPerbaikanController.text = pickedDate.toString().split(' ')[0];
                  });
                }
              },
            ),
            SizedBox(height: 20),
            _buildDropdownField(
              labelText: 'Departemen',
              value: _departemen,
              items: ['AKT', 'PBJ', 'FNS'],
              onChanged: (val) {
                setState(() {
                  _departemen = val!;
                });
              },
            ),
            SizedBox(height: 20),
            _buildTextField(labelText: 'User', controller: _userController),
            SizedBox(height: 20),
            _buildDropdownField(
              labelText: 'Tipe Perbaikan',
              value: _tipePerbaikan,
              items: ['Preventif', 'Perbaikan', 'Upgrade'],
              onChanged: (val) {
                setState(() {
                  _tipePerbaikan = val!;
                });
              },
            ),
            SizedBox(height: 20),
            _buildDropdownField(
              labelText: 'Jenis Perangkat',
              value: _jenisPerangkat,
              items: ['Laptop', 'Printer', 'PC'],
              onChanged: (val) {
                setState(() {
                  _jenisPerangkat = val!;
                });
              },
            ),
            SizedBox(height: 20),
            _buildTextField(labelText: 'Kode Asset', controller: _kodeAssetController),
            SizedBox(height: 20),
            _buildBigTextField(labelText: 'Detail Action', controller: _detailActionController),
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
                  _showSuccessDialog();
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

  Widget _buildBigTextField({required String labelText, required TextEditingController controller}) {
    return TextField(
      controller: controller,
      maxLines: 5,
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

  Widget _buildDropdownField({required String labelText, required String value, required List<String> items, required void Function(String?) onChanged}) {
    return InputDecorator(
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
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isDense: true,
          onChanged: onChanged,
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildFixedTextField({required String labelText, required String initialValue}) {
    return TextField(
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
      controller: TextEditingController(text: initialValue),
      readOnly: true,
    );
  }
}
