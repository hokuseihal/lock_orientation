# lock_orientation

# What does this library do?

This library locks device's orientation (like PortraitUp,LandscapeLeft,LandscapeRight) and give you current orientation.


# Usage

Use lockOrientation() and unlockOrientation() whenever you want.
You can also get current orientation with getOrientation().

# Example

```dart
Center(
  child: Column(mainAxisSize: MainAxisSize.min,
    children: [
      ElevatedButton(onPressed: (){
        getOrientation().then((ori) {
          setState(() {
            _orientation=ori.toString();
          });
        });
      },child: Text(_orientation),),
      Switch(value: islock, onChanged: (v){
        if(islock) {
          unlockOrientation();
        }else{
          lockOrientation();
        }
        setState(() {
          islock=v;
        });
      })
    ],
  ),
),
```
