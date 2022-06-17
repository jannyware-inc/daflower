init = true;
var track_pos = audio_sound_get_track_position(sound_id);
if(track_pos >= intro+loop_length){
	audio_sound_set_track_position(sound_id, track_pos - loop_length);
}