import '../app.export.dart';

class ApiConstants {
  static const bool apiLog = false;
  static const String PROXY_URL = "PROXY 192.168.225.237:8888";
  static const String apiUrl = baseURL;

  static const String documentUpload = "/api/file-upload";

  static const String apiAuth = "/api/auth/";
  static const String apiAdmin = "/api/admin/";

  static const String getMaster =
      apiUrl + "device/masters/list?code[0]={FilterName}";

  static const String getUser = apiUrl + 'device/candidate/{userId}';

  static const String createdEducation =
      apiUrl + 'device/candidate/{userId}/education';

  static const String createExperince =
      apiUrl + 'device/candidate/{userId}/experience';

  static const String createProject =
      apiUrl + 'device/candidate/{userId}/project';

  static const String createPublication =
      apiUrl + 'device/candidate/{userId}/publication';

  static const String createAchievement =
      apiUrl + 'device/candidate/{userId}/achievement';

  static const String createPatent =
      apiUrl + 'device/candidate/{userId}/patent';

  static const String getEducationById =
      apiUrl + 'device/candidate/{userId}/education/{id}';

  static const String getExperinceById =
      apiUrl + 'device/candidate/{userId}/experience/{id}';

  static const String getProjectById =
      apiUrl + 'device/candidate/{userId}/project/{id}';

  static const String getPublicationById =
      apiUrl + 'device/candidate/{userId}/publication/{id}';

  static const String getAchievementById =
      apiUrl + 'device/candidate/{userId}/achievement/{id}';

  static const String getPatentById =
      apiUrl + 'device/candidate/{userId}/patent/{id}';

  //AUTH
  static const String registration = apiUrl + "device/auth/register";
  static const String verifyOTP = apiAuth + "mobile/otp-verification";
  static const String verify_user = apiUrl + 'device/auth/verify-user';
  static const String resendOTP =
      apiUrl + "device/auth/resend/verification-code";
  static const String login = apiUrl + 'device/auth/login';
  static const String forgotPassword =
      apiUrl + "device/auth/forgot-password/send/otp";
  static const String forgotOTPVerification =
      apiUrl + "device/auth/forgot-password/verify/otp";

  static const String logout = apiUrl + 'device/auth/logout';

  static const String jobRequirement = apiUrl + 'device/requirement/{query}';
  static const String topCities =
      apiUrl + 'device/locations/top/cities?length=1000';

  static const String showRequrement =
      apiUrl + 'device/requirement/{requirementId}';

  static const String requirementList =
      apiUrl + 'device/candidate/{userId}/requirements?{userQuery}';

  static const String changePassword = apiUrl + 'device/user/change-password';

  //PROFILE
  static const String getUserDetails = "/api/customer/user/";
  static const String resetPassword = apiUrl + "device/auth/reset/password";
  static const String updateProfile = "/api/customer/profile-update";

  static const String countryList = apiUrl + 'device/locations/countries/list';

  static const String stateList =
      apiUrl + 'device/locations/states/list?country_id={country_id}&all=1';

  static const String cityList =
      apiUrl + 'device/locations/cities/list?state_id={state_id}&all=1';

  static const String linkedInLogin = apiUrl + 'auth/linkedin';
}
