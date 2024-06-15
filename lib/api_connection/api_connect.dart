class API{
  static const hostConnect="http://192.168.43.225/api_clothes_store";
  static const hostConnectUser = "$hostConnect/user";
  static const hostConnectAdmin= "$hostConnect/admin";
  static const hostUploadItem="$hostConnect/items";
  static const hostClothes = "$hostConnect/clothes";
  static const hostCart = "$hostConnect/cart";

  static const signUp = "$hostConnectUser/signup.php";
  static const validateEmail = "$hostConnectUser/validate_email.php";
  static const login="$hostConnectUser/login.php";
  static const adminLogin="$hostConnectAdmin/adminlogin.php";
  static const uploadNewItem="$hostUploadItem/upload.php";


  static const getTrendingMostPopularClothes = "$hostClothes/trending.php";
  static const getallClothes = "$hostClothes/all.php";
  static const addTocart="$hostCart/add.php";
  static const getcartList="$hostCart/read.php";
  static const deleteSelectedItemCartList = "$hostCart/delete.php";
  static const updateItemInCartList = "$hostCart/update.php";

}