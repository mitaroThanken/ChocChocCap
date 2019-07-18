$fs = 0.10;
$fa = 0.25;

stem_size = [1.25, 2.98, 3.50 + 2.00];
stem_buffer = 1.2;
stem_diff = [stem_size[0], stem_size[1] / 2.10, stem_size[2] + 1.00];
stem_offset = [5.70 / 2, 0, stem_size[2] / 2];

module stem_one_side() {
    difference() {
        cube(stem_size * stem_buffer, true);
        translate([stem_size[0] *  1 * (2.8 / 3.0), 0, 0])
            cube(stem_diff * stem_buffer, true);
        translate([stem_size[0] * -1 * (2.8 / 3.0), 0, 0])
            cube(stem_diff * stem_buffer, true);
    }
}

module choc_stems() {
    translate(stem_offset)
        stem_one_side();
    translate([-1 * stem_offset[0], stem_offset[1], stem_offset[2]])
        stem_one_side();
}

original_top = [22.00, 22.00];
original_bottom = [24.00, 24.00];
original_height = 11.00;

top_sphere_d = 1.25;
bottom_sphere_d = 0.50;

module keycap_shape_mod_height(ratio, height) {
    top_square_width = original_top[0] * ratio - top_sphere_d * 2;
    top_square_depth = original_top[1] * ratio - top_sphere_d * 2;
    cap_top_square = [top_square_width, top_square_depth, top_sphere_d];

    bottom_square_width = original_bottom[0] * ratio - bottom_sphere_d * 2;
    bottom_square_depth = original_bottom[1] * ratio - bottom_sphere_d * 2;
    cap_bottom_square = [bottom_square_width, bottom_square_depth, bottom_sphere_d];
    
    hull() {
        translate([-0.5 * top_square_width, -0.5 * top_square_depth, height - top_sphere_d * 2])
            minkowski() {
                cube(cap_top_square);
                sphere(top_sphere_d);
            }
        translate([-0.5 * bottom_square_width, -0.5 * bottom_square_depth, bottom_sphere_d])
            minkowski() {
                cube(cap_bottom_square);
                sphere(bottom_sphere_d);
            }
    }
}

module keycap_shape(ratio) {
    cap_height = original_height * ratio;
    keycap_shape_mod_height(ratio, cap_height);
}

module ChocChocCap() {
    outer_ratio = 18.50 / original_bottom[0];
    inner_ratio = 15.00 / original_top[0];

    choc_stems();

    difference() {
        keycap_shape_mod_height(outer_ratio, stem_size[2] - 2.00 + 12.00);
        translate([0, 0, -1 * bottom_sphere_d])
            keycap_shape_mod_height(inner_ratio, stem_size[2] - 2.00);
    }
}

function dish_r(w, d) = (w * w + 4 * d * d) / (8 * d);

difference() {
    ChocChocCap();
    translate([0, 0, 15])
        rotate([90, 0, 0])
            cylinder(r = dish_r(5, 15), h = 60, center = true);
};
/*
difference() {
    ChocChocCap()
    translate([0, 0, 12])
      rotate([- 10, 0, 0])
        translate([0, 0, dish_r(15, 10) - 10])
          rotate([90, 0, 0])
            cylinder(r = dish_r(10, 10), h = 60, /* 適当に十分な長さ / center = true);
}
*/