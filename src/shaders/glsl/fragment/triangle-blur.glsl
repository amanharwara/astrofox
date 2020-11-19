#define ITERATIONS 10.0

uniform sampler2D inputBuffer;
uniform vec2 delta;

varying vec2 vUv;

#include "../func/random.glsl"

void main() {
    vec4 color = vec4(0.0);
    float total = 0.0;
    float offset = random(vUv);

    for (float t = -ITERATIONS; t <= ITERATIONS; t ++) {
        float percent = (t + offset - 0.5) / ITERATIONS;
        float weight = 1.0 - abs(percent);

        color += texture2D(inputBuffer, vUv + delta * percent) * weight;
        total += weight;
    }

    gl_FragColor = color / total;
}