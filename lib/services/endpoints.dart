//var BASE_URL = "http://192.168.0.101:9000/api";
//var BASE_URL = "https://digistoreapi-production.up.railway.app/api";
var BASE_URL = "https://lojisglocceryatoreapi.herokuapp.com/api";

//auth
var auth="$BASE_URL/auth";
var signin="$auth/signin";
var signup="$auth/signup";
//user
var user="$BASE_URL/users";

//categories
var category = "$BASE_URL/categories";
var createCategory="$category/create";
var allCategory="$category/all";
//reviews
var reviews ="$BASE_URL/reviews";

//product
var product="$BASE_URL/products";
var allProducts="$product/all";
var productReviews="$reviews/product/all/";
var productByCategory="${product}/category";

//wishlist
var wishlist="$BASE_URL/wishlist";
