# Home Assistant Excalidraw Add-On

![logo excalidraw][addon_logo]

## About

This repository has two Home Assistant add-ons that work together to provide a local instance of excalidraw:
* The main addon runs the latest release of excalidraw. For more information about excalidraw see their github repository (https://github.com/excalidraw/excalidraw).
* The companion addong runs an instance of "excalidraw-room" to provide a persistent storage backend.

The main addon build applies two patches to the excalidraw code adapted from https://gitlab.com/kiliandeca/excalidraw-fork
* Enable runtime configuration of the excalidraw websocket URL.
* Enable collaboration when running in an iframe

## Screenshots
![Screenshot][screenshot_01]


### Installation
1. Add the repository to Home Assistant supervisor: Supervisor -> Add-on Store -> "Three dots on the right" -> Repositories
2. Add https://github.com/iamer/addon-excalidraw as additional add-on repository
3. Install the Excalidraw Addon from the Add-on Store (this could take a while, check the Supervisor logs)


### Contribution
Feel free to fork and improve,... 

[Additional developer notes ](https://github.com/iamer/addon-excalidraw/blob/master/addon_dev.md)

### Credits
All credits go to the Homeassistant and Excalidraw team and community!
The original author of this addon https://github.com/lein1013

[screenshot_01]: https://github.com/iamer/addon-excalidraw/raw/master/docs/screenshot_01.png
