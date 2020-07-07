# Cray_Lib

## Contributor:

* MoskalykA (Creator)
  * [GitHub](https://github.com/MoskalykA)
  * [Github Website](https://moskalyka.github.io/)
  * [Website](https://cray-dev.com/)

## Example:

### Screen:

![Notification](https://file.cray-dev.com/cray_lib_notification_v2.png)
![DFrame](https://file.cray-dev.com/cray_lib_dframe_v1.png)
![DPanel](https://file.cray-dev.com/cray_lib_dpanel_v1.png)
![DButton](https://file.cray-dev.com/cray_lib_dbutton_v1.png)
![Font](https://file.cray-dev.com/cray_lib_font_v1.png)

### Commands:

* Test commands:
 * - cray_lib_notifiation_test -> Display the 4 types of notification
 * - cray_lib_notifiation_1_test -> Displaying the 1st notification
 * - cray_lib_notifiation_2_test -> Displaying the 2nd notification
 * - cray_lib_notifiation_3_test -> Displaying the 3rd notification
 * - cray_lib_notifiation_4_test -> Displaying the 4th notification
 * - cray_lib_format_time_test -> Display an example of time formatting
 * - cray_lib_spawnmenu -> Displaying an example of a spawnmenu 
 * - cray_lib_vgui_test -> Displaying a vgui test
 * - cray_lib_vgui_test2 -> Displaying a vgui test
 * - cray_lib_vgui_test3 -> Displaying a vgui test
 * - cray_lib_font_test -> Displaying a font test

* Other commands:
  * - cray_lib_reload -> Reload lib

## Documentation:

**Shared**
```lua
Cray_Lib.Functions.FormatTime(number time) // -> Format of seconds in time
```
**Serverside**

**Clientside**
```lua
Cray_Lib.Functions.Circle(number x, number y, number Radius, String texture, Color color) // -> Draw a circle
```
```lua
Cray_Lib.Functions.NumberCommas(number n) // -> Put commas in the number
```
```lua
Cray_Lib.Functions.AddNotification(string txt, number type, number len) // -> Display the notification
```