scr_GetCharBoostIcon();

sprite_index = iconSprite;

scale = random_range(0.5, 1);

depth = obj_Player.depth + 1;

image_angle = random_range(-3, 3);

image_speed = random_range(0.5, 2);

movedX = random_range(-6, 6);
movedY = random_range(-6, 6);

drawX = 0;
drawY = 0;

createTimer = 15;