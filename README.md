# ZTE-channel-estimate-competition2019
ZTE-competition-code\omp
延时域信号有拓展     
在延时域，蓝色是根据250个点的导频数值 IFFT得到；红点是根据观测的25个导频数据 IFFT得到    
延时域只画了前25个点     
我现在用的还是omp(sp和omp性能相近)，单纯增加了稀疏度    
多径增益随着延迟呈现指数衰减？   
matlab filtfilt滤波很好用  时间上无平移
![image](https://github.com/All-World/ZTE-channel-estimate-competition2019/tree/master/image/one.jpg)     
![image](https://github.com/All-World/ZTE-channel-estimate-competition2019/tree/master/image/two.jpg)       
![image](https://github.com/All-World/ZTE-channel-estimate-competition2019/tree/master/image/three.jpg)    
