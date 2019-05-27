stem_size = [1.20, 3.00, 5.00];
stem_offset = [2.85, 0, stem_size[2] / 2];

translate(stem_offset)
    cube(stem_size, true);
translate([-1 * stem_offset[0], stem_offset[1], stem_offset[2]])
    cube(stem_size, true);

original_top = [22.00, 22.00];
original_bottom = [24.00, 24.00];
original_height = 11.00;

module keycap_outer_shape(ratio) {
    cap_top = [original_top[0] * ratio, original_top[1] * ratio, 0.01];
    cap_bottom = [original_bottom[0] * ratio, original_bottom[1] * ratio, 0.01];
    cap_height = original_height * ratio;
    
    hull() {
        translate([0, 0, cap_height])
            cube(cap_top, true);
        cube(cap_bottom, true);
    }
}

ratio = 18.50 / original_bottom[0];
keycap_outer_shape(ratio);