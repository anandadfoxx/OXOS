int main() {
  char* video_memory = (char*)0xb8000;
  const char* helloStr = "Hello World from Kernel!";

  for (int i = 0; i < 24; i++) {
    video_memory[i*2] = helloStr[i];
    video_memory[i*2+1] = 0x07;
  }
}