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

**Compute Threads** 
```
GPU hardware contains compute units that always run a specific fixed 
amount of threads in lockstep. These are known as warps or wavefronts. 
If the amount of threads of a group is less than the warp size some 
threads will run idle, wasting time. If the amount of threads instead 
exceeds the size then the GPU will use more warps per group. In general 
64 threads is a good default, as that matches the warp size of AMD GPUs 
while it's 32 for NVidia GPUs, so the latter will use two warps per 
group. In reality the hardware is more complex and can do more with 
thread groups, but this isn't relevant for our simple graph.

The three arguments of numthreads can be used to organize the threads 
in one, two, or three dimensions. For example, (64, 1, 1) gives us 64 
threads in a single dimension while (8, 8, 1) gives us the same amount 
but presented as a 2D 8×8 square grid. As we define our points based on 
2D UV coordinates let's use the latter option.
```

When finish coding as `2.1 Drawing Many Meshes`, I got system crash after I entering play mode.
Because I used URP.

It's so boring to write shader and hlsl files, especially include hlsl file.

## 6. Jobs ##

>  `OnValidate` method that simply invokes OnDisable and OnEnable after each other, resetting the fractal. The OnValidate method gets invoked after a change has been made to the component via the inspector or an undo/redo action.

> `Shouldn't we avoid sending data to the GPU?` As much as possible, yes. But we have no choice in this case, we have to send the matrices to the GPU somehow and this is the most efficient way to do it. 

> `Why is the interface named IJobFor?` The convention is to prefix all interface types with an I which stands for interface, so the interface is named JobFor with an I prefix. It's a job interface, specifically one that is used for functionality that runs inside for loops.

Keywords: Burst IJobFor Schedule BurstCompile

In my project, `Fractal.cs` is using original creation and `Fractal2.cs` is using C# jobs.

## 7. Organic Variety ##

