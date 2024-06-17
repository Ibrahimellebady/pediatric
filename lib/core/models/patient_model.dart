class PatientModel {
  //required with adding
  String? userId;
  String? patientId;
  String? name;
  String? diagnosis;

// personal history
  String? patientPicUrl;
  String? address;
  String? guardingPhone;
  String? sex;
  String? normalAge;
  String? correctiveAge;
  String? physician;

  // past natal history
  String? pregnancyPeriod;
  bool? isPregnancyDifficult;
  bool? isVitaminDeficiency;
  String? vitaminDeficiency;
  bool? isMotherSurgery;
  String? motherSurgery;
  String? deliveryMethode;
  bool? isDeliveryDifficult;
  bool? isChildSurgery;
  String? childSurgery;
  bool? isHospitalized;
  String? hospitalizationCause;
  bool? isJaundice;
  bool? isIncubated;

  // past and continued history
  bool? isDigestiveProblem;
  bool? isStomachPain;
  bool? isDiarrhea;
  bool? isConstipation;
  bool? isSwallowingProblem;
  bool? isVomitingProblem;

  bool? isRespiratoryProblem;
  String? respiratoryProblemDetails;
  bool? isBloodProblem;
  String? bloodProblemDetails;
  bool? isKidneyProblem;
  String? kidneyProblemDetails;
  bool? isLiverProblem;
  String? liverProblemDetails;
  bool? isMetabolicProblem;
  String? metabolicProblemDetails;
  bool? isCardiacProblem;
  String? cardiacProblemDetails;

  // present history

  String? height;
  String? weight;
  String? headCircumference;
  String? armCircumference;
  String? medication;

  // clinical picture
  bool? isInvoluntaryMovement;
  String? involuntaryMovementType;

  bool? isEpileptic;

  bool? isOrthosis;
  String? orthosisType;

  bool? isCerebralPalsy;
  String? cerebralPalsyType;

  bool? isBrachialInjury;
  String? brachialPlexusType;

  bool? isSpinaBifida;
  String? spinaBifidaType;

  bool? isMyopathy;
  String? myopathyType;

  bool? isNeuropathy;

  bool? isDownSyndrome;
  bool? isHydrocephalus;
  bool? isMicrocephalus;
  bool? isMeningitis;
  bool? isTorticollis;
  bool? isFascialPalsy;
  bool? isAmputee;
  String? amputatedLimbs;
  bool? isDDH;

  // posture deformities & gait
  bool? isGaitDisorder;
  String?
      gaitDisorderDetails; // [sissoring, weddling, crouch, jumping, hopping...]

  bool? posturalDisorder;
  bool? isScoliosis;
  String? scoliosisSide;
  bool? isKyphosis;
  bool? isGenuValgus;
  bool? isGenuVarus;
  bool? isFootDeformity;
  String? footDeformityDetails;

  // other comorbidity

  bool? isGrowthProblem;
  String? growthProblemDetails; // [dentition, bone, height, wright, ]

  bool? isInjury;
  String? injuryDetails; // [Head, strain, sprains]

  bool? isSkinProblem;
  bool? isBurned;

  bool? isFineMotorProblem;
  bool? isSensoryProblem;
  bool? isHearingProblem;
  bool? isVisionProblem;

  bool? isCognitiveProblem;
  bool? isBehavioralProblem;

  bool? isGrossMotorProblem;
  String? motorFunctionGrade;

  // Milestone
  bool? isDelayedMilestone;
  bool? canHeadControl;
  String? whenHeadControl;
  bool? canSitControl;
  String? whenSitControl;
  bool? canRollFromSupine;
  String? whenRollFromSupine;
  bool? canRollFromProne;
  String? whenRollFromProne;
  bool? canCreeping;
  String? whenCreeping;
  bool? canCrawling;
  String? whenCrawling;
  bool? canStand;
  String? whenStand;
  bool? canWalk;
  String? whenWalk;

  // date
  String? assessmentDate;

  //

  bool? isHypotonia;
  bool? isHypertonia;

  // Constructor
  PatientModel({
    this.userId,
    this.patientId,
    this.name,
    this.diagnosis,
    this.patientPicUrl,
    this.address,
    this.guardingPhone,
    this.sex,
    this.normalAge,
    this.correctiveAge,
    this.physician,
    this.pregnancyPeriod,
    this.isPregnancyDifficult,
    this.isVitaminDeficiency,
    this.vitaminDeficiency,
    this.isMotherSurgery,
    this.motherSurgery,
    this.deliveryMethode,
    this.isDeliveryDifficult,
    this.isChildSurgery,
    this.childSurgery,
    this.isHospitalized,
    this.hospitalizationCause,
    this.isJaundice,
    this.isIncubated,
    this.isDigestiveProblem,
    this.isStomachPain,
    this.isDiarrhea,
    this.isConstipation,
    this.isSwallowingProblem,
    this.isVomitingProblem,
    this.isRespiratoryProblem,
    this.respiratoryProblemDetails,
    this.isBloodProblem,
    this.bloodProblemDetails,
    this.isKidneyProblem,
    this.kidneyProblemDetails,
    this.isLiverProblem,
    this.liverProblemDetails,
    this.isMetabolicProblem,
    this.metabolicProblemDetails,
    this.isCardiacProblem,
    this.cardiacProblemDetails,
    this.height,
    this.weight,
    this.headCircumference,
    this.armCircumference,
    this.medication,
    this.isInvoluntaryMovement,
    this.involuntaryMovementType,
    this.isEpileptic,
    this.isOrthosis,
    this.orthosisType,
    this.isCerebralPalsy,
    this.cerebralPalsyType,
    this.isBrachialInjury,
    this.brachialPlexusType,
    this.isSpinaBifida,
    this.spinaBifidaType,
    this.isMyopathy,
    this.myopathyType,
    this.isNeuropathy,
    this.isDownSyndrome,
    this.isHydrocephalus,
    this.isMicrocephalus,
    this.isMeningitis,
    this.isTorticollis,
    this.isFascialPalsy,
    this.isAmputee,
    this.amputatedLimbs,
    this.isDDH,
    this.isGaitDisorder,
    this.gaitDisorderDetails,
    this.posturalDisorder,
    this.isScoliosis,
    this.scoliosisSide,
    this.isKyphosis,
    this.isGenuValgus,
    this.isGenuVarus,
    this.isFootDeformity,
    this.footDeformityDetails,
    this.isGrowthProblem,
    this.growthProblemDetails,
    this.isInjury,
    this.injuryDetails,
    this.isSkinProblem,
    this.isBurned,
    this.isFineMotorProblem,
    this.isSensoryProblem,
    this.isHearingProblem,
    this.isVisionProblem,
    this.isCognitiveProblem,
    this.isBehavioralProblem,
    this.isGrossMotorProblem,
    this.motorFunctionGrade,
    this.isDelayedMilestone,
    this.canHeadControl,
    this.whenHeadControl,
    this.canSitControl,
    this.whenSitControl,
    this.canRollFromSupine,
    this.whenRollFromSupine,
    this.canRollFromProne,
    this.whenRollFromProne,
    this.canCreeping,
    this.whenCreeping,
    this.canCrawling,
    this.whenCrawling,
    this.canStand,
    this.whenStand,
    this.canWalk,
    this.whenWalk,
    this.assessmentDate,
    this.isHypotonia,
    this.isHypertonia,
  });

  //

  PatientModel.fromJson({required Map<String, dynamic> data}) {
    userId = data['userId'];
    patientId = data['patientId'];
    name = data['name'];
    diagnosis = data['diagnosis'];
    patientPicUrl = data['patientPicUrl'];
    address = data['address'];
    guardingPhone = data['guardingPhone'];
    sex = data['sex'];
    normalAge = data['normalAge'];
    correctiveAge = data['correctiveAge'];
    physician = data['physician'];

    pregnancyPeriod = data['pregnancyPeriod'];
    isPregnancyDifficult = _parseBool(data['isPregnancyDifficult']);
    isVitaminDeficiency = _parseBool(data['isVitaminDeficiency']);
    vitaminDeficiency = data['vitaminDeficiency'];
    isMotherSurgery = _parseBool(data['isMotherSurgery']);
    motherSurgery = data['motherSurgery'];
    deliveryMethode = data['deliveryMethode'];
    isDeliveryDifficult = _parseBool(data['isDeliveryDifficult']);
    isChildSurgery = _parseBool(data['isChildSurgery']);
    childSurgery = data['childSurgery'];
    isHospitalized = _parseBool(data['isHospitalized']);
    hospitalizationCause = data['hospitalizationCause'];
    isJaundice = _parseBool(data['isJaundice']);
    isIncubated = _parseBool(data['isIncubated']);

    isDigestiveProblem = _parseBool(data['isDigestiveProblem']);
    isStomachPain = _parseBool(data['isStomachPain']);
    isDiarrhea = _parseBool(data['isDiarrhea']);
    isConstipation = _parseBool(data['isConstipation']);
    isSwallowingProblem = _parseBool(data['isSwallowingProblem']);
    isVomitingProblem = _parseBool(data['isVomitingProblem']);
    isRespiratoryProblem = _parseBool(data['isRespiratoryProblem']);
    respiratoryProblemDetails = data['respiratoryProblemDetails'];
    isBloodProblem = _parseBool(data['isBloodProblem']);
    bloodProblemDetails = data['bloodProblemDetails'];
    isKidneyProblem = _parseBool(data['isKidneyProblem']);
    kidneyProblemDetails = data['kidneyProblemDetails'];
    isLiverProblem = _parseBool(data['isLiverProblem']);
    liverProblemDetails = data['liverProblemDetails'];
    isMetabolicProblem = _parseBool(data['isMetabolicProblem']);
    metabolicProblemDetails = data['metabolicProblemDetails'];
    isCardiacProblem = _parseBool(data['isCardiacProblem']);
    cardiacProblemDetails = data['cardiacProblemDetails'];

    height = data['height'];
    weight = data['weight'];
    headCircumference = data['headCircumference'];
    armCircumference = data['armCircumference'];
    medication = data['medication'];

    isInvoluntaryMovement = _parseBool(data['isInvoluntaryMovement']);
    involuntaryMovementType = data['involuntaryMovementType'];
    isEpileptic = _parseBool(data['isEpileptic']);
    isOrthosis = _parseBool(data['isOrthosis']);
    orthosisType = data['orthosisType'];
    isCerebralPalsy = _parseBool(data['isCerebralPalsy']);
    cerebralPalsyType = data['cerebralPalsyType'];
    isBrachialInjury = _parseBool(data['isBrachialInjury']);
    brachialPlexusType = data['brachialPlexusType'];
    isSpinaBifida = _parseBool(data['isSpinaBifida']);
    spinaBifidaType = data['spinaBifidaType'];
    isMyopathy = _parseBool(data['isMyopathy']);
    myopathyType = data['myopathyType'];
    isNeuropathy = _parseBool(data['isNeuropathy']);
    isDownSyndrome = _parseBool(data['isDownSyndrome']);
    isHydrocephalus = _parseBool(data['isHydrocephalus']);
    isMicrocephalus = _parseBool(data['isMicrocephalus']);
    isMeningitis = _parseBool(data['isMeningitis']);
    isTorticollis = _parseBool(data['isTorticollis']);
    isFascialPalsy = _parseBool(data['isFascialPalsy']);
    isAmputee = _parseBool(data['isAmputee']);
    amputatedLimbs = data['amputatedLimbs'];
    isDDH = _parseBool(data['isDDH']);

    isGaitDisorder = _parseBool(data['isGaitDisorder']);
    gaitDisorderDetails = data['gaitDisorderDetails'];
    posturalDisorder = _parseBool(data['posturalDisorder']);
    isScoliosis = _parseBool(data['isScoliosis']);
    scoliosisSide = data['scoliosisSide'];
    isKyphosis = _parseBool(data['isKyphosis']);
    isGenuValgus = _parseBool(data['isGenuValgus']);
    isGenuVarus = _parseBool(data['isGenuVarus']);
    isFootDeformity = _parseBool(data['isFootDeformity']);
    footDeformityDetails = data['footDeformityDetails'];

    isGrowthProblem = _parseBool(data['isGrowthProblem']);
    growthProblemDetails = data['growthProblemDetails'];
    isInjury = _parseBool(data['isInjury']);
    injuryDetails = data['injuryDetails'];
    isSkinProblem = _parseBool(data['isSkinProblem']);
    isBurned = _parseBool(data['isBurned']);
    isFineMotorProblem = _parseBool(data['isFineMotorProblem']);
    isSensoryProblem = _parseBool(data['isSensoryProblem']);
    isHearingProblem = _parseBool(data['isHearingProblem']);
    isVisionProblem = _parseBool(data['isVisionProblem']);
    isCognitiveProblem = _parseBool(data['isCognitiveProblem']);
    isBehavioralProblem = _parseBool(data['isBehavioralProblem']);
    isGrossMotorProblem = _parseBool(data['isGrossMotorProblem']);
    motorFunctionGrade = data['motorFunctionGrade'];

    isDelayedMilestone = _parseBool(data['isDelayedMilestone']);
    canHeadControl = _parseBool(data['canHeadControl']);
    whenHeadControl = data['whenHeadControl'];
    canSitControl = _parseBool(data['canSitControl']);
    whenSitControl = data['whenSitControl'];
    canRollFromSupine = _parseBool(data['canRollFromSupine']);
    whenRollFromSupine = data['whenRollFromSupine'];
    canRollFromProne = _parseBool(data['canRollFromProne']);
    whenRollFromProne = data['whenRollFromProne'];
    canCreeping = _parseBool(data['canCreeping']);
    whenCreeping = data['whenCreeping'];
    canCrawling = _parseBool(data['canCrawling']);
    whenCrawling = data['whenCrawling'];
    canStand = _parseBool(data['canStand']);
    whenStand = data['whenStand'];
    canWalk = _parseBool(data['canWalk']);
    whenWalk = data['whenWalk'];

    assessmentDate = data['assessmentDate'];

    isHypotonia = _parseBool(data['isHypotonia']);
    isHypertonia = _parseBool(data['isHypertonia']);
  }

  //
  bool? _parseBool(dynamic value) {
    if (value is bool) {
      return value;
    } else if (value is String) {
      return value.toLowerCase() == 'true';
    } else if (value is int) {
      return value == 1;
    } else {
      return null;
    }
  }

//

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'patientId': patientId,
      'name': name,
      'diagnosis': diagnosis,
//
      'patientPicUrl': patientPicUrl,
      'address': address,
      'guardingPhone': guardingPhone,
      'sex': sex,
      'normalAge': normalAge,
      'correctiveAge': correctiveAge,
      'physician': physician,
//
      'pregnancyPeriod': pregnancyPeriod,
      'isPregnancyDifficult': isPregnancyDifficult,
      'isVitaminDeficiency': isVitaminDeficiency,
      'vitaminDeficiency': vitaminDeficiency,
      'isMotherSurgery': isMotherSurgery,
      'motherSurgery': motherSurgery,
      'deliveryMethode': deliveryMethode,
      'isDeliveryDifficult': isDeliveryDifficult,
      'isChildSurgery': isChildSurgery,
      'childSurgery': childSurgery,
      'isHospitalized': isHospitalized,
      'hospitalizationCause': hospitalizationCause,
      'isJaundice': isJaundice,
      'isIncubated': isIncubated,
//
      'isDigestiveProblem': isDigestiveProblem,
      'isStomachPain': isStomachPain,
      'isDiarrhea': isDiarrhea,
      'isConstipation': isConstipation,
      'isSwallowingProblem': isSwallowingProblem,
      'isVomitingProblem': isVomitingProblem,
      'isRespiratoryProblem': isRespiratoryProblem,
      'respiratoryProblemDetails': respiratoryProblemDetails,
      'isBloodProblem': isBloodProblem,
      'bloodProblemDetails': bloodProblemDetails,
      'isKidneyProblem': isKidneyProblem,
      'kidneyProblemDetails': kidneyProblemDetails,
      'isLiverProblem': isLiverProblem,
      'liverProblemDetails': liverProblemDetails,
      'isMetabolicProblem': isMetabolicProblem,
      'metabolicProblemDetails': metabolicProblemDetails,
      'isCardiacProblem': isCardiacProblem,
      'cardiacProblemDetails': cardiacProblemDetails,
//
      'height': height,
      'weight': weight,
      'headCircumference': headCircumference,
      'armCircumference': armCircumference,
      'medication': medication,
//
      'isInvoluntaryMovement': isInvoluntaryMovement,
      'involuntaryMovementType': involuntaryMovementType,
      'isEpileptic': isEpileptic,
      'isOrthosis': isOrthosis,
      'orthosisType': orthosisType,
      'isCerebralPalsy': isCerebralPalsy,
      'cerebralPalsyType': cerebralPalsyType,
      'isBrachialInjury': isBrachialInjury,
      'brachialPlexusType': brachialPlexusType,
      'isSpinaBifida': isSpinaBifida,
      'spinaBifidaType': spinaBifidaType,
      'isMyopathy': isMyopathy,
      'myopathyType': myopathyType,
      'isNeuropathy': isNeuropathy,
      'isDownSyndrome': isDownSyndrome,
      'isHydrocephalus': isHydrocephalus,
      'isMicrocephalus': isMicrocephalus,
      'isMeningitis': isMeningitis,
      'isTorticollis': isTorticollis,
      'isFascialPalsy': isFascialPalsy,
      'isAmputee': isAmputee,
      'amputatedLimbs': amputatedLimbs,
      'isDDH': isDDH,
//
      'isGaitDisorder': isGaitDisorder,
      'gaitDisorderDetails': gaitDisorderDetails,
      'posturalDisorder': posturalDisorder,
      'isScoliosis': isScoliosis,
      'scoliosisSide': scoliosisSide,
      'isKyphosis': isKyphosis,
      'isGenuValgus': isGenuValgus,
      'isGenuVarus': isGenuVarus,
      'isFootDeformity': isFootDeformity,
      'footDeformityDetails': footDeformityDetails,
//
      'isGrowthProblem': isGrowthProblem,
      'growthProblemDetails': growthProblemDetails,
      'isInjury': isInjury,
      'injuryDetails': injuryDetails,
      'isSkinProblem': isSkinProblem,
      'isBurned': isBurned,
      'isFineMotorProblem': isFineMotorProblem,
      'isSensoryProblem': isSensoryProblem,
      'isHearingProblem': isHearingProblem,
      'isVisionProblem': isVisionProblem,
      'isCognitiveProblem': isCognitiveProblem,
      'isBehavioralProblem': isBehavioralProblem,
      'isGrossMotorProblem': isGrossMotorProblem,
      'motorFunctionGrade': motorFunctionGrade,
//
      'isDelayedMilestone': isDelayedMilestone,
      'canHeadControl': canHeadControl,
      'whenHeadControl': whenHeadControl,
      'canSitControl': canSitControl,
      'whenSitControl': whenSitControl,
      'canRollFromSupine': canRollFromSupine,
      'whenRollFromSupine': whenRollFromSupine,
      'canRollFromProne': canRollFromProne,
      'whenRollFromProne': whenRollFromProne,
      'canCreeping': canCreeping,
      'whenCreeping': whenCreeping,
      'canCrawling': canCrawling,
      'whenCrawling': whenCrawling,
      'canStand': canStand,
      'whenStand': whenStand,
      'canWalk': canWalk,
      'whenWalk': whenWalk,
//
      'assessmentDate': assessmentDate,
//
      'isHypotonia': isHypotonia,
      'isHypertonia': isHypertonia,
    };
  }
}
