import 'dart:math';
import 'dart:io';

void main() {
  while (true) {
    print("\nChọn loại phương trình:");
    print("1. Phương trình bậc 1 (ax + b = 0)");
    print("2. Phương trình bậc 2 (ax² + bx + c = 0)");
    print("3. Tính Can Chi");
    print("4. Kiểm tra năm nhuận");
    print("5. Số siêu lớn");
    print("0. Thoát");

    stdout.write("Nhập lựa chọn của bạn: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        solveLinearEquationTerminal();
        break;
      case '2':
        solveQuadraticEquationTerminal();
        break;
      case '3':
        calculateCanChiTerminal();
        break;
      case '4':
        checkLeapYearTerminal();
        break;
      case '5':
        bigIntOperationsTerminal();
        break;
      case '0':
        print("Thoát chương trình.");
        return;
      default:
        print("Lựa chọn không hợp lệ. Vui lòng nhập lại.");
    }
  }
}

void solveLinearEquationTerminal() {
  print("Nhập a: ");
  String? inputA = stdin.readLineSync();
  double? a = double.tryParse(inputA ?? "");
  if (a == null) {
    print("Giá trị không hợp lệ. Vui lòng nhập số.");
    return;
  }

  stdout.write("Nhập b: ");
  String? inputB = stdin.readLineSync();
  double? b = double.tryParse(inputB ?? "");
  if (b == null) {
    print("Giá trị không hợp lệ. Vui lòng nhập số.");
    return;
  }

  if (a == 0) {
    print(b == 0 ? "Phương trình vô số nghiệm." : "Phương trình vô nghiệm.");
  } else {
    double x = -b / a;
    print("Nghiệm của phương trình là x = $x");
  }
}

void solveQuadraticEquationTerminal() {
  stdout.write("Nhập a: ");
  double? a = double.tryParse(stdin.readLineSync() ?? "");
  if (a == null) {
    print("Giá trị không hợp lệ.");
    return;
  }

  stdout.write("Nhập b: ");
  double? b = double.tryParse(stdin.readLineSync() ?? "");
  if (b == null) {
    print("Giá trị không hợp lệ.");
    return;
  }

  stdout.write("Nhập c: ");
  double? c = double.tryParse(stdin.readLineSync() ?? "");
  if (c == null) {
    print("Giá trị không hợp lệ.");
    return;
  }

  if (a == 0) {
    solveLinearEquationTerminal();
    return;
  }

  double delta = b * b - 4 * a * c;
  if (delta > 0) {
    double x1 = (-b + sqrt(delta)) / (2 * a);
    double x2 = (-b - sqrt(delta)) / (2 * a);
    print("Phương trình có hai nghiệm: x1 = $x1, x2 = $x2");
  } else if (delta == 0) {
    double x = -b / (2 * a);
    print("Phương trình có nghiệm kép: x = $x");
  } else {
    print("Phương trình vô nghiệm.");
  }
}

void calculateCanChiTerminal() {
  stdout.write("Nhập năm: ");
  int? year = int.tryParse(stdin.readLineSync() ?? "");
  if (year == null) {
    print("Vui lòng nhập năm hợp lệ.");
    return;
  }

  List<String> can = ["Canh", "Tân", "Nhâm", "Quý", "Giáp", "Ất", "Bính", "Đinh", "Mậu", "Kỷ"];
  List<String> chi = ["Thân", "Dậu", "Tuất", "Hợi", "Tý", "Sửu", "Dần", "Mão", "Thìn", "Tỵ", "Ngọ", "Mùi"];

  print("Năm $year là năm ${can[year % 10]} ${chi[year % 12]}");
}

void checkLeapYearTerminal() {
  stdout.write("Nhập năm: ");
  int? year = int.tryParse(stdin.readLineSync() ?? "");
  if (year == null) {
    print("Vui lòng nhập năm hợp lệ.");
    return;
  }

  print((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)
      ? "$year là năm nhuận."
      : "$year không phải là năm nhuận.");
}

void bigIntOperationsTerminal() {
  stdout.write("Nhập số thứ nhất: ");
  BigInt? num1 = BigInt.tryParse(stdin.readLineSync() ?? "");
  if (num1 == null) {
    print("Vui lòng nhập số hợp lệ.");
    return;
  }

  stdout.write("Nhập số thứ hai: ");
  BigInt? num2 = BigInt.tryParse(stdin.readLineSync() ?? "");
  if (num2 == null) {
    print("Vui lòng nhập số hợp lệ.");
    return;
  }

  print("Tổng: ${num1 + num2}");
  print("Hiệu: ${num1 - num2}");
  print("Tích: ${num1 * num2}");
  print(num2 != BigInt.zero ? "Thương: ${num1 ~/ num2}" : "Không thể chia cho 0.");
}
