/* Generated by :claw at 2023-11-19T11:30:04.295186Z */

#include <stddef.h>
#if defined(__cplusplus)
#include <new>
#endif

#define RAYGUI_IMPLEMENTATION 1

#include "raygui.h"


#if !defined(__CLAW_API)
#  if defined(_WIN32)
#    define __CLAW_API __declspec(dllexport)
#  elif defined(__GNUC__)
#    define __CLAW_API __attribute__((visibility("default")))
#  else
#    define __CLAW_API
#  endif
#endif

#ifdef _WIN32
#  include <windows.h>
static HMODULE ___claw_module;

static int ___claw_init_wrapper() {
  ___claw_module = GetModuleHandle(NULL);
  return ___claw_module != NULL;
}

static void ___claw_close_wrapper(void) {
}
#else
#  include <dlfcn.h>
static void* ___claw_module;

static int ___claw_init_wrapper() {
  ___claw_module = dlopen(NULL, RTLD_NOW | RTLD_GLOBAL);
  return ___claw_module != NULL;
}

static void ___claw_close_wrapper(void) {
}
#endif

static void* claw_get_proc_addr(const char *name) {
  if(___claw_module == NULL) {
    return NULL;
  }

#ifdef _WIN32
  return (void*) GetProcAddress(___claw_module, name);
#else
  return dlsym(___claw_module, name);
#endif
}

#if defined(__cplusplus)
extern "C" {
#endif

typedef int (*GuiToggleGroup_t)(Rectangle,const char*,int*);
typedef int (*GuiComboBox_t)(Rectangle,const char*,int*);
typedef int (*GuiColorBarHue_t)(Rectangle,const char*,float*);
typedef int (*GuiColorPanelHSV_t)(Rectangle,const char*,Vector3*);
typedef int (*GuiColorBarAlpha_t)(Rectangle,const char*,float*);
typedef int (*GuiListView_t)(Rectangle,const char*,int*,int*);
typedef Font (*cE3AE40FE40GuiGetFont_t)();
typedef int (*GuiGrid_t)(Rectangle,const char*,float,int,Vector2*);
typedef int (*GuiLine_t)(Rectangle,const char*);
typedef int (*GuiCheckBox_t)(Rectangle,const char*,bool*);
typedef int (*GuiSliderBar_t)(Rectangle,const char*,const char*,float*,float,float);
typedef int (*GuiSlider_t)(Rectangle,const char*,const char*,float*,float,float);
typedef void (*GuiDrawIcon_t)(int,int,int,int,Color);
typedef int (*GuiGroupBox_t)(Rectangle,const char*);
typedef int (*GuiColorPicker_t)(Rectangle,const char*,Color*);
typedef int (*GuiSliderPro_t)(Rectangle,const char*,const char*,float*,float,float,int);
typedef int (*GuiDummyRec_t)(Rectangle,const char*);
typedef int (*GuiTextInputBox_t)(Rectangle,const char*,const char*,const char*,char*,int,bool*);
typedef int (*GuiToggleSlider_t)(Rectangle,const char*,int*);
typedef int (*GuiToggle_t)(Rectangle,const char*,bool*);
typedef void (*GuiSetFont_t)(Font);
typedef int (*GuiProgressBar_t)(Rectangle,const char*,const char*,float*,float,float);
typedef int (*GuiValueBox_t)(Rectangle,const char*,int*,int,int,bool);
typedef int (*GuiStatusBar_t)(Rectangle,const char*);
typedef int (*GuiScrollPanel_t)(Rectangle,const char*,Rectangle,Vector2*,Rectangle*);
typedef int (*GuiTabBar_t)(Rectangle,const char**,int,int*);
typedef int (*GuiDropdownBox_t)(Rectangle,const char*,int*,bool);
typedef int (*GuiPanel_t)(Rectangle,const char*);
typedef int (*GuiLabelButton_t)(Rectangle,const char*);
typedef int (*GuiMessageBox_t)(Rectangle,const char*,const char*,const char*);
typedef int (*GuiTextBox_t)(Rectangle,char*,int,bool);
typedef int (*GuiButton_t)(Rectangle,const char*);
typedef int (*GuiWindowBox_t)(Rectangle,const char*);
typedef int (*GuiLabel_t)(Rectangle,const char*);
typedef int (*GuiColorPickerHSV_t)(Rectangle,const char*,Vector3*);
typedef int (*GuiListViewEx_t)(Rectangle,const char**,int,int*,int*,int*);
typedef int (*GuiColorPanel_t)(Rectangle,const char*,Color*);
typedef int (*GuiSpinner_t)(Rectangle,const char*,int*,int,int,bool);

static GuiToggleGroup_t __v_claw_GuiToggleGroup;
static GuiComboBox_t __v_claw_GuiComboBox;
static GuiColorBarHue_t __v_claw_GuiColorBarHue;
static GuiColorPanelHSV_t __v_claw_GuiColorPanelHSV;
static GuiColorBarAlpha_t __v_claw_GuiColorBarAlpha;
static GuiListView_t __v_claw_GuiListView;
static cE3AE40FE40GuiGetFont_t __v_claw_cE3AE40FE40GuiGetFont;
static GuiGrid_t __v_claw_GuiGrid;
static GuiLine_t __v_claw_GuiLine;
static GuiCheckBox_t __v_claw_GuiCheckBox;
static GuiSliderBar_t __v_claw_GuiSliderBar;
static GuiSlider_t __v_claw_GuiSlider;
static GuiDrawIcon_t __v_claw_GuiDrawIcon;
static GuiGroupBox_t __v_claw_GuiGroupBox;
static GuiColorPicker_t __v_claw_GuiColorPicker;
static GuiSliderPro_t __v_claw_GuiSliderPro;
static GuiDummyRec_t __v_claw_GuiDummyRec;
static GuiTextInputBox_t __v_claw_GuiTextInputBox;
static GuiToggleSlider_t __v_claw_GuiToggleSlider;
static GuiToggle_t __v_claw_GuiToggle;
static GuiSetFont_t __v_claw_GuiSetFont;
static GuiProgressBar_t __v_claw_GuiProgressBar;
static GuiValueBox_t __v_claw_GuiValueBox;
static GuiStatusBar_t __v_claw_GuiStatusBar;
static GuiScrollPanel_t __v_claw_GuiScrollPanel;
static GuiTabBar_t __v_claw_GuiTabBar;
static GuiDropdownBox_t __v_claw_GuiDropdownBox;
static GuiPanel_t __v_claw_GuiPanel;
static GuiLabelButton_t __v_claw_GuiLabelButton;
static GuiMessageBox_t __v_claw_GuiMessageBox;
static GuiTextBox_t __v_claw_GuiTextBox;
static GuiButton_t __v_claw_GuiButton;
static GuiWindowBox_t __v_claw_GuiWindowBox;
static GuiLabel_t __v_claw_GuiLabel;
static GuiColorPickerHSV_t __v_claw_GuiColorPickerHSV;
static GuiListViewEx_t __v_claw_GuiListViewEx;
static GuiColorPanel_t __v_claw_GuiColorPanel;
static GuiSpinner_t __v_claw_GuiSpinner;

__CLAW_API int __claw_raygui_loader_0255091B6BBE970C1BAA99A3738B1F1D95028F82() {
  if(___claw_init_wrapper()) {

__v_claw_GuiToggleGroup = (GuiToggleGroup_t) claw_get_proc_addr("GuiToggleGroup");
__v_claw_GuiComboBox = (GuiComboBox_t) claw_get_proc_addr("GuiComboBox");
__v_claw_GuiColorBarHue = (GuiColorBarHue_t) claw_get_proc_addr("GuiColorBarHue");
__v_claw_GuiColorPanelHSV = (GuiColorPanelHSV_t) claw_get_proc_addr("GuiColorPanelHSV");
__v_claw_GuiColorBarAlpha = (GuiColorBarAlpha_t) claw_get_proc_addr("GuiColorBarAlpha");
__v_claw_GuiListView = (GuiListView_t) claw_get_proc_addr("GuiListView");
__v_claw_cE3AE40FE40GuiGetFont = (cE3AE40FE40GuiGetFont_t) claw_get_proc_addr("cE3AE40FE40GuiGetFont");
__v_claw_GuiGrid = (GuiGrid_t) claw_get_proc_addr("GuiGrid");
__v_claw_GuiLine = (GuiLine_t) claw_get_proc_addr("GuiLine");
__v_claw_GuiCheckBox = (GuiCheckBox_t) claw_get_proc_addr("GuiCheckBox");
__v_claw_GuiSliderBar = (GuiSliderBar_t) claw_get_proc_addr("GuiSliderBar");
__v_claw_GuiSlider = (GuiSlider_t) claw_get_proc_addr("GuiSlider");
__v_claw_GuiDrawIcon = (GuiDrawIcon_t) claw_get_proc_addr("GuiDrawIcon");
__v_claw_GuiGroupBox = (GuiGroupBox_t) claw_get_proc_addr("GuiGroupBox");
__v_claw_GuiColorPicker = (GuiColorPicker_t) claw_get_proc_addr("GuiColorPicker");
__v_claw_GuiSliderPro = (GuiSliderPro_t) claw_get_proc_addr("GuiSliderPro");
__v_claw_GuiDummyRec = (GuiDummyRec_t) claw_get_proc_addr("GuiDummyRec");
__v_claw_GuiTextInputBox = (GuiTextInputBox_t) claw_get_proc_addr("GuiTextInputBox");
__v_claw_GuiToggleSlider = (GuiToggleSlider_t) claw_get_proc_addr("GuiToggleSlider");
__v_claw_GuiToggle = (GuiToggle_t) claw_get_proc_addr("GuiToggle");
__v_claw_GuiSetFont = (GuiSetFont_t) claw_get_proc_addr("GuiSetFont");
__v_claw_GuiProgressBar = (GuiProgressBar_t) claw_get_proc_addr("GuiProgressBar");
__v_claw_GuiValueBox = (GuiValueBox_t) claw_get_proc_addr("GuiValueBox");
__v_claw_GuiStatusBar = (GuiStatusBar_t) claw_get_proc_addr("GuiStatusBar");
__v_claw_GuiScrollPanel = (GuiScrollPanel_t) claw_get_proc_addr("GuiScrollPanel");
__v_claw_GuiTabBar = (GuiTabBar_t) claw_get_proc_addr("GuiTabBar");
__v_claw_GuiDropdownBox = (GuiDropdownBox_t) claw_get_proc_addr("GuiDropdownBox");
__v_claw_GuiPanel = (GuiPanel_t) claw_get_proc_addr("GuiPanel");
__v_claw_GuiLabelButton = (GuiLabelButton_t) claw_get_proc_addr("GuiLabelButton");
__v_claw_GuiMessageBox = (GuiMessageBox_t) claw_get_proc_addr("GuiMessageBox");
__v_claw_GuiTextBox = (GuiTextBox_t) claw_get_proc_addr("GuiTextBox");
__v_claw_GuiButton = (GuiButton_t) claw_get_proc_addr("GuiButton");
__v_claw_GuiWindowBox = (GuiWindowBox_t) claw_get_proc_addr("GuiWindowBox");
__v_claw_GuiLabel = (GuiLabel_t) claw_get_proc_addr("GuiLabel");
__v_claw_GuiColorPickerHSV = (GuiColorPickerHSV_t) claw_get_proc_addr("GuiColorPickerHSV");
__v_claw_GuiListViewEx = (GuiListViewEx_t) claw_get_proc_addr("GuiListViewEx");
__v_claw_GuiColorPanel = (GuiColorPanel_t) claw_get_proc_addr("GuiColorPanel");
__v_claw_GuiSpinner = (GuiSpinner_t) claw_get_proc_addr("GuiSpinner");

    ___claw_close_wrapper();
    return 0;
  }
  return 1;
}


__CLAW_API int __claw_GuiToggleGroup(Rectangle* bounds, const char* text, int* active) {
// /usr/local/include/raygui.h:717:15
return GuiToggleGroup(*bounds, text, active);
}

__CLAW_API int __claw_GuiComboBox(Rectangle* bounds, const char* text, int* active) {
// /usr/local/include/raygui.h:720:15
return GuiComboBox(*bounds, text, active);
}

__CLAW_API int __claw_GuiColorBarHue(Rectangle* bounds, const char* text, float* value) {
// /usr/local/include/raygui.h:742:15
return GuiColorBarHue(*bounds, text, value);
}

__CLAW_API int __claw_GuiColorPanelHSV(Rectangle* bounds, const char* text, Vector3* colorHsv) {
// /usr/local/include/raygui.h:744:15
return GuiColorPanelHSV(*bounds, text, colorHsv);
}

__CLAW_API int __claw_GuiColorBarAlpha(Rectangle* bounds, const char* text, float* alpha) {
// /usr/local/include/raygui.h:741:15
return GuiColorBarAlpha(*bounds, text, alpha);
}

__CLAW_API int __claw_GuiListView(Rectangle* bounds, const char* text, int* scrollIndex, int* active) {
// /usr/local/include/raygui.h:735:15
return GuiListView(*bounds, text, scrollIndex, active);
}

__CLAW_API Font* __claw_cE3AE40FE40GuiGetFont(Font* __claw_result_) {
// /usr/local/include/raygui.h:677:16
(*__claw_result_) = GuiGetFont();
return __claw_result_;
}

__CLAW_API int __claw_GuiGrid(Rectangle* bounds, const char* text, float spacing, int subdivs, Vector2* mouseCell) {
// /usr/local/include/raygui.h:732:15
return GuiGrid(*bounds, text, spacing, subdivs, mouseCell);
}

__CLAW_API int __claw_GuiLine(Rectangle* bounds, const char* text) {
// /usr/local/include/raygui.h:707:15
return GuiLine(*bounds, text);
}

__CLAW_API int __claw_GuiCheckBox(Rectangle* bounds, const char* text, bool* checked) {
// /usr/local/include/raygui.h:719:15
return GuiCheckBox(*bounds, text, checked);
}

__CLAW_API int __claw_GuiSliderBar(Rectangle* bounds, const char* textLeft, const char* textRight, float* value, float minValue, float maxValue) {
// /usr/local/include/raygui.h:728:15
return GuiSliderBar(*bounds, textLeft, textRight, value, minValue, maxValue);
}

__CLAW_API int __claw_GuiSlider(Rectangle* bounds, const char* textLeft, const char* textRight, float* value, float minValue, float maxValue) {
// /usr/local/include/raygui.h:727:15
return GuiSlider(*bounds, textLeft, textRight, value, minValue, maxValue);
}

__CLAW_API void __claw_GuiDrawIcon(int iconId, int posX, int posY, int pixelSize, Color* color) {
// /usr/local/include/raygui.h:698:16
GuiDrawIcon(iconId, posX, posY, pixelSize, *color);
}

__CLAW_API int __claw_GuiGroupBox(Rectangle* bounds, const char* text) {
// /usr/local/include/raygui.h:706:15
return GuiGroupBox(*bounds, text);
}

__CLAW_API int __claw_GuiColorPicker(Rectangle* bounds, const char* text, Color* color) {
// /usr/local/include/raygui.h:739:15
return GuiColorPicker(*bounds, text, color);
}

__CLAW_API int __claw_GuiSliderPro(Rectangle* bounds, const char* textLeft, const char* textRight, float* value, float minValue, float maxValue, int sliderWidth) {
// /usr/local/include/raygui.h:2935:5
return GuiSliderPro(*bounds, textLeft, textRight, value, minValue, maxValue, sliderWidth);
}

__CLAW_API int __claw_GuiDummyRec(Rectangle* bounds, const char* text) {
// /usr/local/include/raygui.h:731:15
return GuiDummyRec(*bounds, text);
}

__CLAW_API int __claw_GuiTextInputBox(Rectangle* bounds, const char* title, const char* message, const char* buttons, char* text, int textMaxSize, bool* secretViewActive) {
// /usr/local/include/raygui.h:738:15
return GuiTextInputBox(*bounds, title, message, buttons, text, textMaxSize, secretViewActive);
}

__CLAW_API int __claw_GuiToggleSlider(Rectangle* bounds, const char* text, int* active) {
// /usr/local/include/raygui.h:718:15
return GuiToggleSlider(*bounds, text, active);
}

__CLAW_API int __claw_GuiToggle(Rectangle* bounds, const char* text, bool* active) {
// /usr/local/include/raygui.h:716:15
return GuiToggle(*bounds, text, active);
}

__CLAW_API void __claw_GuiSetFont(Font* font) {
// /usr/local/include/raygui.h:676:16
GuiSetFont(*font);
}

__CLAW_API int __claw_GuiProgressBar(Rectangle* bounds, const char* textLeft, const char* textRight, float* value, float minValue, float maxValue) {
// /usr/local/include/raygui.h:729:15
return GuiProgressBar(*bounds, textLeft, textRight, value, minValue, maxValue);
}

__CLAW_API int __claw_GuiValueBox(Rectangle* bounds, const char* text, int* value, int minValue, int maxValue, bool editMode) {
// /usr/local/include/raygui.h:724:15
return GuiValueBox(*bounds, text, value, minValue, maxValue, editMode);
}

__CLAW_API int __claw_GuiStatusBar(Rectangle* bounds, const char* text) {
// /usr/local/include/raygui.h:730:15
return GuiStatusBar(*bounds, text);
}

__CLAW_API int __claw_GuiScrollPanel(Rectangle* bounds, const char* text, Rectangle* content, Vector2* scroll, Rectangle* view) {
// /usr/local/include/raygui.h:710:15
return GuiScrollPanel(*bounds, text, *content, scroll, view);
}

__CLAW_API int __claw_GuiTabBar(Rectangle* bounds, const char** text, int count, int* active) {
// /usr/local/include/raygui.h:709:15
return GuiTabBar(*bounds, text, count, active);
}

__CLAW_API int __claw_GuiDropdownBox(Rectangle* bounds, const char* text, int* active, bool editMode) {
// /usr/local/include/raygui.h:722:15
return GuiDropdownBox(*bounds, text, active, editMode);
}

__CLAW_API int __claw_GuiPanel(Rectangle* bounds, const char* text) {
// /usr/local/include/raygui.h:708:15
return GuiPanel(*bounds, text);
}

__CLAW_API int __claw_GuiLabelButton(Rectangle* bounds, const char* text) {
// /usr/local/include/raygui.h:715:15
return GuiLabelButton(*bounds, text);
}

__CLAW_API int __claw_GuiMessageBox(Rectangle* bounds, const char* title, const char* message, const char* buttons) {
// /usr/local/include/raygui.h:737:15
return GuiMessageBox(*bounds, title, message, buttons);
}

__CLAW_API int __claw_GuiTextBox(Rectangle* bounds, char* text, int textSize, bool editMode) {
// /usr/local/include/raygui.h:725:15
return GuiTextBox(*bounds, text, textSize, editMode);
}

__CLAW_API int __claw_GuiButton(Rectangle* bounds, const char* text) {
// /usr/local/include/raygui.h:714:15
return GuiButton(*bounds, text);
}

__CLAW_API int __claw_GuiWindowBox(Rectangle* bounds, const char* title) {
// /usr/local/include/raygui.h:705:15
return GuiWindowBox(*bounds, title);
}

__CLAW_API int __claw_GuiLabel(Rectangle* bounds, const char* text) {
// /usr/local/include/raygui.h:713:15
return GuiLabel(*bounds, text);
}

__CLAW_API int __claw_GuiColorPickerHSV(Rectangle* bounds, const char* text, Vector3* colorHsv) {
// /usr/local/include/raygui.h:743:15
return GuiColorPickerHSV(*bounds, text, colorHsv);
}

__CLAW_API int __claw_GuiListViewEx(Rectangle* bounds, const char** text, int count, int* scrollIndex, int* active, int* focus) {
// /usr/local/include/raygui.h:736:15
return GuiListViewEx(*bounds, text, count, scrollIndex, active, focus);
}

__CLAW_API int __claw_GuiColorPanel(Rectangle* bounds, const char* text, Color* color) {
// /usr/local/include/raygui.h:740:15
return GuiColorPanel(*bounds, text, color);
}

__CLAW_API int __claw_GuiSpinner(Rectangle* bounds, const char* text, int* value, int minValue, int maxValue, bool editMode) {
// /usr/local/include/raygui.h:723:15
return GuiSpinner(*bounds, text, value, minValue, maxValue, editMode);
}

#if defined(__cplusplus)
}
#endif
