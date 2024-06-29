class EmailUtils {
  static String normalizeEmail(String email) {
    final emailParts = email.split('@');
    final localPart = emailParts[0].toLowerCase().replaceAll('.', '');
    final domainPart = emailParts[1];
    final normalizedLocalPart = localPart.split('+')[0];
    final normalizedEmail = '$normalizedLocalPart@$domainPart';
    return normalizedEmail;
  }
}
