class Form16Response {
  QuaterlyTotal? quaterlyTotal;
  String? panDeductor;
  String? tanDeductor;
  String? panEmployee;
  String? assessmentYear;
  String? salaryAsPerProvisionsContainedInSection171;
  String? fromPattern;
  String? toMatch;
  String? certificateNo;
  String? employeeNameMatch;
  String? lastUpdatedOn;
  String? designationPatternMatch;
  String? employerNameAddress;
  List<String>? quarterlyData;
  String? houseRentAllowance;
  String? totalAmountOfAnyOtherExemptionUnderSection10;
  String? totalAmountOfExemptionClaimedUnderSection10;
  String? totalAmountOfSalaryReceivedFromCurrentEmployer;
  String? entertainmentAllowance;
  String? taxOnEmploymentUnderSection16;
  String? totalAmountOfDeductionsUnderSection164abc;
  String? incomeChargeableUnderTheHeadSalaries3;
  String? incomeUnderTheHeadOtherSourcesOfferedForTds;
  String? incomeOrAdmissibleLossFromHousePropertyReportedByEmpOfferedForTds;
  String? totalAmountOfOtherIncomeReportedByTheEmployee7a7b;
  String? grossTotalIncome68;
  String? standardDeduction;
  String? aggregateOfDeductibleAmountUnderChapterViA;
  String? totalTaxableIncome911;
  String? taxOnTotalIncome;
  String? healthAndEducationCess;
  String? taxPayable13151614;
  String? lessReliefUnderSection89AttachDetails;
  String? netTaxPayable1718;
  String? rebateUnderSection87aIfApplicable;
  String? surchargeWhereverApplicable;
  String? valueOfPerquisite;
  String? profitsInLieu;
  String? grossTotal;
  String? reportedTotalAmountOfSalar;
  String? travelConcession;
  String? deathCumRetirementGratuity;
  String? certificateMatchPatternPartB;
  String? successMessage;
  String? partBCheck;
  String? partACheck;
  int? tenure;
  Point10AToH? point10AToH;
  Point10IToL? point10IToL;

  Form16Response(
      {this.quaterlyTotal,
        this.panDeductor,
        this.tanDeductor,
        this.panEmployee,
        this.assessmentYear,
        this.salaryAsPerProvisionsContainedInSection171,
        this.fromPattern,
        this.toMatch,
        this.certificateNo,
        this.employeeNameMatch,
        this.lastUpdatedOn,
        this.designationPatternMatch,
        this.employerNameAddress,
        this.quarterlyData,
        this.houseRentAllowance,
        this.totalAmountOfAnyOtherExemptionUnderSection10,
        this.totalAmountOfExemptionClaimedUnderSection10,
        this.totalAmountOfSalaryReceivedFromCurrentEmployer,
        this.entertainmentAllowance,
        this.taxOnEmploymentUnderSection16,
        this.totalAmountOfDeductionsUnderSection164abc,
        this.incomeChargeableUnderTheHeadSalaries3,
        this.incomeUnderTheHeadOtherSourcesOfferedForTds,
        this.incomeOrAdmissibleLossFromHousePropertyReportedByEmpOfferedForTds,
        this.totalAmountOfOtherIncomeReportedByTheEmployee7a7b,
        this.grossTotalIncome68,
        this.standardDeduction,
        this.aggregateOfDeductibleAmountUnderChapterViA,
        this.totalTaxableIncome911,
        this.taxOnTotalIncome,
        this.healthAndEducationCess,
        this.taxPayable13151614,
        this.lessReliefUnderSection89AttachDetails,
        this.netTaxPayable1718,
        this.rebateUnderSection87aIfApplicable,
        this.surchargeWhereverApplicable,
        this.valueOfPerquisite,
        this.profitsInLieu,
        this.grossTotal,
        this.reportedTotalAmountOfSalar,
        this.travelConcession,
        this.deathCumRetirementGratuity,
        this.certificateMatchPatternPartB,
        this.successMessage,
        this.partBCheck,
        this.partACheck,
        this.tenure,
        this.point10AToH,
        this.point10IToL});

  Form16Response.fromJson(Map<String, dynamic> json) {
    quaterlyTotal = json['quaterly_total'] != null
        ? QuaterlyTotal.fromJson(json['quaterly_total'])
        : null;
    panDeductor = json['pan_deductor'];
    tanDeductor = json['tan_deductor'];
    panEmployee = json['pan_employee'];
    assessmentYear = json['assessment_year'];
    salaryAsPerProvisionsContainedInSection171 =
    json['salary_as_per_provisions_contained_in_section_17_1'];
    fromPattern = json['from_pattern'];
    toMatch = json['to_match'];
    certificateNo = json['certificate_no'];
    employeeNameMatch = json['employee_name_match'];
    lastUpdatedOn = json['last_updated_on'];
    designationPatternMatch = json['designation_pattern_match'];
    employerNameAddress = json['employer_name_address'];
    quarterlyData = json['QuarterlyData'].cast<String>();
    houseRentAllowance = json['house_rent_allowance'];
    totalAmountOfAnyOtherExemptionUnderSection10 =
    json['total_amount_of_any_other_exemption_under_section_10'];
    totalAmountOfExemptionClaimedUnderSection10 =
    json['total_amount_of_exemption_claimed_under_section_10'];
    totalAmountOfSalaryReceivedFromCurrentEmployer =
    json['total_amount_of_salary_received_from_current_employer'];
    entertainmentAllowance = json['entertainment_allowance'];
    taxOnEmploymentUnderSection16 = json['tax_on_employment_under_section_16'];
    totalAmountOfDeductionsUnderSection164abc =
    json['total_amount_of_deductions_under_section_16_4abc'];
    incomeChargeableUnderTheHeadSalaries3 =
    json['income_chargeable_under_the_head_Salaries_3'];
    incomeUnderTheHeadOtherSourcesOfferedForTds =
    json['income_under_the_head_other_sources_offered_for_tds'];
    incomeOrAdmissibleLossFromHousePropertyReportedByEmpOfferedForTds = json[
    'income_or_admissible_loss_from_house_property_reported_by_emp_offered_for_tds'];
    totalAmountOfOtherIncomeReportedByTheEmployee7a7b =
    json['total_amount_of_other_income_reported_by_the_employee_7a_7b'];
    grossTotalIncome68 = json['gross_total_income_6_8'];
    standardDeduction = json['standard_deduction'];
    aggregateOfDeductibleAmountUnderChapterViA =
    json['aggregate_of_deductible_amount_under_chapter_vi_a'];
    totalTaxableIncome911 = json['total_taxable_income_9_11'];
    taxOnTotalIncome = json['tax_on_total_income'];
    healthAndEducationCess = json['health_and_education_cess'];
    taxPayable13151614 = json['tax_payable_13_15_16_14'];
    lessReliefUnderSection89AttachDetails =
    json['less_relief_under_section_89_attach_details'];
    netTaxPayable1718 = json['net_tax_payable_17_18'];
    rebateUnderSection87aIfApplicable =
    json['rebate_under_section_87a_if_applicable'];
    surchargeWhereverApplicable = json['surcharge_wherever_applicable'];
    valueOfPerquisite = json['value_of_perquisite'];
    profitsInLieu = json['profits_in_lieu'];
    grossTotal = json['gross_total'];
    reportedTotalAmountOfSalar = json['reported_total_amount_of_salar'];
    travelConcession = json['travel_concession'];
    deathCumRetirementGratuity = json['death_cum_retirement_gratuity'];
    certificateMatchPatternPartB = json['certificate_match_pattern_part_b'];
    successMessage = json['success_message'];
    partBCheck = json['part_b_check'];
    partACheck = json['part_a_check'];
    tenure = json['tenure'];
    point10AToH = json['point10_a_to_h'] != null
        ? Point10AToH.fromJson(json['point10_a_to_h'])
        : null;
    point10IToL = json['point10_i_to_l'] != null
        ? Point10IToL.fromJson(json['point10_i_to_l'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (quaterlyTotal != null) {
      data['quaterly_total'] = quaterlyTotal!.toJson();
    }
    data['pan_deductor'] = panDeductor;
    data['tan_deductor'] = tanDeductor;
    data['pan_employee'] = panEmployee;
    data['assessment_year'] = assessmentYear;
    data['salary_as_per_provisions_contained_in_section_17_1'] =
        salaryAsPerProvisionsContainedInSection171;
    data['from_pattern'] = fromPattern;
    data['to_match'] = toMatch;
    data['certificate_no'] = certificateNo;
    data['employee_name_match'] = employeeNameMatch;
    data['last_updated_on'] = lastUpdatedOn;
    data['designation_pattern_match'] = designationPatternMatch;
    data['employer_name_address'] = employerNameAddress;
    data['QuarterlyData'] = quarterlyData;
    data['house_rent_allowance'] = houseRentAllowance;
    data['total_amount_of_any_other_exemption_under_section_10'] =
        totalAmountOfAnyOtherExemptionUnderSection10;
    data['total_amount_of_exemption_claimed_under_section_10'] =
        totalAmountOfExemptionClaimedUnderSection10;
    data['total_amount_of_salary_received_from_current_employer'] =
        totalAmountOfSalaryReceivedFromCurrentEmployer;
    data['entertainment_allowance'] = entertainmentAllowance;
    data['tax_on_employment_under_section_16'] =
        taxOnEmploymentUnderSection16;
    data['total_amount_of_deductions_under_section_16_4abc'] =
        totalAmountOfDeductionsUnderSection164abc;
    data['income_chargeable_under_the_head_Salaries_3'] =
        incomeChargeableUnderTheHeadSalaries3;
    data['income_under_the_head_other_sources_offered_for_tds'] =
        incomeUnderTheHeadOtherSourcesOfferedForTds;
    data['income_or_admissible_loss_from_house_property_reported_by_emp_offered_for_tds'] =
        incomeOrAdmissibleLossFromHousePropertyReportedByEmpOfferedForTds;
    data['total_amount_of_other_income_reported_by_the_employee_7a_7b'] =
        totalAmountOfOtherIncomeReportedByTheEmployee7a7b;
    data['gross_total_income_6_8'] = grossTotalIncome68;
    data['standard_deduction'] = standardDeduction;
    data['aggregate_of_deductible_amount_under_chapter_vi_a'] =
        aggregateOfDeductibleAmountUnderChapterViA;
    data['total_taxable_income_9_11'] = totalTaxableIncome911;
    data['tax_on_total_income'] = taxOnTotalIncome;
    data['health_and_education_cess'] = healthAndEducationCess;
    data['tax_payable_13_15_16_14'] = taxPayable13151614;
    data['less_relief_under_section_89_attach_details'] =
        lessReliefUnderSection89AttachDetails;
    data['net_tax_payable_17_18'] = netTaxPayable1718;
    data['rebate_under_section_87a_if_applicable'] =
        rebateUnderSection87aIfApplicable;
    data['surcharge_wherever_applicable'] = surchargeWhereverApplicable;
    data['value_of_perquisite'] = valueOfPerquisite;
    data['profits_in_lieu'] = profitsInLieu;
    data['gross_total'] = grossTotal;
    data['reported_total_amount_of_salar'] = reportedTotalAmountOfSalar;
    data['travel_concession'] = travelConcession;
    data['death_cum_retirement_gratuity'] = deathCumRetirementGratuity;
    data['certificate_match_pattern_part_b'] =
        certificateMatchPatternPartB;
    data['success_message'] = successMessage;
    data['part_b_check'] = partBCheck;
    data['part_a_check'] = partACheck;
    data['tenure'] = tenure;
    if (point10AToH != null) {
      data['point10_a_to_h'] = point10AToH!.toJson();
    }
    if (point10IToL != null) {
      data['point10_i_to_l'] = point10IToL!.toJson();
    }
    return data;
  }
}

class QuaterlyTotal {
  String? amountPaidCredited;
  String? amountOfTaxDeducted;
  String? amountOfTaxDepositedRemitted;

  QuaterlyTotal(
      {this.amountPaidCredited,
        this.amountOfTaxDeducted,
        this.amountOfTaxDepositedRemitted});

  QuaterlyTotal.fromJson(Map<String, dynamic> json) {
    amountPaidCredited = json['amount_paid_credited'];
    amountOfTaxDeducted = json['amount_of_tax_deducted'];
    amountOfTaxDepositedRemitted = json['Amount_of_tax_deposited_remitted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount_paid_credited'] = amountPaidCredited;
    data['amount_of_tax_deducted'] = amountOfTaxDeducted;
    data['Amount_of_tax_deposited_remitted'] =
        amountOfTaxDepositedRemitted;
    return data;
  }
}

class Point10AToH {
  DeductionInRespectOfLifeInsurancePremiaContributionsTo?
  deductionInRespectOfLifeInsurancePremiaContributionsTo;
  DeductionInRespectOfLifeInsurancePremiaContributionsTo? underSection80CCC;
  DeductionInRespectOfLifeInsurancePremiaContributionsTo?
  schemeUnderSection80CCD1;
  DeductionInRespectOfLifeInsurancePremiaContributionsTo?
  totalDeductionUnderSection80C80CCCAnd80CCD1;
  DeductionInRespectOfLifeInsurancePremiaContributionsTo?
  pensionSchemeUnderSection80CCD1B;
  DeductionInRespectOfLifeInsurancePremiaContributionsTo?
  schemeUnderSection80CCD2;
  DeductionInRespectOfLifeInsurancePremiaContributionsTo?
  deductionInRespectOfHealthInsurancePremiaUnderSection;
  DeductionInRespectOfLifeInsurancePremiaContributionsTo?
  educationUnderSection80E;

  Point10AToH(
      {this.deductionInRespectOfLifeInsurancePremiaContributionsTo,
        this.underSection80CCC,
        this.schemeUnderSection80CCD1,
        this.totalDeductionUnderSection80C80CCCAnd80CCD1,
        this.pensionSchemeUnderSection80CCD1B,
        this.schemeUnderSection80CCD2,
        this.deductionInRespectOfHealthInsurancePremiaUnderSection,
        this.educationUnderSection80E});

  Point10AToH.fromJson(Map<String, dynamic> json) {
    deductionInRespectOfLifeInsurancePremiaContributionsTo = json[
    'Deduction in respect of life insurance premia, contributions to'] !=
        null
        ? DeductionInRespectOfLifeInsurancePremiaContributionsTo.fromJson(json[
    'Deduction in respect of life insurance premia, contributions to'])
        : null;
    underSection80CCC = json['under section 80CCC'] != null
        ? DeductionInRespectOfLifeInsurancePremiaContributionsTo.fromJson(
        json['under section 80CCC'])
        : null;
    schemeUnderSection80CCD1 = json['scheme under section 80CCD (1)'] != null
        ? DeductionInRespectOfLifeInsurancePremiaContributionsTo.fromJson(
        json['scheme under section 80CCD (1)'])
        : null;
    totalDeductionUnderSection80C80CCCAnd80CCD1 = json[
    'Total deduction under section 80C, 80CCC and 80CCD(1)'] !=
        null
        ? DeductionInRespectOfLifeInsurancePremiaContributionsTo.fromJson(
        json['Total deduction under section 80C, 80CCC and 80CCD(1)'])
        : null;
    pensionSchemeUnderSection80CCD1B =
    json['pension scheme under section 80CCD (1B)'] != null
        ? DeductionInRespectOfLifeInsurancePremiaContributionsTo
        .fromJson(json['pension scheme under section 80CCD (1B)'])
        : null;
    schemeUnderSection80CCD2 = json['scheme under section 80CCD (2)'] != null
        ? DeductionInRespectOfLifeInsurancePremiaContributionsTo.fromJson(
        json['scheme under section 80CCD (2)'])
        : null;
    deductionInRespectOfHealthInsurancePremiaUnderSection = json[
    'Deduction in respect of health insurance premia under section'] !=
        null
        ? DeductionInRespectOfLifeInsurancePremiaContributionsTo.fromJson(
        json[
        'Deduction in respect of health insurance premia under section'])
        : null;
    educationUnderSection80E = json['education under section 80E'] != null
        ? DeductionInRespectOfLifeInsurancePremiaContributionsTo.fromJson(
        json['education under section 80E'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (deductionInRespectOfLifeInsurancePremiaContributionsTo != null) {
      data['Deduction in respect of life insurance premia, contributions to'] =
          deductionInRespectOfLifeInsurancePremiaContributionsTo!.toJson();
    }
    if (underSection80CCC != null) {
      data['under section 80CCC'] = underSection80CCC!.toJson();
    }
    if (schemeUnderSection80CCD1 != null) {
      data['scheme under section 80CCD (1)'] =
          schemeUnderSection80CCD1!.toJson();
    }
    if (totalDeductionUnderSection80C80CCCAnd80CCD1 != null) {
      data['Total deduction under section 80C, 80CCC and 80CCD(1)'] =
          totalDeductionUnderSection80C80CCCAnd80CCD1!.toJson();
    }
    if (pensionSchemeUnderSection80CCD1B != null) {
      data['pension scheme under section 80CCD (1B)'] =
          pensionSchemeUnderSection80CCD1B!.toJson();
    }
    if (schemeUnderSection80CCD2 != null) {
      data['scheme under section 80CCD (2)'] =
          schemeUnderSection80CCD2!.toJson();
    }
    if (deductionInRespectOfHealthInsurancePremiaUnderSection != null) {
      data['Deduction in respect of health insurance premia under section'] =
          deductionInRespectOfHealthInsurancePremiaUnderSection!.toJson();
    }
    if (educationUnderSection80E != null) {
      data['education under section 80E'] =
          educationUnderSection80E!.toJson();
    }
    return data;
  }
}

class DeductionInRespectOfLifeInsurancePremiaContributionsTo {
  int? grossAmount;
  int? deductibleAmount;

  DeductionInRespectOfLifeInsurancePremiaContributionsTo(
      {this.grossAmount, this.deductibleAmount});

  DeductionInRespectOfLifeInsurancePremiaContributionsTo.fromJson(
      Map<String, dynamic> json) {
    grossAmount = json['gross_amount'];
    deductibleAmount = json['deductible_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gross_amount'] = grossAmount;
    data['deductible_amount'] = deductibleAmount;
    return data;
  }
}

class Point10IToL {
  TotalDeductionInRespectOfDonationsToCertainFunds?
  totalDeductionInRespectOfDonationsToCertainFunds;
  TotalDeductionInRespectOfDonationsToCertainFunds? underSection80TTA;
  TotalDeductionInRespectOfDonationsToCertainFunds? chapterVIA;

  Point10IToL(
      {this.totalDeductionInRespectOfDonationsToCertainFunds,
        this.underSection80TTA,
        this.chapterVIA});

  Point10IToL.fromJson(Map<String, dynamic> json) {
    totalDeductionInRespectOfDonationsToCertainFunds = json[
    'Total Deduction in respect of donations to certain funds,'] !=
        null
        ? TotalDeductionInRespectOfDonationsToCertainFunds.fromJson(
        json['Total Deduction in respect of donations to certain funds,'])
        : null;
    underSection80TTA = json['under section 80TTA'] != null
        ? TotalDeductionInRespectOfDonationsToCertainFunds.fromJson(
        json['under section 80TTA'])
        : null;
    chapterVIA = json['Chapter VI-A'] != null
        ? TotalDeductionInRespectOfDonationsToCertainFunds.fromJson(
        json['Chapter VI-A'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (totalDeductionInRespectOfDonationsToCertainFunds != null) {
      data['Total Deduction in respect of donations to certain funds,'] =
          totalDeductionInRespectOfDonationsToCertainFunds!.toJson();
    }
    if (underSection80TTA != null) {
      data['under section 80TTA'] = underSection80TTA!.toJson();
    }
    if (chapterVIA != null) {
      data['Chapter VI-A'] = chapterVIA!.toJson();
    }
    return data;
  }
}

class TotalDeductionInRespectOfDonationsToCertainFunds {
  String? grossAmount;
  String? qualifyingAmount;
  String? deductibleAmount;

  TotalDeductionInRespectOfDonationsToCertainFunds(
      {this.grossAmount, this.qualifyingAmount, this.deductibleAmount});

  TotalDeductionInRespectOfDonationsToCertainFunds.fromJson(
      Map<String, dynamic> json) {
    grossAmount = json['gross_amount'];
    qualifyingAmount = json['qualifying_amount'];
    deductibleAmount = json['deductible_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gross_amount'] = grossAmount;
    data['qualifying_amount'] = qualifyingAmount;
    data['deductible_amount'] = deductibleAmount;
    return data;
  }
}
