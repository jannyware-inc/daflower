

if abs(arm1angle) >= 15{
    dir1 *= -1;
}

if abs(arm2angle) >= 15{
    dir2 *= -1;
}


arm1angle += sign(dir1)*0.5;

arm2angle += sign(dir2)*0.5;

if xvel == 0{
    image_index = 0;   
}



image_index += 0.25;
animCount++;