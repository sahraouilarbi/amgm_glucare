// 1. Type de diabète
final Map<String, String> diabetesTypeValues = {
  'Type 1': '1.0',
  'Type 2': '0.0',
};
// 2. Durée du diabète
final Map<String, String> durationOfDiabetesValues = {
  'Durée >= 10 ans': '1.0',
  'Durée < 10 ans': '0.0',
};
// 3. Hypoglycémie
final Map<String, String> hypoglycaemiaValues = {
  'Hypoglycémie non ressentie': '6.5',
  'Hypoglycémie sévère récente': '5.5',
  'Hypoglycémie hebdomadaire récurrente': '3.5',
  'Hypoglycémie > 1 fois par semaine': '1.0',
  'Pas d\'hypoglycémie': '0.0',
};
// 4. Contrôle glycémique
final Map<String, String> glycemicControlValues = {
  'HbA1c > 9% (11.7mmol/L)': '2.0',
  'HbA1c 7.5-9% (9.4-11.7mmol/L)': '1.0',
  'HbA1c < 7.5% (9.4mmol/L)': '0.0'
};
// 5. Traitement du diabète
final Map<String, String> typeOfTreatmentValues = {
  'Injections quotidiennes multiples d\'insuline': '3.0',
  'Bolus basal / pompe à insuline': '2.5',
  'Insuline mixte, 1 fois/jour': '2.0',
  'Insuline basale': '1.5',
  'Glibenclamide': '1.0',
  'Gliclazide/à libération modifiée ou répaglinide ou glimépiride': '0.5',
  'Autre traitement ne comportant pas de sufonylurée ou d\'insuline': '0.0'
};
// 6. ASG
final Map<String, String> smbgValues = {
  'indiqué mais pas réalisée': '2.0',
  'Indiquée mais réalisée de façon sous-optimale': '1.0',
  'Réalisée comme indiquée': '0.0'
};
// 7. Complications sévères
final Map<String, String> acuteComplicationsValues = {
  'ACD/SHH dans les 3 derniers mois': '3.0',
  'ACD/SHH dans les 6 derniers mois': '2.0',
  'ACD/SHH dans les 12 derniers mois': '1.0',
  'Pas d\'ACD ou SHH': '0.0'
};
// 8. Complications macrovasculaires/comorbidités
final Map<String, String> mvdComplicationsValues = {
  'Instable': '6.5',
  'Stable': '2.0',
  'Pas de complications': '0.0'
};
// 9. Complications rénales/comorbidités
final Map<String, String> renalComplicationsValues = {
  'eGFR <30mL/min': '6.5',
  'eGFR 30-45mL/min': '4.0',
  'eGFR 45-60mL/min': '2.0',
  'eGFR >60mL/min': '0.0'
};
// 10. Grossesse
final Map<String, String> pregnancyValues = {
  'Enceinte pas dans les objectifs cibles': '6.5',
  'Enceinte à l\'objectif cible': '3.5',
  'Pas enceinte': '0.0'
};
// 11. Fragilité et fonction cognitive
final Map<String, String> frailtyAndCognitiveFunctionValues = {
  'Alteration des fonctions cognitives et fragilité': '6.5',
  '> 70ans sans assistance à domicile': '3.5',
  'Pas de fragilité ou déclin des fonctions cognitives': '0.0'
};
// 12. Activité physique
final Map<String, String> physicalLabourValues = {
  'Activité physique extrême': '4.0',
  'Activité physique modérée': '2.0',
  'Pas d\'activité physique': '0.0'
};
// 13. Expérience du Ramadan précédent
final Map<String, String> previousRamadanExperienceValues = {
  'Expérience négative': '1.0',
  'Pas d\'expérience négative / expérience positive': '0.0'
};
// 14. Nombre d'heures de jeûne (selon la localisation géographique)
final Map<String, String> fastingHoursValues = {
  '>= 16 heures': '1.0',
  '< 16 heures': '0.0'
};
