#version 140 core
//#version 300 core
//#version 430 core

layout(location = 0) in vec4 position;
layout(location = 1) in vec4 color;
layout(location = 2) uniform mat4 model;
layout(location = 3) uniform mat4 view;
layout(location = 4) uniform mat4 projection;
out vec4 outColor;

void main(void){
    outColor = color;
    //gl_Position = projection * view * model * position;
    gl_Position = position;

}

