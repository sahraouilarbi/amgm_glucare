import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' show Color, Colors;
import 'package:flutter_bloc/flutter_bloc.dart';

part 'risk_calculator_state.dart';

class RiskCalculatorCubit extends Cubit<RiskCalculatorState> {
  RiskCalculatorCubit()
      : super(const RiskCalculatorState(
          riskScore: 0.0,
          riskScoreList: {},
          riskText: '',
          riskColor: Colors.blueAccent,
        ));

  void updateRiskScore(String key, double value) {
    final updateRiskScoreList = Map<String, double>.from(state.riskScoreList);
    updateRiskScoreList[key] = value;

    final double riskScore = updateRiskScoreList.values
        .fold<double>(0.0, (sum, score) => sum + score);

    final Color riskColor = _calculateRiskColor(riskScore);
    final riskText = _calculateRiskText(riskScore);

    emit(state.copyWith(
      riskScore: riskScore,
      riskScoreList: updateRiskScoreList,
      riskColor: riskColor,
      riskText: riskText,
    ));
  }

  void reset() {
    emit(const RiskCalculatorState(
      riskScore: 0.0,
      riskScoreList: {},
      riskText: '',
      riskColor: Colors.blueAccent,
    ));
  }

  Color _calculateRiskColor(double riskScore) {
    if (riskScore <= 3) {
      return Colors.green;
    } else if (riskScore >= 3.5 && riskScore <= 6) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  String _calculateRiskText(double riskScore) {
    if (riskScore <= 3) {
      return 'lowRisk';
    } else if (riskScore >= 3.5 && riskScore <= 6) {
      return 'moderateRisk';
    } else {
      return 'hightRisk';
    }
  }
}
