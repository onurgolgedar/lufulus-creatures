{
  "resourceType": "GMExtension",
  "resourceVersion": "1.2",
  "name": "window_set_cursor",
  "androidactivityinject": "",
  "androidclassname": "",
  "androidcodeinjection": "",
  "androidinject": "",
  "androidmanifestinject": "",
  "androidPermissions": [],
  "androidProps": true,
  "androidsourcedir": "",
  "author": "",
  "classname": "",
  "copyToTargets": 144713361056071918,
  "date": "2019-12-10T03:02:53",
  "description": "",
  "exportToGame": true,
  "extensionVersion": "1.0.0",
  "files": [
    {"resourceType":"GMExtensionFile","resourceVersion":"1.0","name":"","constants":[],"copyToTargets":105553658380352,"filename":"window_set_cursor.dll","final":"window_set_cursor_cleanup","functions":[
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_set_cursor_normal_raw","argCount":0,"args":[],"documentation":"","externalName":"window_set_cursor_normal_raw","help":"","hidden":true,"kind":11,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_set_cursor_cleanup","argCount":0,"args":[],"documentation":"","externalName":"window_set_cursor_cleanup","help":"","hidden":true,"kind":11,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_set_cursor_init_dll_raw","argCount":2,"args":[
            1,
            2,
          ],"documentation":"","externalName":"window_set_cursor_init_dll_raw","help":"","hidden":true,"kind":11,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_set_cursor_surface_raw","argCount":2,"args":[
            1,
            1,
          ],"documentation":"","externalName":"window_set_cursor_surface_raw","help":"","hidden":true,"kind":11,"returnType":2,},
      ],"init":"","kind":1,"order":[
        {"name":"window_set_cursor_normal_raw","path":"extensions/window_set_cursor/window_set_cursor.yy",},
        {"name":"window_set_cursor_cleanup","path":"extensions/window_set_cursor/window_set_cursor.yy",},
        {"name":"window_set_cursor_init_dll_raw","path":"extensions/window_set_cursor/window_set_cursor.yy",},
        {"name":"window_set_cursor_surface_raw","path":"extensions/window_set_cursor/window_set_cursor.yy",},
      ],"origname":"extensions\\window_set_cursor.dll","ProxyFiles":[],"uncompress":false,"usesRunnerInterface":false,},
    {"resourceType":"GMExtensionFile","resourceVersion":"1.0","name":"","constants":[],"copyToTargets":113497714299118,"filename":"window_set_cursor.gml","final":"","functions":[
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_set_cursor_init","argCount":0,"args":[],"documentation":"","externalName":"window_set_cursor_init","help":"","hidden":true,"kind":11,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_set_cursor_normal","argCount":0,"args":[],"documentation":"","externalName":"window_set_cursor_normal","help":"window_set_cursor_normal(): Reverts the cursor to whatever set via built-in window_set_cursor.","hidden":false,"kind":2,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_set_cursor_surface_part","argCount":7,"args":[
            2,
            2,
            2,
            2,
            2,
            2,
            2,
          ],"documentation":"","externalName":"window_set_cursor_surface_part","help":"window_set_cursor_surface_part(surface, left, top, width, height, x, y):","hidden":false,"kind":2,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_set_cursor_surface","argCount":3,"args":[
            2,
            2,
            2,
          ],"documentation":"","externalName":"window_set_cursor_surface","help":"window_set_cursor_surface(surface, x, y):","hidden":false,"kind":2,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_set_cursor_sprite","argCount":2,"args":[
            2,
            2,
          ],"documentation":"","externalName":"window_set_cursor_sprite","help":"window_set_cursor_sprite(sprite, subimg):","hidden":false,"kind":2,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_set_cursor_sprite_ext","argCount":6,"args":[
            2,
            2,
            2,
            2,
            2,
            2,
          ],"documentation":"","externalName":"window_set_cursor_sprite_ext","help":"window_set_cursor_sprite_ext(sprite, subimg, image_xscale, image_yscale, image_blend, image_alpha):","hidden":false,"kind":2,"returnType":2,},
      ],"init":"window_set_cursor_init","kind":2,"order":[
        {"name":"window_set_cursor_init","path":"extensions/window_set_cursor/window_set_cursor.yy",},
        {"name":"window_set_cursor_normal","path":"extensions/window_set_cursor/window_set_cursor.yy",},
        {"name":"window_set_cursor_surface_part","path":"extensions/window_set_cursor/window_set_cursor.yy",},
        {"name":"window_set_cursor_surface","path":"extensions/window_set_cursor/window_set_cursor.yy",},
        {"name":"window_set_cursor_sprite","path":"extensions/window_set_cursor/window_set_cursor.yy",},
        {"name":"window_set_cursor_sprite_ext","path":"extensions/window_set_cursor/window_set_cursor.yy",},
      ],"origname":"extensions\\gml.gml","ProxyFiles":[],"uncompress":false,"usesRunnerInterface":false,},
    {"resourceType":"GMExtensionFile","resourceVersion":"1.0","name":"","constants":[],"copyToTargets":35184372088896,"filename":"window_set_cursor_dll.gml","final":"","functions":[
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_set_cursor_init_dll","argCount":0,"args":[],"documentation":"","externalName":"window_set_cursor_init_dll","help":"","hidden":true,"kind":11,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_set_cursor_impl_1","argCount":6,"args":[],"documentation":"","externalName":"window_set_cursor_impl_1","help":"","hidden":true,"kind":11,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_set_cursor_impl","argCount":9,"args":[],"documentation":"","externalName":"window_set_cursor_impl","help":"","hidden":true,"kind":11,"returnType":2,},
      ],"init":"window_set_cursor_init_dll","kind":2,"order":[
        {"name":"window_set_cursor_init_dll","path":"extensions/window_set_cursor/window_set_cursor.yy",},
        {"name":"window_set_cursor_impl_1","path":"extensions/window_set_cursor/window_set_cursor.yy",},
        {"name":"window_set_cursor_impl","path":"extensions/window_set_cursor/window_set_cursor.yy",},
      ],"origname":"extensions\\gml.gml","ProxyFiles":[],"uncompress":false,"usesRunnerInterface":false,},
    {"resourceType":"GMExtensionFile","resourceVersion":"1.0","name":"","constants":[],"copyToTargets":32800,"filename":"window_set_cursor.js","final":"","functions":[
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_set_cursor_impl_1","argCount":6,"args":[
            2,
            2,
            2,
            2,
            2,
            2,
          ],"documentation":"","externalName":"window_set_cursor_impl_1","help":"window_set_cursor_impl_1(src,ctx,l,t,w,h)","hidden":false,"kind":5,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_set_cursor_impl","argCount":9,"args":[
            2,
            2,
            2,
            2,
            2,
            2,
            2,
            2,
            2,
          ],"documentation":"","externalName":"window_set_cursor_impl","help":"window_set_cursor_impl(hwnd,d,dw,l,t,w,h,cx,cy)","hidden":false,"kind":5,"returnType":2,},
      ],"init":"","kind":5,"order":[
        {"name":"window_set_cursor_impl_1","path":"extensions/window_set_cursor/window_set_cursor.yy",},
        {"name":"window_set_cursor_impl","path":"extensions/window_set_cursor/window_set_cursor.yy",},
      ],"origname":"extensions\\js.js","ProxyFiles":[],"uncompress":false,"usesRunnerInterface":false,},
    {"resourceType":"GMExtensionFile","resourceVersion":"1.0","name":"","constants":[],"copyToTargets":144678176683982990,"filename":"window_set_cursor_else.gml","final":"","functions":[
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_set_cursor_init_raw","argCount":0,"args":[],"documentation":"","externalName":"window_set_cursor_init_raw","help":"","hidden":true,"kind":11,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_set_cursor_normal_raw","argCount":0,"args":[],"documentation":"","externalName":"window_set_cursor_normal_raw","help":"","hidden":true,"kind":11,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_set_cursor_impl","argCount":-1,"args":[],"documentation":"","externalName":"window_set_cursor_impl","help":"window_set_cursor_impl(...)","hidden":false,"kind":2,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"window_set_cursor_impl_1","argCount":-1,"args":[],"documentation":"","externalName":"window_set_cursor_impl_1","help":"window_set_cursor_impl_1(...)","hidden":false,"kind":2,"returnType":2,},
      ],"init":"","kind":2,"order":[
        {"name":"window_set_cursor_init_raw","path":"extensions/window_set_cursor/window_set_cursor.yy",},
        {"name":"window_set_cursor_normal_raw","path":"extensions/window_set_cursor/window_set_cursor.yy",},
        {"name":"window_set_cursor_impl","path":"extensions/window_set_cursor/window_set_cursor.yy",},
        {"name":"window_set_cursor_impl_1","path":"extensions/window_set_cursor/window_set_cursor.yy",},
      ],"origname":"extensions\\gml.gml","ProxyFiles":[],"uncompress":false,"usesRunnerInterface":false,},
  ],
  "gradleinject": "",
  "hasConvertedCodeInjection": true,
  "helpfile": "",
  "HTML5CodeInjection": "",
  "html5Props": false,
  "IncludedResources": [],
  "installdir": "",
  "iosCocoaPodDependencies": "",
  "iosCocoaPods": "",
  "ioscodeinjection": "",
  "iosdelegatename": "",
  "iosplistinject": "",
  "iosProps": true,
  "iosSystemFrameworkEntries": [],
  "iosThirdPartyFrameworkEntries": [],
  "license": "Proprietary",
  "maccompilerflags": "",
  "maclinkerflags": "",
  "macsourcedir": "",
  "options": [],
  "optionsFile": "options.json",
  "packageId": "",
  "parent": {
    "name": "Extensions",
    "path": "folders/Extensions.yy",
  },
  "productId": "",
  "sourcedir": "",
  "supportedTargets": 113497714299118,
  "tvosclassname": "",
  "tvosCocoaPodDependencies": "",
  "tvosCocoaPods": "",
  "tvoscodeinjection": "",
  "tvosdelegatename": "",
  "tvosmaccompilerflags": "",
  "tvosmaclinkerflags": "",
  "tvosplistinject": "",
  "tvosProps": false,
  "tvosSystemFrameworkEntries": [],
  "tvosThirdPartyFrameworkEntries": [],
}