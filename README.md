# Cray_Lib

## Contributor:

* MoskalykA (Creator)
  * [GitHub](https://github.com/MoskalykA)
  * [Github Website](https://moskalyka.github.io/)
  * [Website](https://cray-dev.fr/)
  * [![Discord Bots](https://top.gg/api/widget/617138885125996574.svg)](https://top.gg/bot/617138885125996574)

## Example:

### Screen:

![Notification](https://file.cray-dev.fr/cray_lib_notification_v1.png)

### Commands:

* Test commands:
 * - cray_lib_notifiation_test -> Display the 3 types of notification
 * - cray_lib_format_time_test -> Display an example of time formatting

## Documentation:

**Shared**
```lua
Cray_Lib.Version() // -> Check the version
```
```lua
Cray_Lib.GetVersion() // -> Returns the version
```
```lua
Cray_Lib.FormatTime(number time) // -> Format of seconds in time
```
**Serverside**

**Clientside**
```lua
Cray_Lib.Circle(number x, number y, number Radius, String texture, Color color) // -> Draw a circle
```
```lua
Cray_Lib.NumberCommas(number n) // -> Put commas in the number
```
```lua
Cray_Lib.AddNotification(string txt, number type, number len) // -> Display the notification
```
