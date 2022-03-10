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

1.  If we use URP instead the statistics are different. It renders faster (than BRP)....Although Saved by batching reports no batching, URP uses the SRP batcher by default, but the statistics panel doesn't understand it. The SRP batcher doesn't eliminate individual draw commands but can make them much more efficient. To illustrate this select our URP asset and disable SRP Batcher under the Advanced section at the bottom of its inspector. Make sure that Dynamic Batching is disabled as well.

> With the SRP batcher disabled URP performance is much worse.

> BRP supports shadows for point lights, but URP still doesn't.

2. Dynamic batching is much more efficient for BRP, eliminating 29.964 batches, reducing them to only 39, but it doesn't appear to help much.
3. Another way to improve rendering performance is by enabling GPU instancing. This makes it possible to use a single draw command to tell the GPU to draw many instances of one mesh with the same material, providing an array of transformation matrices and optionally other instance data. In this case we have to enable it per material. Ours have an Enable GPU Instancing toggle for it.

## 5. Compute Shaders ##

## 6. Jobs ## 

## 7. Organic Variety ##

