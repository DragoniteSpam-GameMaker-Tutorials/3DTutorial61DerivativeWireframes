function scr_draw_all_the_stuff() {
    gpu_set_tex_repeat(true);
    
    // Everything must be drawn after the 3D projection has been set
    //vertex_submit(ground, pr_trianglelist, sprite_get_texture(spr_grass, 0));
    
    gpu_set_tex_repeat(false);
    
    matrix_set(matrix_world, matrix_build(250, 250, 40, 0, 0, 0, 1, 1, 1));
    vertex_submit(keyboard_check(vk_shift) ? vb_merry_barycentric : vb_merry, pr_trianglelist, -1);
    
    matrix_set(matrix_world, matrix_build(250, 300, 0, 0, 0, 0, 1, 1, 1));
    vertex_submit(keyboard_check(vk_shift) ? vb_sphere_barycentric : vb_sphere, pr_trianglelist, -1);
    matrix_set(matrix_world, matrix_build(250, 350, 0, 0, 0, 0, 1, 1, 1));
    vertex_submit(keyboard_check(vk_shift) ? vb_sphere_barycentric : vb_sphere, pr_trianglelist, -1);
    matrix_set(matrix_world, matrix_build(250, 400, 0, 0, 0, 0, 1, 1, 1));
    vertex_submit(keyboard_check(vk_shift) ? vb_sphere_barycentric : vb_sphere, pr_trianglelist, -1);
    
    if (keyboard_check(vk_shift)) {
        for (var i = 0, n = array_length(tree_positions); i < n; i++) {
            matrix_set(matrix_world, matrix_build(tree_positions[i].x, tree_positions[i].y, 0, 0, 0, 0, 1, 1, 1));
            vertex_submit(tree_positions[i].vbuff_bary, pr_trianglelist, -1);
        }
    } else {
        for (var i = 0, n = array_length(tree_positions); i < n; i++) {
            matrix_set(matrix_world, matrix_build(tree_positions[i].x, tree_positions[i].y, 0, 0, 0, 0, 1, 1, 1));
            vertex_submit(tree_positions[i].vbuff, pr_trianglelist, -1);
        }
    }
    
    matrix_set(matrix_world, matrix_build_identity());
    
    shader_reset();
}