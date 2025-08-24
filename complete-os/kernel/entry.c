void print(const char* str) {
    char* video_memory = (char*)0xb8000;
    for (int i = 0; i < 24; i++) {
        video_memory[i*2] = str[i];
        video_memory[i*2+1] = 0x0f;
    }
}

extern void main() {
  print("Hello, World!\n");
}