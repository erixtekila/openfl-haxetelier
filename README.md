openfl-haxetelier
=================

All the demos files of the first openfl haxetelier : http://www.silexlabs.org/143492/the-blog/haxetelier-3-coup-de-flash-sur-openfl-le-workflow-tout-en-un/

All these demos use only cross platform code, there is no conditional compilation, etc.

They may drive you step by step to learn how to use the AS3 API.
While written in haxe and build with openfl, you can target flash, html5, mac, windows, linux, ios, android, blackberry, webos as you might remember the good ol' flash days !

These are intellij modules that use their haxe plugin.
Be sure to install openfl and its dependencies.
Add also actuate like so : 

```haxe
haxelib install actuate
```

Once all is ready, export each project from the commandline or your favorite IDE.
Change the value "ProjectName" with yours.

```haxe
openfl test "ProjectName" html5
```

Send feedback !