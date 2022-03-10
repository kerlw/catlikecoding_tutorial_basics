Learning basics tutorial from catlike coding blog:

[https://catlikecoding.com/unity/tutorials/basics/](https://catlikecoding.com/unity/tutorials/basics/)

## 1. Game Objects and Scripts ##
1. switch color space from default gamma to linear. 
> Nowadays rendering is usually done in linear color space, but Unity still configured to use gamma color space by default. For best visual results select the Player category of the project settings window, open the Other Settings panel, and scroll down to its Rendering section. Make sure that Color Space is set to Linear. 
2. difference between localRotation and rotation
> The localRotation property represents the rotation described by the Transform component in isolation, thus it is a rotation relative to its parent. It's the rotation that you see in its inspector. In contrast, the rotation property represents the final rotation in world space, taking the entire object hierarchy into account. 

Clock is implemented, but the animation of seconds arm is not smoothly, need to be optimized.

## 2. Building a Graph ##
 Switch default render to URP:
 1. install URP from `package manager`
 2. create an asset fro URP
 3. assign the URP asset to the `Scriptable Render Settings` field in `Project Setting`.
 
 > Switch back: just set `Scriptable Render Settings` to None
 
 > The render pipeline cannot be changed in a built stand-alone app.
 
 > HDRP is a much more complex render pipeline. It won't be covered in catlikecoding's tutorials.
 
## 3. Mathematical Surfaces ##
Interesting mathematics to graph.

**Delegates**
> It is possible to get a reference to a method by using a delegate. A delegate is a special type that defines what kind of method something can reference.

## 4. Measuring Performance ##

## 5. Compute Shaders ##

## 6. Jobs ## 

## 7. Organic Variety ##

