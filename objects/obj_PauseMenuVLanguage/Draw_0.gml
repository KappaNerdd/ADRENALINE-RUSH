draw_self();

draw_text(x + 80, y + 4, "LANGUAGE");

var _language = "";

if global.Language == 2 {
	_language = "ESPAÑOL";
} else {
	_language = "ENGLISH";
}

draw_text(x + 200, y + 4, _language);