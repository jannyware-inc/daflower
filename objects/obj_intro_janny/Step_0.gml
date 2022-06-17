switch(state){
	case card_states.blank:
		if(state_timeup >= slidesarray[card_index].blank_frames){
			state = card_states.fade_in;
			state_timeup = 0;
		} else {
			image_alpha = 0;
			state_timeup++;
		}
		break;
	case card_states.fade_in:
		if(state_timeup >= slidesarray[card_index].fade_in_frames){
			state = card_states.display;
			state_timeup = 0;
		} else {
			image_alpha = lerp(0, 1, state_timeup/slidesarray[card_index].fade_in_frames);
			state_timeup++;
		}
		break;
	case card_states.display:
		if(state_timeup >= slidesarray[card_index].display_frames){
			state = card_states.fade_out;
			state_timeup = 0;
		} else {
			image_alpha = 1;
			state_timeup++;
		}
		break;
	case card_states.fade_out:
		if(state_timeup >= slidesarray[card_index].fade_out_frames){
			state = card_states.blank;
			state_timeup = 0;
			if(card_index == array_length(slidesarray)-1){
				room_goto(RoomMainMenu);
			} else {
				//Increment to next card
				card_index++;
			}
		} else {
			image_alpha = lerp(1, 0, state_timeup/slidesarray[card_index].fade_out_frames);
			state_timeup++;
		}
		break;
}