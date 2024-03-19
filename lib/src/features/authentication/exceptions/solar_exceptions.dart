class SolarSenseExceptions implements Exception {
  final String message;

  const SolarSenseExceptions([this.message = "An unknown error occurred."]);

  factory SolarSenseExceptions.fromCode(String code) {
    switch (code) {
      case "email-already-in-use":
        return const SolarSenseExceptions(
            "An account already exists for that email.");
      case "invalid-email":
        return const SolarSenseExceptions(
            "Email is not valid or badly formatted.");
      case "user-disabled":
        return const SolarSenseExceptions(
            "This user has been disabled. Please contact support for help.");
      case "user-not-found":
        return const SolarSenseExceptions(
            "No user found for this email. Please register.");
      case "wrong-password":
        return const SolarSenseExceptions("Invalid password.");
      case "too-many-requests":
        return const SolarSenseExceptions(
            "Too many requests. Please try again later.");
      case "invalid-argument":
        return const SolarSenseExceptions(
            "Invalid argument. Please try again later.");
      case "invalid-password":
        return const SolarSenseExceptions(
            "Invalid password. Please try again later.");
      case "invalid-phone-number":
        return const SolarSenseExceptions(
            "The provided phone number is not valid.");
      case "operation-not-allowed":
        return const SolarSenseExceptions(
            "operation is not allowed. Please contact support.");
      case "session-cookie-expired":
        return const SolarSenseExceptions(
            "The session cookie has expired. Please log in again.");
      case "uid-already-exists":
        return const SolarSenseExceptions(
            "The user with the provided uid already exists.");
      case "phone-number-already-exists":
        return const SolarSenseExceptions(
            "The user with the provided phone number already exists.");
      default:
        return const SolarSenseExceptions();
    }
  }
}
