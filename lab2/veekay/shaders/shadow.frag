#version 460

layout(location = 0) out float outDepth;

void main() {
    // Записываем глубину
    //outDepth = gl_FragCoord.z;
    
    // Или для отладки можно записать паттерн:
    // ivec2 coord = ivec2(gl_FragCoord.xy);
    // if ((coord.x / 16 + coord.y / 16) % 2 == 0) {
    //     outDepth = 0.3;
    // } else {
    //     outDepth = 0.7;
    // }
}