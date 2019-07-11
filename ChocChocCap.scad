$fs = 0.10;

stem_size = [1.25, 2.98, 3.50 + 2.00];
stem_buffer = 1.05;
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

choc_stems();