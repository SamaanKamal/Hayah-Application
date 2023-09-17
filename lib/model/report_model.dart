class ReportModel {
  ReportModel({
    required this.BloodUrea,
    this.BloodID = "",
    required this.DoctorCode,
    required this.HBA1c,
    required this.HBsAntigen,
    required this.HCVAbLgG,
    required this.HIVAntibody,
    required this.Hemoglobin,
    required this.MCH,
    required this.MCHC,
    required this.MCV,
    required this.PlateletCount,
    required this.RedBloodCellCount,
    required this.ReportDate,
    required this.ReportID,
    required this.SGOTASAT,
    required this.SGPTALT,
    required this.SerumCreatinine,
    required this.SerumUricAcid,
    required this.VDRL,
    required this.reason,
    required this.status,
  });

  var BloodUrea;
  String? BloodID;
  var DoctorCode;
  var HBA1c;
  String? HBsAntigen;
  String? HCVAbLgG;
  String? HIVAntibody;
  var Hemoglobin;
  var MCH;
  var MCHC;
  var MCV;
  var PlateletCount;
  var RedBloodCellCount;
  String? ReportDate;
  var ReportID;
  var SGOTASAT;
  var SGPTALT;
  var SerumCreatinine;
  var SerumUricAcid;
  String? VDRL;
  String? reason;
  String? status;

  ReportModel.fromJson(Map<String, dynamic> json) {
    BloodUrea = json['BloodUrea'];
    BloodID = null;
    DoctorCode = json['Doctor_Code'];
    HBA1c = json['HBA1c'];
    HBsAntigen = json['HBs_Antigen'];
    HCVAbLgG = json['HCV_Ab_lgG'];
    HIVAntibody = json['HIV_Antibody'];
    Hemoglobin = json['Hemoglobin'];
    MCH = json['MCH'];
    MCHC = json['MCHC'];
    MCV = json['MCV'];
    PlateletCount = json['PlateletCount'];
    RedBloodCellCount = json['RedBloodCellCount'];
    ReportDate = json['ReportDate'];
    ReportID = json['ReportID'];
    SGOTASAT = json['SGOT_ASAT'];
    SGPTALT = json['SGPT_ALT'];
    SerumCreatinine = json['SerumCreatinine'];
    SerumUricAcid = json['SerumUricAcid'];
    VDRL = json['VDRL'];
    reason = json['reason'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['BloodUrea'] = BloodUrea;
    _data['Blood_ID'] = BloodID;
    _data['Doctor_Code'] = DoctorCode;
    _data['HBA1c'] = HBA1c;
    _data['HBs_Antigen'] = HBsAntigen;
    _data['HCV_Ab_lgG'] = HCVAbLgG;
    _data['HIV_Antibody'] = HIVAntibody;
    _data['Hemoglobin'] = Hemoglobin;
    _data['MCH'] = MCH;
    _data['MCHC'] = MCHC;
    _data['MCV'] = MCV;
    _data['PlateletCount'] = PlateletCount;
    _data['RedBloodCellCount'] = RedBloodCellCount;
    _data['ReportDate'] = ReportDate;
    _data['ReportID'] = ReportID;
    _data['SGOT_ASAT'] = SGOTASAT;
    _data['SGPT_ALT'] = SGPTALT;
    _data['SerumCreatinine'] = SerumCreatinine;
    _data['SerumUricAcid'] = SerumUricAcid;
    _data['VDRL'] = VDRL;
    _data['reason'] = reason;
    _data['status'] = status;
    return _data;
  }
}
