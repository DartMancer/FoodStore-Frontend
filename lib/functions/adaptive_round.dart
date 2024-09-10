class GraphMaxRound {
  int adaptiveRound(int number) {
    // Определение порядка величины числа
    int magnitude = number == 0 ? 0 : (number ~/ number.toString().length);

    // Выбор шага округления в зависимости от порядка величины
    int roundTo;
    if (magnitude < 10) {
      roundTo = 1; // Для чисел < 10 округляем до единиц
    } else if (magnitude < 100) {
      roundTo = 10; // Для чисел < 100 округляем до десятков
    } else if (magnitude < 1000) {
      roundTo = 100; // Для чисел < 1000 округляем до сотен
    } else if (magnitude < 10000) {
      roundTo = 1000; // Для чисел < 1000 округляем до сотен
    } else if (magnitude < 100000) {
      roundTo = 10000; // Для чисел < 1000 округляем до сотен
    } else if (magnitude < 1000000) {
      roundTo = 100000; // Для чисел < 1000 округляем до сотен
    } else if (magnitude < 10000000) {
      roundTo = 1000000; // Для чисел < 1000 округляем до сотен
    } else {
      roundTo = 1000; // Для чисел >= 1000 округляем до тысяч
    }

    // Округление
    return ((number + roundTo - 1) ~/ roundTo) * roundTo;
  }
}
