if charID != noone && room != rm_NameMakerNew {
	#region //Shader Shit
		shader_set(shd_PaletteSwap);
			var _target = shader_get_sampler_index(shd_PaletteSwap, "samp_target");
			var _replace = shader_get_sampler_index(shd_PaletteSwap, "samp_replace");
			
			texture_set_stage(_target, sprite_get_texture(charID.basePal, 0));
			texture_set_stage(_replace, sprite_get_texture(charID.headPal, 0))
			
			draw_self();
		shader_reset();
	#endregion
} else {
	draw_self();
}