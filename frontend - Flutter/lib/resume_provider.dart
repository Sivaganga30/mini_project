import 'package:flutter/foundation.dart';

class ResumeProvider extends ChangeNotifier {
  // Private variables for personal information
  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _phoneNumber = '';
  String _linkedin = '';
  String _github = '';

  // Private variables for resume content
  String _achievements = '';
  String _professionalSummary = '';
  String _selectedTemplate = '';

  // Getters for personal information
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get email => _email;
  String get phoneNumber => _phoneNumber;
  String get linkedin => _linkedin;
  String get github => _github;

  // Getters for resume content
  String get achievements => _achievements;
  String get professionalSummary => _professionalSummary;
  String get selectedTemplate => _selectedTemplate;

  // Setters for personal information with notifyListeners
  void updateFirstName(String value) {
    _firstName = value;
    notifyListeners();
  }

  void updateLastName(String value) {
    _lastName = value;
    notifyListeners();
  }

  void updateEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void updatePhoneNumber(String value) {
    _phoneNumber = value;
    notifyListeners();
  }

  void updateLinkedin(String value) {
    _linkedin = value;
    notifyListeners();
  }

  void updateGithub(String value) {
    _github = value;
    notifyListeners();
  }

  // Setters for resume content with notifyListeners
  void updateAchievements(String value) {
    _achievements = value;
    notifyListeners();
  }

  void updateProfessionalSummary(String value) {
    _professionalSummary = value;
    notifyListeners();
  }

   void updateSelectedTemplate(String template) {
    _selectedTemplate = template;
    notifyListeners();
  }
}
