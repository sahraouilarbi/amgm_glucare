// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'risk_calculator_cubit.dart';

class RiskCalculatorState extends Equatable {
  final double riskScore;
  final Map<String, double> riskScoreList;
  final String riskText;
  final Color riskColor;

  const RiskCalculatorState({
    required this.riskScore,
    required this.riskScoreList,
    required this.riskText,
    required this.riskColor,
  });

  RiskCalculatorState copyWith({
    double? riskScore,
    Map<String, double>? riskScoreList,
    String? riskText,
    Color? riskColor,
  }) {
    return RiskCalculatorState(
      riskScore: riskScore ?? this.riskScore,
      riskScoreList: riskScoreList ?? this.riskScoreList,
      riskText: riskText ?? this.riskText,
      riskColor: riskColor ?? this.riskColor,
    );
  }

  @override
  List<Object> get props => [
        riskScore,
        riskScoreList,
        riskText,
        riskColor,
      ];
}
