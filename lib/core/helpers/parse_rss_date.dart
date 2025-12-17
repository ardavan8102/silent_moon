DateTime? parseRSSpubDate(String raw){

  try {

    return DateTime.parse(raw);

  } catch (_) {

    return null;
    
  }

}