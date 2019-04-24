DATA111;%导入所有信道信息   250*7 一共七组信道值  第6列和第7列加上噪声   前五列是随机地


H_orign=H0(:,5);

h=zeros(250,1);%估计值
Phi=dftmtx(250);%稀疏矩阵
h_orign=(1./Phi)*H_orign;
h_real=(1./Phi)*H0(:,5);
%生成测量矩阵
L=1:10:250;
N=length(L);%导频开销
LL=sort(L);
LLL=LL'-125;
P=zeros(N,250);
for i=1:N
    P(i,LL(i))=1;
end

y=P*H_orign;%观测结果
A=P*Phi;%传感矩阵
B=A(:,1:25);
hhh=inv(B'*B)*B'*y;
hhh2=(1./dftmtx(N))*y;
%%
%稀疏度已知算法
% knownS;
h(1:25)=CS_SP_v1(y,B,5);
%  h(1:25)=DAMP(y,30,25,1,'BM3D',B);%尝试失败
He=Phi*h;
NMSE=10*log10(sum(abs(He-H0(:,5)).^2)/sum(abs(H0(:,5)).^2));
E=(sum(abs(He-H0(:,7)).^2)/sum(abs(H0(:,7)).^2))+N/250;
fprintf('NMSE=%.2f~dB,~ E=%d',NMSE,E);
%稀疏度自适应算法
% UNknownS;
%%
%画图
figure;
plot(abs(H0(:,5)));
hold on;plot(abs(He));
legend('原始值','有噪观测的估计值');
grid on;
figure;
plot(abs(h_real)/250,'bo');
hold on;plot(1:250,abs(h_orign)/250,'k*');
hold on;plot(abs(h),'r>');grid on;
hold on;plot(abs(hhh),'gx');
hold on;plot(abs(hhh2)/N,'rs');
legend('真实信道','原始加噪信道','有噪观测的估计值','LS','ifft对观测做');
