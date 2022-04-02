#include "ftxui/component/captured_mouse.hpp"      // for ftxui
#include "ftxui/component/component.hpp"           // for Slider
#include "ftxui/component/screen_interactive.hpp"  // for ScreenInteractive

using namespace ftxui;

auto main(int argc, const char* argv[]) -> int {
  auto screen = ScreenInteractive::TerminalOutput();
  int value = 50;
  auto slider = Slider("Value:", &value, 0, 100, 1);
  screen.Loop(slider);
}