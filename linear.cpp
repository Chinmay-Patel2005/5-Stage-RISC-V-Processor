int multiply(int a, int b) {
    int result = 0;
    for (int i = 0; i < b; i = i + 1)
        result = result + a;
    return result;
}

int divide(int numerator, int denominator) {
    int result = 0;
    int sum = denominator;
    while (sum <= numerator) {
        result = result + 1;
        sum = sum + denominator;
    }
    return result;
}

int main() {
    // Matrix:
    // [1 1 1]   [x]   = [6]
    // [1 2 1]   [y]     [8]
    // [1 1 2]   [z]     [9]

    // Determinant D = 1*(2*2 - 1*1) - 1*(1*2 - 1*1) + 1*(1*1 - 2*1)
    int D = multiply(2, 2);  // 4
    D = D - multiply(1, 1);  // 4 - 1 = 3
    D = D - (multiply(1, 2) - multiply(1, 1));  // 2 - 1 = 1 → 3 - 1 = 2
    D = D + (multiply(1, 1) - multiply(2, 1));  // 1 - 2 = -1 → 2 -1 = 1

    // Dx = 6*(2*2 - 1*1) - 1*(8*2 - 1*9) + 1*(8*1 - 2*9)
    int Dx = multiply(2, 2);         // 4
    Dx = Dx - multiply(1, 1);        // 4 - 1 = 3
    Dx = multiply(6, Dx);            // 6 * 3 = 18

    int t1 = multiply(8, 2);         // 16
    t1 = t1 - multiply(1, 9);        // 16 - 9 = 7
    Dx = Dx - t1;                    // 18 - 7 = 11

    t1 = multiply(8, 1) - multiply(2, 9); // 8 - 18 = -10
    Dx = Dx + t1;                    // 11 - 10 = 1

    // Dy = 1*(8*2 - 1*9) - 6*(1*2 - 1*1) + 1*(1*9 - 8*1)
    int Dy = multiply(8, 2) - multiply(1, 9);  // 16 - 9 = 7

    t1 = multiply(1, 2) - multiply(1, 1);      // 2 - 1 = 1
    Dy = Dy - multiply(6, t1);                // 7 - 6 = 1

    t1 = multiply(1, 9) - multiply(8, 1);      // 9 - 8 = 1
    Dy = Dy + t1;                              // 1 + 1 = 2

    // Dz = 1*(2*9 - 8*1) - 1*(1*9 - 6*1) + 6*(1*1 - 2*1)
    int Dz = multiply(2, 9) - multiply(8, 1);  // 18 - 8 = 10

    t1 = multiply(1, 9) - multiply(6, 1);      // 9 - 6 = 3
    Dz = Dz - t1;                              // 10 - 3 = 7

    t1 = multiply(1, 1) - multiply(2, 1);      // 1 - 2 = -1
    Dz = Dz + multiply(6, t1);                // 7 - 6 = 1

    // Solve
    int x = divide(Dx, D);  // 1 / 1 = 1
    int y = divide(Dy, D);  // 2 / 1 = 2
    int z = divide(Dz, D);  // 3 / 1 = 3

    return 0;
}
