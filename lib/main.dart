import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Phước Em :))',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _aPt1 = TextEditingController();
  final TextEditingController _bPt1 = TextEditingController();
  String _result1 = "";

  final TextEditingController _aPt2 = TextEditingController();
  final TextEditingController _bPt2 = TextEditingController();
  final TextEditingController _cPt2 = TextEditingController();
  String _result2 = "";

  final TextEditingController _namCanchi = TextEditingController();
  String _result3 = "";
 final  TextEditingController _nam = TextEditingController();
  String _result4 = "";
  void _namNhuan () {
    int? nam = int.tryParse(_nam.text);
    if (nam == null || nam <= 0) {
      setState(() {
        _result4 = "Vui lòng nhập năm hợp lệ!";
      });
      return;
    }

    setState(() {
      _result4 = namNhuan(nam);
    });
  }
  void _solveLinearEquation() {
    double? a = double.tryParse(_aPt1.text);
    double? b = double.tryParse(_bPt1.text);

    if (a == null || b == null) {
      setState(() {
        _result1 = "Vui lòng nhập số hợp lệ!";
      });
      return;
    }

    setState(() {
      _result1 = solveLinearEquation(a, b);
    });
  }
  String namNhuan(int nam) {
    if (nam % 400 == 0 || (nam % 4 == 0 && nam % 100 != 0)) {
      return "Năm $nam là năm nhuận";
    }
    return "Năm $nam không phải là năm nhuận";
  }


  String solveLinearEquation(double a, double b) {
    if (a == 0) return b == 0 ? "Phương trình có vô số nghiệm" : "Phương trình vô nghiệm";
    return "Nghiệm của phương trình là: x = ${(-b / a).toStringAsFixed(2)}";
  }

  void _solveQuadraticEquation() {
    double? a = double.tryParse(_aPt2.text);
    double? b = double.tryParse(_bPt2.text);
    double? c = double.tryParse(_cPt2.text);

    if (a == null || b == null || c == null) {
      setState(() {
        _result2 = "Vui lòng nhập số hợp lệ!";
      });
      return;
    }

    setState(() {
      _result2 = solveQuadraticEquation(a, b, c);
    });
  }

  String solveQuadraticEquation(double a, double b, double c) {
    if (a == 0) return solveLinearEquation(b, c);

    double delta = b * b - 4 * a * c;
    if (delta < 0) return "Phương trình vô nghiệm";
    if (delta == 0) return "Phương trình có nghiệm kép: x = ${(-b / (2 * a)).toStringAsFixed(2)}";

    double x1 = (-b + sqrt(delta)) / (2 * a);
    double x2 = (-b - sqrt(delta)) / (2 * a);
    return "Phương trình có 2 nghiệm: x1 = ${x1.toStringAsFixed(2)}, x2 = ${x2.toStringAsFixed(2)}";
  }

  void _calculateCanChi() {
    int? nam = int.tryParse(_namCanchi.text);
    if (nam == null || nam <= 0) {
      setState(() {
        _result3 = "Vui lòng nhập năm hợp lệ!";
      });
      return;
    }

    setState(() {
      _result3 = getCanChi(nam);
    });
  }

  String getCanChi(int nam) {
    List<String> can = ["Giáp", "Ất", "Bính", "Đinh", "Mậu", "Kỷ", "Canh", "Tân", "Nhâm", "Quý"];
    List<String> chi = ["Tý", "Sửu", "Dần", "Mão", "Thìn", "Tỵ", "Ngọ", "Mùi", "Thân", "Dậu", "Tuất", "Hợi"];

    return "Năm $nam là năm: ${can[nam % 10]} ${chi[nam % 12]}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Phước Em :))"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle("Phương trình bậc 1"),
              _buildTextField(_aPt1, "Nhập hệ số a"),
              _buildTextField(_bPt1, "Nhập hệ số b"),
              _buildButton("Giải phương trình bậc 1", _solveLinearEquation),
              _buildResult(_result1),

              _buildTitle("Phương trình bậc 2"),
              _buildTextField(_aPt2, "Nhập hệ số a"),
              _buildTextField(_bPt2, "Nhập hệ số b"),
              _buildTextField(_cPt2, "Nhập hệ số c"),
              _buildButton("Giải phương trình bậc 2", _solveQuadraticEquation),
              _buildResult(_result2),

              _buildTitle("Can Chi"),
              _buildTextField(_namCanchi, "Nhập năm "),
              _buildButton("Tính Can Chi", _calculateCanChi),
              _buildResult(_result3),

              _buildTitle("Năm nhuận"),
              _buildTextField(_nam, "Nhập năm "),
              _buildButton("Kiểm tra năm nhuận", _namNhuan),
              _buildResult(_result4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(labelText: hint, border: const OutlineInputBorder()),
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        child: Text(text),
      ),
    );
  }
  Widget _buildResult(String result) {
    return Text(result, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold));
  }
}
