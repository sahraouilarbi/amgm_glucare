import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import '/screens/widgets/widgets.dart';

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
        ? AppLocalizations.of(context)!.riskLow
        : (_riskScore! >= 3.5 && _riskScore! <= 6)
            ? AppLocalizations.of(context)!.riskModerate
            : AppLocalizations.of(context)!.riskHigh;

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
                AppLocalizations.of(context)!.riskCalculator,
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              Text(AppLocalizations.of(context)!.calculateRiskOfPersone),
              const SizedBox(height: 24.0),
              Text(
                AppLocalizations.of(context)!.important,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(AppLocalizations.of(context)!.information),
              const Divider(height: 32.0),

              // 1. Diabète type
              MyDropdownButtonFormField(
                formFieldStateKey: _diabetesTypeformKey,
                label:
                    '1. ${AppLocalizations.of(context)!.iDFDAR_01_diabetesType}',
                value: '0.0',
                items: <DropdownMenuItem<String>>[
                  DropdownMenuItem<String>(
                    value: '1.0',
                    child: Text(AppLocalizations.of(context)!
                        .iDFDAR_01_diabetesType_01_Type1),
                  ),
                  DropdownMenuItem<String>(
                    value: '0.0',
                    child: Text(AppLocalizations.of(context)!
                        .iDFDAR_01_diabetesType_00_Type2),
                  ),
                ],
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
              const SizedBox(height: 24.0),

              //2. Durée du Diabète
              MyDropdownButtonFormField(
                  formFieldStateKey: _durationOfDiabetesformKey,
                  label:
                      '2. ${AppLocalizations.of(context)!.iDFDAR_02_durationOfDiabetes}',
                  value: '0.0',
                  items: <DropdownMenuItem<String>>[
                    DropdownMenuItem<String>(
                      value: '1.0',
                      child: Text(AppLocalizations.of(context)!
                          .iDFDAR_02_durationOfDiabetes_01_GreaterOrEgal10),
                    ),
                    DropdownMenuItem<String>(
                      value: '0.0',
                      child: Text(AppLocalizations.of(context)!
                          .iDFDAR_02_durationOfDiabetes_00_LessThan10),
                    ),
                  ],
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
              const SizedBox(height: 24.0),

              // // 3. Hypoglycémie
              MyDropdownButtonFormField(
                  formFieldStateKey: _hypoglycaemiaFormKey,
                  label:
                      '3. ${AppLocalizations.of(context)!.iDFDAR_03_hypoglycaemia}',
                  value: '0.0',
                  items: <DropdownMenuItem<String>>[
                    DropdownMenuItem<String>(
                      value: '6.5',
                      child: Text(AppLocalizations.of(context)!
                          .iDFDAR_03_hypoglycaemia_65_Unawareness),
                    ),
                    DropdownMenuItem<String>(
                      value: '5.5',
                      child: Text(AppLocalizations.of(context)!
                          .iDFDAR_03_hypoglycaemia_55_RecentSevere),
                    ),
                    DropdownMenuItem<String>(
                      value: '3.5',
                      child: Text(AppLocalizations.of(context)!
                          .iDFDAR_03_hypoglycaemia_35_MultipleWeekly),
                    ),
                    DropdownMenuItem<String>(
                      value: '1.0',
                      child: Text(AppLocalizations.of(context)!
                          .iDFDAR_03_hypoglycaemia_10_LessThan1perWeek),
                    ),
                    DropdownMenuItem<String>(
                      value: '0.0',
                      child: Text(AppLocalizations.of(context)!
                          .iDFDAR_03_hypoglycaemia_00_No),
                    ),
                  ],
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
              const SizedBox(height: 24.0),

              // 4. Contrôle glycémique
              MyDropdownButtonFormField(
                  formFieldStateKey: _glycemicControlFormKey,
                  label:
                      '4. ${AppLocalizations.of(context)!.iDFDAR_04_glycemicControl}',
                  value: '0.0',
                  items: <DropdownMenuItem<String>>[
                    DropdownMenuItem<String>(
                      value: '2.0',
                      child: Text(AppLocalizations.of(context)!
                          .iDFDAR_04_glycemicControl_20_HBA1CGreaterThan9),
                    ),
                    DropdownMenuItem<String>(
                      value: '1.0',
                      child: Text(AppLocalizations.of(context)!
                          .iDFDAR_04_glycemicControl_10_HBA1CBetween7_5And9),
                    ),
                    DropdownMenuItem<String>(
                      value: '0.0',
                      child: Text(AppLocalizations.of(context)!
                          .iDFDAR_04_glycemicControl_00_HBA1CLessThan7_5),
                    ),
                  ],
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
              const SizedBox(height: 24.0),

              // 5. Traitement du diabète
              MyDropdownButtonFormField(
                  formFieldStateKey: _typeOfTreatmentFormKey,
                  label:
                      '5. ${AppLocalizations.of(context)!.iDFDAR_05_typeOfTreatment}',
                  value: '0.0',
                  items: <DropdownMenuItem<String>>[
                    DropdownMenuItem<String>(
                      value: '3.0',
                      child: Text(AppLocalizations.of(context)!
                          .iDFDAR_05_typeOfTreatment_30_MultipleDailyMixedInsulinInjections),
                    ),
                    DropdownMenuItem<String>(
                      value: '2.5',
                      child: Text(AppLocalizations.of(context)!
                          .iDFDAR_05_typeOfTreatment_25_BasalBolusOrInsulinPump),
                    ),
                    DropdownMenuItem<String>(
                      value: '2.0',
                      child: Text(AppLocalizations.of(context)!
                          .iDFDAR_05_typeOfTreatment_20_OneDailyMixedInsulin),
                    ),
                    DropdownMenuItem<String>(
                      value: '1.5',
                      child: Text(AppLocalizations.of(context)!
                          .iDFDAR_05_typeOfTreatment_15_BasalInsulin),
                    ),
                    DropdownMenuItem<String>(
                      value: '1.0',
                      child: Text(AppLocalizations.of(context)!
                          .iDFDAR_05_typeOfTreatment_10_Glibenclamide),
                    ),
                    DropdownMenuItem<String>(
                      value: '0.5',
                      child: Text(AppLocalizations.of(context)!
                          .iDFDAR_05_typeOfTreatment_05_GliclazideOrGlimeprideOrRepeglanide),
                    ),
                    DropdownMenuItem<String>(
                      value: '0.0',
                      child: Text(AppLocalizations.of(context)!
                          .iDFDAR_05_typeOfTreatment_00_OtherTherapy),
                    ),
                  ],
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
              const SizedBox(height: 24.0),

              // 6. ASG
              MyDropdownButtonFormField(
                  formFieldStateKey: _smbgFormKey,
                  label: '6. ${AppLocalizations.of(context)!.iDFDAR_06_smbg}',
                  value: '0.0',
                  items: <DropdownMenuItem<String>>[
                    DropdownMenuItem<String>(
                      value: '2.0',
                      child: Text(AppLocalizations.of(context)!
                          .iDFDAR_06_smbg_20_IndicatedButNotConducted),
                    ),
                    DropdownMenuItem<String>(
                      value: '1.0',
                      child: Text(AppLocalizations.of(context)!
                          .iDFDAR_06_smbg_10_IndicatedButConducted),
                    ),
                    DropdownMenuItem<String>(
                      value: '0.0',
                      child: Text(AppLocalizations.of(context)!
                          .iDFDAR_06_smbg_00_ConductedAsIndicated),
                    ),
                  ],
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
              const SizedBox(height: 24.0),

              // 7. Complications sévères
              MyDropdownButtonFormField(
                  formFieldStateKey: _acuteComplicationsFormKey,
                  label:
                      '7. ${AppLocalizations.of(context)!.iDFDAR_07_acuteComplications}',
                  value: '0.0',
                  items: <DropdownMenuItem<String>>[
                    DropdownMenuItem<String>(
                      value: '3.0',
                      child: Text(AppLocalizations.of(context)!
                          .iDFDAR_07_acuteComplications_30_DkaHoncInTheLast3Months),
                    ),
                    DropdownMenuItem<String>(
                      value: '2.0',
                      child: Text(AppLocalizations.of(context)!
                          .iDFDAR_07_acuteComplications_20_DkaHoncInTheLast6Months),
                    ),
                    DropdownMenuItem<String>(
                      value: '1.0',
                      child: Text(AppLocalizations.of(context)!
                          .iDFDAR_07_acuteComplications_10_DkaHoncInTheLast12Months),
                    ),
                    DropdownMenuItem<String>(
                      value: '0.0',
                      child: Text(AppLocalizations.of(context)!
                          .iDFDAR_07_acuteComplications_00_NoDkaHonc),
                    ),
                  ],
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
              const SizedBox(height: 4.0),
              Text(AppLocalizations.of(context)!.iDFDARshhDescription),
              const SizedBox(height: 24.0),

              // 8. Complications macrovasculaires/comorbidités
              MyDropdownButtonFormField(
                  formFieldStateKey: _mvdComplicationsFormKey,
                  label:
                      '8. ${AppLocalizations.of(context)!.iDFDAR_08_mvdComplications}',
                  value: '0.0',
                  items: <DropdownMenuItem<String>>[
                    DropdownMenuItem<String>(
                      value: '6.5',
                      child: Text(AppLocalizations.of(context)!
                          .iDFDAR_08_mvdComplications_65_UnstableMVD),
                    ),
                    DropdownMenuItem<String>(
                      value: '2.0',
                      child: Text(AppLocalizations.of(context)!
                          .iDFDAR_08_mvdComplications_20_StableMVD),
                    ),
                    DropdownMenuItem<String>(
                      value: '0.0',
                      child: Text(AppLocalizations.of(context)!
                          .iDFDAR_08_mvdComplications_00_NoMVD),
                    ),
                  ],
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
              const SizedBox(height: 24.0),

              // 9. Complications rénales/comorbidités
              MyDropdownButtonFormField(
                  formFieldStateKey: _renalComplicationsFormKey,
                  label:
                      '9. ${AppLocalizations.of(context)!.iDFDAR_09_renalComplications}',
                  value: '0.0',
                  items: <DropdownMenuItem<String>>[
                    DropdownMenuItem<String>(
                      value: '6.5',
                      child: Text(
                        AppLocalizations.of(context)!
                            .iDFDAR_09_renalComplications_65_eGFRlessThan30,
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: '4.0',
                      child: Text(
                        AppLocalizations.of(context)!
                            .iDFDAR_09_renalComplications_40_eGFRbetween30and45,
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: '2.0',
                      child: Text(
                        AppLocalizations.of(context)!
                            .iDFDAR_09_renalComplications_20_eGFRbetween45and60,
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: '0.0',
                      child: Text(
                        AppLocalizations.of(context)!
                            .iDFDAR_09_renalComplications_00_eGFRmoreThan60,
                      ),
                    ),
                  ],
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
              const SizedBox(height: 4.0),
              Text(AppLocalizations.of(context)!.iDFDAReGFRDescription),
              const SizedBox(height: 24.0),

              // 10. Grossesse
              MyDropdownButtonFormField(
                  formFieldStateKey: _pregnancyFormKey,
                  label:
                      '10. ${AppLocalizations.of(context)!.iDFDAR_10_pregnancy}',
                  value: '0.0',
                  items: <DropdownMenuItem<String>>[
                    DropdownMenuItem<String>(
                      value: '6.5',
                      child: Text(
                        AppLocalizations.of(context)!
                            .iDFDAR_10_pregnancy_65_PregnantNotWithinTargets,
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: '3.5',
                      child: Text(
                        AppLocalizations.of(context)!
                            .iDFDAR_10_pregnancy_35_PregnantWithinTargets,
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: '0.0',
                      child: Text(
                        AppLocalizations.of(context)!
                            .iDFDAR_10_pregnancy_00_NotPregnant,
                      ),
                    )
                  ],
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
              const SizedBox(height: 24.0),

              // 11. Fragilité et fonction cognitive
              MyDropdownButtonFormField(
                  formFieldStateKey: _frailtyAndCognitiveFunctionFormKey,
                  label:
                      '11. ${AppLocalizations.of(context)!.iDFDAR_11_frailtyAndCognitiveFunction}',
                  value: '0.0',
                  items: <DropdownMenuItem<String>>[
                    DropdownMenuItem<String>(
                      value: '6.5',
                      child: Text(AppLocalizations.of(context)!
                          .iDFDAR_11_frailtyAndCognitiveFunction_65_ImpairedCognitiveFunctionOrFrail),
                    ),
                    DropdownMenuItem<String>(
                      value: '3.5',
                      child: Text(AppLocalizations.of(context)!
                          .iDFDAR_11_frailtyAndCognitiveFunction_35_moreThan70YearsOldWithNoHomeSupport),
                    ),
                    DropdownMenuItem<String>(
                      value: '0.0',
                      child: Text(AppLocalizations.of(context)!
                          .iDFDAR_11_frailtyAndCognitiveFunction_00_NoFrailtyOrLossInCognitiveFunction),
                    )
                  ],
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
              const SizedBox(height: 24.0),

              // 12. Activité physique
              MyDropdownButtonFormField(
                  formFieldStateKey: _physicalLabourFormKey,
                  label:
                      '12. ${AppLocalizations.of(context)!.iDFDAR_12_physicalLabour}',
                  value: '0.0',
                  items: <DropdownMenuItem<String>>[
                    DropdownMenuItem(
                      value: '4.0',
                      child: Text(AppLocalizations.of(context)!
                          .iDFDAR_12_physicalLabour_40_HighlyIntensePhysicalLabour),
                    ),
                    DropdownMenuItem(
                      value: '2.0',
                      child: Text(AppLocalizations.of(context)!
                          .iDFDAR_12_physicalLabour_20_ModerateIntensePhysicalLabour),
                    ),
                    DropdownMenuItem(
                      value: '0.0',
                      child: Text(AppLocalizations.of(context)!
                          .iDFDAR_12_physicalLabour_00_NoPhysicalLabour),
                    ),
                  ],
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
              const SizedBox(height: 24.0),

              // 13. Expérience du Ramadan précédent
              MyDropdownButtonFormField(
                  formFieldStateKey: _previousRamadanExperienceFormKey,
                  label:
                      '13. ${AppLocalizations.of(context)!.iDFDAR_13_previousRamadanExperience}',
                  value: '0.0',
                  items: <DropdownMenuItem<String>>[
                    DropdownMenuItem(
                      value: '1.0',
                      child: Text(AppLocalizations.of(context)!
                          .iDFDAR_13_previousRamadanExperience_10_OverallNegativeExperience),
                    ),
                    DropdownMenuItem(
                      value: '0.0',
                      child: Text(AppLocalizations.of(context)!
                          .iDFDAR_13_previousRamadanExperience_00_NoNegativeOrPositiveExperience),
                    ),
                  ],
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
              const SizedBox(height: 24.0),

              // 14. Nombre d'heures de jeûne (selon la localisation géographique)
              MyDropdownButtonFormField(
                  formFieldStateKey: _fastingHoursFormKey,
                  label:
                      '14. ${AppLocalizations.of(context)!.iDFDAR_14_fastingHours}',
                  value: '0.0',
                  items: <DropdownMenuItem<String>>[
                    DropdownMenuItem(
                      value: '1.0',
                      child: Text(AppLocalizations.of(context)!
                          .iDFDAR_14_fastingHours_10_moreOrEgalThan16),
                    ),
                    DropdownMenuItem(
                      value: '0.0',
                      child: Text(AppLocalizations.of(context)!
                          .iDFDAR_14_fastingHours_10_lessThan16),
                    ),
                  ],
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

              Text(AppLocalizations.of(context)!.resetText),
              const SizedBox(height: 24.0),
              MyButton(
                onPressed: reset,
                text: AppLocalizations.of(context)!.reset,
              ),
              const SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }
}
