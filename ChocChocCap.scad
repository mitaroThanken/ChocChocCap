$fs = 0.10;

stem_size = [1.20, 3.00, 3.00 + 2.00];
stem_offset = [5.70 / 2, 0, stem_size[2] / 2];

translate(stem_offset)
    cube(stem_size, true);
translate([-1 * stem_offset[0], stem_offset[1], stem_offset[2]])
    cube(stem_size, true);

original_top = [22.00, 22.00];
original_bottom = [24.00, 24.00];
original_height = 11.00;

top_sphere_d = 1.25;

module keycap_shape_mod_height(ratio, height) {
    square_width = original_top[0] * ratio - top_sphere_d * 2;
    square_depth = original_top[1] * ratio - top_sphere_d * 2; 
    cap_top_square = [square_width, square_depth, top_sphere_d];

    cap_bottom = [original_bottom[0] * ratio, original_bottom[1] * ratio, 0.01];
    
    hull() {
        translate([-0.5 * square_width, -0.5 * square_depth, height - top_sphere_d * 2])
            minkowski() {
                cube(cap_top_square);
                sphere(top_sphere_d);
            }
        cube(cap_bottom, true);
    }
}

module keycap_shape(ratio) {
    cap_height = original_height * ratio;
    keycap_shape_mod_height(ratio, cap_height);
}

outer_ratio = 18.50 / original_bottom[0];
inner_ratio = 14.50 / original_top[0];

difference() {
    keycap_shape(outer_ratio);
    translate([0, 0, -0.01])
        keycap_shape_mod_height(inner_ratio, stem_size[2] - 2.00);
}
