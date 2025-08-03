#version 320 es

precision mediump float;

in vec2 v_texcoord;
out vec4 FragColor;

uniform sampler2D tex;

vec3 linearToSRGB(vec3 linear) {
    return mix(
        linear * 12.92,
        pow(linear, vec3(1.0/2.4)) * 1.055 - 0.055,
        step(0.0031308, linear)
    );
}

vec3 sRGBToLinear(vec3 srgb) {
    return mix(
        srgb / 12.92,
        pow((srgb + 0.055) / 1.055, vec3(2.4)),
        step(0.04045, srgb)
    );
}

vec3 clampToSRGBGamut(vec3 color) {
    // Convert to linear space for proper color calculations
    vec3 linear = sRGBToLinear(color);
    
    // Clamp to valid range and ensure proper sRGB primaries
    linear = clamp(linear, 0.0, 1.0);
    
    // Convert back to sRGB gamma space
    return linearToSRGB(linear);
}

vec3 enhanceSRGBColors(vec3 color) {
    vec3 linear = sRGBToLinear(color);
    
    // Calculate luminance
    float luma = dot(linear, vec3(0.2126, 0.7152, 0.0722));
    
    // Enhance saturation slightly for better sRGB appearance
    vec3 saturated = mix(vec3(luma), linear, 1.1);
    
    // Ensure we don't exceed gamut
    saturated = clamp(saturated, 0.0, 1.0);
    
    return linearToSRGB(saturated);
}

void main() {
    vec4 pixColor = texture(tex, v_texcoord);
    vec3 color = pixColor.rgb;
    
    // Apply sRGB processing
    color = clampToSRGBGamut(color);
    color = enhanceSRGBColors(color);
    
    // Set brightness to 70%
    color *= 0.7;
    
    FragColor = vec4(color, pixColor.a);
}