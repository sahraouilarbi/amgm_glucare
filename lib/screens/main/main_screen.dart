import 'package:flutter/material.dart';
import '/ressources/ressources.dart';
import '/screens/widgets/my_drawer.dart';
import '/screens/widgets/my_button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static const String routeName = "/mainScreen";

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const MainScreen());
  }

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<FormFieldState> _diabetesTypeformKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _durationOfDiabetesformKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _hypoglycaemiaFormKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _glycemicControlFormKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _typeOfTreatmentFormKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _smbgFormKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _acuteComplicationsFormKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _mvdComplicationsFormKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _renalComplicationsFormKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _pregnancyFormKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _frailtyAndCognitiveFunctionFormKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _physicalLabourFormKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _previousRamadanExperienceFormKey =
      GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _fastingHoursFormKey =
      GlobalKey<FormFieldState>();

  // 1. Type de diabète
  late double? _diabetesTypeRiskScore;

  // 2. Durée du diabète
  late double? _durationOfDiabetesRiskScore;

  // 3. Hypoglycémie
  late double? _hypoglycaemiaRiskScore;

  // 4. Contrôle glycémique
  late double? _glycemicControlRiskScore;

  // 5. Traitement du diabète
  late double? _typeOfTreatmentRiskScore;

  // 6. ASG
  late double? _smbgRiskScore;

  // 7. Complications sévères
  late double? _acuteComplicationsRiskScore;

  // 8. Complications macrovasculaires/comorbidités
  late double? _mvdComplicationsRiskScore;

  // 9. Complications rénales/comorbidités
  late double? _renalComplicationsRiskScore;

  // 10. Grossesse
  late double? _pregnancyRiskScore;

  // 11. Fragilité et fonction cognitive
  late double? _frailtyAndCognitiveFunctionRiskScore;

  // 12. Activité physique
  late double? _physicalLabourRiskScore;

  // 13. Expérience du Ramadan précédent
  late double? _previousRamadanExperienceRiskScore;

  // 14. Nombre d'heures de jeûne (selon la localisation géographique)
  late double? _fastingHoursRiskScore;

  Map<String, double> _riskScoreList = {};
  double? _riskScore = 0;
  Color? _riskColor = Colors.blueAccent;
  String? _riskText = '';

  @override
  void initState() {
    super.initState();
    _diabetesTypeRiskScore = 0.0;
    _durationOfDiabetesRiskScore = 0.0;
    _hypoglycaemiaRiskScore = 0.0;
    _glycemicControlRiskScore = 0.0;
    _typeOfTreatmentRiskScore = 0.0;
    _smbgRiskScore = 0.0;
    _acuteComplicationsRiskScore = 0.0;
    _mvdComplicationsRiskScore = 0.0;
    _renalComplicationsRiskScore = 0.0;
    _pregnancyRiskScore = 0.0;
    _frailtyAndCognitiveFunctionRiskScore = 0.0;
    _physicalLabourRiskScore = 0.0;
    _previousRamadanExperienceRiskScore = 0.0;
    _fastingHoursRiskScore = 0.0;
  }

  void reset() {
    _diabetesTypeformKey.currentState?.reset();
    _durationOfDiabetesformKey.currentState?.reset();
    _hypoglycaemiaFormKey.currentState?.reset();
    _glycemicControlFormKey.currentState?.reset();
    _typeOfTreatmentFormKey.currentState?.reset();
    _smbgFormKey.currentState?.reset();
    _acuteComplicationsFormKey.currentState?.reset();
    _mvdComplicationsFormKey.currentState?.reset();
    _renalComplicationsFormKey.currentState?.reset();
    _pregnancyFormKey.currentState?.reset();
    _frailtyAndCognitiveFunctionFormKey.currentState?.reset();
    _physicalLabourFormKey.currentState?.reset();
    _previousRamadanExperienceFormKey.currentState?.reset();
    _fastingHoursFormKey.currentState?.reset();

    setState(() {
      _diabetesTypeRiskScore = 0.0;
      _durationOfDiabetesRiskScore = 0.0;
      _hypoglycaemiaRiskScore = 0.0;
      _glycemicControlRiskScore = 0.0;
      _typeOfTreatmentRiskScore = 0.0;
      _smbgRiskScore = 0.0;
      _acuteComplicationsRiskScore = 0.0;
      _mvdComplicationsRiskScore = 0.0;
      _renalComplicationsRiskScore = 0.0;
      _pregnancyRiskScore = 0.0;
      _frailtyAndCognitiveFunctionRiskScore = 0.0;
      _physicalLabourRiskScore = 0.0;
      _previousRamadanExperienceRiskScore = 0.0;
      _fastingHoursRiskScore = 0.0;
      _riskScoreList = {};
      _riskScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    _riskScoreList.isNotEmpty
        ? _riskScore = _riskScoreList.values
            .toList()
            .reduce((value, element) => value + element)
        : _riskScore = 0;
    _riskColor = (_riskScore! <= 3)
        ? Colors.green
        : (_riskScore! >= 3.5 && _riskScore! <= 6)
            ? Colors.orange
            : Colors.red;
    _riskText = (_riskScore! <= 3)
        ? 'Risque faible'
        : (_riskScore! >= 3.5 && _riskScore! <= 6)
            ? 'Risque modéré'
            : 'Risque élevé';

    return Scaffold(
      appBar: AppBar(
        title: Text('$_riskText : $_riskScore'),
        backgroundColor: _riskColor,
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: [
              Text(
                AppStrings.riskCalculator,
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const Text(AppStrings.calculateRiskOfPersone),
              const SizedBox(height: 16.0),
              const Text(
                AppStrings.important,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(AppStrings.information),
              //const SizedBox(height: 16.0),
              const Divider(height: 32.0),


              // 1. Diabète type
              myDropdownButtonFormField(
                key: _diabetesTypeformKey,
                label: '1. ${AppStrings.diabetesType}',
                value: diabetesTypeValues.entries.last.value,
                items: diabetesTypeValues.entries
                    .map((e) =>
                        DropdownMenuItem(value: e.value, child: Text(e.key)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _diabetesTypeRiskScore = double.parse(value!);
                    _riskScoreList['_diabetesTypeRiskScore'] =
                        _diabetesTypeRiskScore!;
                  });
                },
                onSaved: (value) {
                  setState(() {
                    _diabetesTypeRiskScore = double.parse(value!);
                  });
                },
              ),
              const SizedBox(height: 16.0),
              //2. Durée du Diabète
              myDropdownButtonFormField(
                  key: _durationOfDiabetesformKey,
                  label: '2. ${AppStrings.durationOfDiabetes}',
                  value: durationOfDiabetesValues.entries.last.value,
                  items: durationOfDiabetesValues.entries
                      .map((e) =>
                          DropdownMenuItem(value: e.value, child: Text(e.key)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _durationOfDiabetesRiskScore = double.parse(value!);
                      _riskScoreList['_durationOfDiabetesRiskScore'] =
                          _durationOfDiabetesRiskScore!;
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      _durationOfDiabetesRiskScore = double.parse(value!);
                    });
                  }),
              const SizedBox(height: 16.0),

              // // 3. Hypoglycémie
              myDropdownButtonFormField(
                  key: _hypoglycaemiaFormKey,
                  label: '3. ${AppStrings.hypoglycaemia}',
                  value: hypoglycaemiaValues.entries.last.value,
                  items: hypoglycaemiaValues.entries
                      .map((e) =>
                          DropdownMenuItem(value: e.value, child: Text(e.key)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _hypoglycaemiaRiskScore = double.parse(value!);
                      _riskScoreList['_hypoglycaemiaRiskScore'] =
                          _hypoglycaemiaRiskScore!;
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      _hypoglycaemiaRiskScore = double.parse(value!);
                    });
                  }),
              const SizedBox(height: 16.0),

              // 4. Contrôle glycémique
              myDropdownButtonFormField(
                  key: _glycemicControlFormKey,
                  label: '4. ${AppStrings.glycemicControl}',
                  value: glycemicControlValues.entries.last.value,
                  items: glycemicControlValues.entries
                      .map((e) =>
                          DropdownMenuItem(value: e.value, child: Text(e.key)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _glycemicControlRiskScore = double.parse(value!);
                      _riskScoreList['_glycemicControlRiskScore'] =
                          _glycemicControlRiskScore!;
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      _glycemicControlRiskScore = double.parse(value!);
                    });
                  }),
              const SizedBox(height: 16.0),

              // 5. Traitement du diabète
              myDropdownButtonFormField(
                  key: _typeOfTreatmentFormKey,
                  label: '5. ${AppStrings.typeOfTreatment}',
                  value: typeOfTreatmentValues.entries.last.value,
                  items: typeOfTreatmentValues.entries
                      .map((e) =>
                          DropdownMenuItem(value: e.value, child: Text(e.key)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _typeOfTreatmentRiskScore = double.parse(value!);
                      _riskScoreList['_typeOfTreatmentRiskScore'] =
                          _typeOfTreatmentRiskScore!;
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      _typeOfTreatmentRiskScore = double.parse(value!);
                    });
                  }),
              const SizedBox(height: 16.0),

              // 6. ASG
              myDropdownButtonFormField(
                  key: _smbgFormKey,
                  label: '6. ${AppStrings.smbg}',
                  value: smbgValues.entries.last.value,
                  items: smbgValues.entries
                      .map((e) =>
                          DropdownMenuItem(value: e.value, child: Text(e.key)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _smbgRiskScore = double.parse(value!);
                      _riskScoreList['_smbgRiskScore'] = _smbgRiskScore!;
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      _smbgRiskScore = double.parse(value!);
                    });
                  }),
              const SizedBox(height: 16.0),

              // 7. Complications sévères
              myDropdownButtonFormField(
                  key: _acuteComplicationsFormKey,
                  label: '7. ${AppStrings.acuteComplications}',
                  value: acuteComplicationsValues.entries.last.value,
                  items: acuteComplicationsValues.entries
                      .map((e) =>
                          DropdownMenuItem(value: e.value, child: Text(e.key)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _acuteComplicationsRiskScore = double.parse(value!);
                      _riskScoreList['_acuteComplicationsRiskScore'] =
                          _acuteComplicationsRiskScore!;
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      _acuteComplicationsRiskScore = double.parse(value!);
                    });
                  }),
              const SizedBox(height: 16.0),

              // 8. Complications macrovasculaires/comorbidités
              myDropdownButtonFormField(
                  key: _mvdComplicationsFormKey,
                  label: '8. ${AppStrings.mvdComplications}',
                  value: mvdComplicationsValues.entries.last.value,
                  items: mvdComplicationsValues.entries
                      .map((e) =>
                          DropdownMenuItem(value: e.value, child: Text(e.key)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _mvdComplicationsRiskScore = double.parse(value!);
                      _riskScoreList['_mvdComplicationsRiskScore'] =
                          _mvdComplicationsRiskScore!;
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      _mvdComplicationsRiskScore = double.parse(value!);
                    });
                  }),
              const SizedBox(height: 16.0),

              // 9. Complications rénales/comorbidités
              myDropdownButtonFormField(
                  key: _renalComplicationsFormKey,
                  label: '9. ${AppStrings.renalComplications}',
                  value: renalComplicationsValues.entries.last.value,
                  items: renalComplicationsValues.entries
                      .map((e) =>
                          DropdownMenuItem(value: e.value, child: Text(e.key)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _renalComplicationsRiskScore = double.parse(value!);
                      _riskScoreList['_renalComplicationsRiskScore'] =
                          _renalComplicationsRiskScore!;
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      _renalComplicationsRiskScore = double.parse(value!);
                    });
                  }),
              const SizedBox(height: 16.0),

              // 10. Grossesse
              myDropdownButtonFormField(
                  key: _pregnancyFormKey,
                  label: '10. ${AppStrings.pregnancy}',
                  value: pregnancyValues.entries.last.value,
                  items: pregnancyValues.entries
                      .map((e) =>
                          DropdownMenuItem(value: e.value, child: Text(e.key)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _pregnancyRiskScore = double.parse(value!);
                      _riskScoreList['_pregnancyRiskScore'] =
                          _pregnancyRiskScore!;
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      _pregnancyRiskScore = double.parse(value!);
                    });
                  }),
              const SizedBox(height: 16.0),

              // 11. Fragilité et fonction cognitive
              myDropdownButtonFormField(
                  key: _frailtyAndCognitiveFunctionFormKey,
                  label: '11. ${AppStrings.frailtyAndCognitiveFunction}',
                  value: frailtyAndCognitiveFunctionValues.entries.last.value,
                  items: frailtyAndCognitiveFunctionValues.entries
                      .map((e) =>
                          DropdownMenuItem(value: e.value, child: Text(e.key)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _frailtyAndCognitiveFunctionRiskScore =
                          double.parse(value!);
                      _riskScoreList['_frailtyAndCognitiveFunctionRiskScore'] =
                          _frailtyAndCognitiveFunctionRiskScore!;
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      _frailtyAndCognitiveFunctionRiskScore =
                          double.parse(value!);
                    });
                  }),
              const SizedBox(height: 16.0),

              // 12. Activité physique
              myDropdownButtonFormField(
                  key: _physicalLabourFormKey,
                  label: '12. ${AppStrings.physicalLabour}',
                  value: physicalLabourValues.entries.last.value,
                  items: physicalLabourValues.entries
                      .map((e) =>
                          DropdownMenuItem(value: e.value, child: Text(e.key)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _physicalLabourRiskScore = double.parse(value!);
                      _riskScoreList['_physicalLabourRiskScore'] =
                          _physicalLabourRiskScore!;
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      _physicalLabourRiskScore = double.parse(value!);
                    });
                  }),
              const SizedBox(height: 16.0),

              // 13. Expérience du Ramadan précédent
              myDropdownButtonFormField(
                  key: _previousRamadanExperienceFormKey,
                  label: '13. ${AppStrings.previousRamadanExperience}',
                  value: previousRamadanExperienceValues.entries.last.value,
                  items: previousRamadanExperienceValues.entries
                      .map((e) =>
                          DropdownMenuItem(value: e.value, child: Text(e.key)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _previousRamadanExperienceRiskScore =
                          double.parse(value!);
                      _riskScoreList['_previousRamadanExperienceRiskScore'] =
                          _previousRamadanExperienceRiskScore!;
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      _previousRamadanExperienceRiskScore =
                          double.parse(value!);
                    });
                  }),
              const SizedBox(height: 16.0),

              // 14. Nombre d'heures de jeûne (selon la localisation géographique)
              myDropdownButtonFormField(
                  key: _fastingHoursFormKey,
                  label: '14. ${AppStrings.fastingHours}',
                  value: fastingHoursValues.entries.last.value,
                  items: fastingHoursValues.entries
                      .map((e) =>
                          DropdownMenuItem(value: e.value, child: Text(e.key)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _fastingHoursRiskScore = double.parse(value!);
                      _riskScoreList['_fastingHoursRiskScore'] =
                          _fastingHoursRiskScore!;
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      _fastingHoursRiskScore = double.parse(value!);
                    });
                  }),
              const Divider(height: 32.0),

              const Text(AppStrings.resetText),
              //const SizedBox(height: 16.0),
              const SizedBox(height: 16.0),
              MyButton(
                onPressed: reset,
                text: AppStrings.reset,
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget myDropdownButtonFormField({
    Key? key,
    required String label,
    String? value,
    required List<DropdownMenuItem<String>>? items,
    required void Function(String?)? onChanged,
    void Function(String?)? onSaved,
  }) {
    return DropdownButtonFormField<String>(
      key: key,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      value: value,
      items: items,
      isExpanded: true,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (String? value) {
        if (value == '') {
          return "can't be empty";
        } else {
          return null;
        }
      },
    );
  }
}
