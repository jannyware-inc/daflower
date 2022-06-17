count += 4;


//Fade in
if count < 225{
    alpha = (count/225);
    slide = slides.slide1;
}
//Fade out
if count > 550 {
    alpha = 1 - (count-550)/225;   
}

if count > 1000{
    alpha = (count-1000)/225; 
    slide = slides.slide2;
}
if count > 1550{
    alpha = 1- (count-1550)/225;   
}

if count > 2000{
    alpha = (count-2000)/225;
    slide = slides.slide3;   
}

if count > 2550{
    alpha = 1 - (count-2550)/225;
}

if count > 3000 {
    alpha = (count-3000)/225;
    slide = slides.slide4;
}

if count > 3550{
    alpha = 1- (count-3550)/225;   
}
if count > 4000{
    alpha = (count-4000)/225;
    slide = slides.slide5;
}
if count > 4550 {
   alpha = 1- (count-4550)/225;
}

switch(slide){
    case slides.slide1:
    image_index = 0;
        break;
    case slides.slide2:
    image_index = 1;
        break;
    case slides.slide3:
    image_index = 2;
        break;
    case slides.slide4:
    image_index = 3;
        break;
    case slides.slide5:
    image_index = 4;
        break;
}

if count >= sequence_length{
    room_goto(Room4);   
}