if(fetch_timeup == 0){
	http_get("https://jannycorp.net:5005/sunflower/topscores?low=0&high=10");
}
if(fetch_timeup >= fetch_max){
	fetch_timeup = 0;
	return;
}
fetch_timeup++;