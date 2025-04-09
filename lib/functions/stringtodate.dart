DateTime? convertStringToDate(String dateString) {
  try {
    DateTime dateTime = DateTime.parse(dateString);
    return dateTime;
  } catch (e) {
    // print("Invalid date format: $dateString");
    return null; // Return null or any other default value in case of an error
  }
}
