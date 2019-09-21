## FPGA_Design - Lab00 HW #
---
### 成員名單 #
E24056645、
E24053061、
E24056849
### FSM Diagram #
![FSM](https://github.com/FPGAgroup5/test/blob/master/Lab00%20images/FPGA_HW0_FSM.jpg)
### 設計概念說明 #
　　先將整個圖形平移使Vertex 1(左下角的點)平移至原點，再利用截距式找出平移後斜邊的直線方程式，接著從原點(0,0)開始由左而右逐點判斷是否超出邊界。若超出邊界，則再繼續從(0,1)由左而右逐點判斷是否超出邊界，若超出邊界，則再繼續從(0,2)...，不斷重複，直到Y軸上一點(0,y)亦超出邊界。

　　在上述過程中，所有點在輸出之前，會平移回原圖形(圖形平移前)所對應的點。

　　此設計方式的三角形邊界只須注意斜邊即可，判斷是否超出邊界的方法如下:

　　邊界的直線方程式 ax + by=c。將判斷點(x0,y0)帶入，若 a\*x0 + b\*y0 > c，則表示此點超出邊界，反之則無超出邊界。

先將圖形平移則是為了能夠簡單快速地找出三角形斜邊的直線方程式
### 模擬結果圖
![result](https://github.com/FPGAgroup5/test/blob/master/Lab00%20images/result.jpg)
### 模擬波型圖
cycle1
![wave1](https://github.com/FPGAgroup5/test/blob/master/Lab00%20images/wave%201.jpg)
cycle2
![wave2](https://github.com/FPGAgroup5/test/blob/master/Lab00%20images/wave%202.jpg)
