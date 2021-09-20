bool containLetter(String? val) {
  var value = val!.toLowerCase();

  if (
      value.contains("a") || 
      value.contains("b") || 
      value.contains("c") ||
      value.contains("ç") ||
      value.contains("d") ||
      value.contains("e") ||
      value.contains("f") ||
      value.contains("g") ||
      value.contains("h") ||
      value.contains("i") ||
      value.contains("j") ||
      value.contains("k") ||
      value.contains("l") ||
      value.contains("m") ||
      value.contains("n") ||
      value.contains("o") ||
      value.contains("p") ||
      value.contains("q") ||
      value.contains("r") ||
      value.contains("s") ||
      value.contains("t") ||
      value.contains("u") ||
      value.contains("v") ||
      value.contains("w") ||
      value.contains("x") ||
      value.contains("y") ||
      value.contains("z") 
      ) {
    return true;
  } else {
    return false;
  }
}
bool containNumber(String? val){
  var value = val!.toLowerCase();
  if(
    value.contains("1") ||
    value.contains("2") ||
    value.contains("3") ||
    value.contains("4") ||
    value.contains("5") ||
    value.contains("6") ||
    value.contains("7") ||
    value.contains("8") ||
    value.contains("9") ||
    value.contains("0") 
  ){
    return true;
  }else{
    return false;
  }
}

