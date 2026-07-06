enum BloodType {
  aPositive('A+'),
  aNegative('A-'),
  bPositive('B+'),
  bNegative('B-'),
  oPositive('O+'),
  oNegative('O-'),
  abPositive('AB+'),
  abNegative('AB-');

  final String label;
  const BloodType(this.label);
}

class Person {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String github;
  final BloodType bloodType;

  Person({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.github,
    required this.bloodType,
  });

  @override
  bool operator ==(Object other) => other is Person && other.id == id;

  @override
  int get hashCode => id.hashCode;
}