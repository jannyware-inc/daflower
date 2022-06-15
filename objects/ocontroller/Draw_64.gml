/// Draw our stats
draw_set_color(c_yellow); draw_set_font(ftArial);
draw_set_halign(fa_left); draw_set_valign(fa_top);

draw_text(5, 5, "FPS: " + string(fps_real));
draw_text(5, 5, "\n" + "Hold left mouse button down to move the player");
draw_text(5, 5, "\n\n" + "Press <SPACE> to check the connection status");
draw_text(5, 5, "\n\n\n" + "Ping: " + string(ping) + "ms");