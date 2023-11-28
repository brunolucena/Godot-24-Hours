shader_type spatial;
render_mode cull_disabled;

void vertex() {
	VERTEX.z *= sin(TIME);
}

void fragment() {
	// Place fragment code here.
}
