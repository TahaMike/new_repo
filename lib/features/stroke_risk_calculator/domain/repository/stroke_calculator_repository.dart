abstract class StrokeCalculatorRepository {
  dynamic calculateStroke(
    bool congestiveHeartFailure,
    bool hyperTension,
    int age,
    bool diabetesMellitus,
    bool strokeHistory,
    bool vascularDiasease,
    bool sexCategory,
    int score,
  );
}

// | Parameter                       | Points | Criteria/Definition                                                         |
// | ------------------------------- | ------ | --------------------------------------------------------------------------- |
// | C - Congestive Heart Failure    | 1      | History of CHF or LV dysfunction                                            |
// | H - Hypertension                | 1      | History of HTN (treated or untreated)                                       |
// | A₂ - Age ≥ 75 years             | 2      | Age ≥ 75 gets 2 points                                                      |
// | D - Diabetes Mellitus           | 1      | Diagnosed diabetes                                                          |
// | S₂ - Stroke/TIA/Thromboembolism | 2      | Prior stroke, TIA, or systemic embolism                                     |
// | V - Vascular Disease            | 1      | MI, PAD, aortic plaque                                                      |
// | A - Age 65–74 years             | 1      | If not ≥75, but ≥65                                                         |
// | Sc - Sex Category (Female)      | 1      | Assigned 1 point **only if other risks are present** (not 0 baseline score) |

// all parameter must be boolean if true score is incremented as per the table
