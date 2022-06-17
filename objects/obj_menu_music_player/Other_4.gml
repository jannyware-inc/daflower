if(room != Menu && room != mp_lobby && room != RoomMainMenu){
	audio_stop_sound(sound_id);
	instance_destroy();
}
if(room == RoomMainMenu && init){
	audio_stop_sound(sound_id);
	instance_destroy();
}