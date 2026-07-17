//---Load Shit---//
load_options();
scr_LoadControls();
scr_LoadFiles();
//scr_LoadJuke();
scr_LoadCustomMusic();

//---Crash Bullshit---//
/*exception_unhandled_handler(function(_except) {
	var _file = file_text_open_write(working_directory + "crash_logs/Crash" + string(global.saveFile) + "_" + string(global.PlayerName) + "_M" + string(current_month) + "_D" + string(current_day) + "_Y" + string(current_year) + "_H" + string(current_hour) + "_MI" + string(current_minute) + "_S" + string(current_second) + ".txt");
	
	file_text_write_string(_file, _except.long_message);
	file_text_writeln(_file);
	file_text_write_string(_file, string(_except.stack_trace));
	file_text_close(_file);
})