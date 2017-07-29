function [x,y,Ex,En,He] = cloud_transform(y_spor,n)
 % x 表示云滴
 % y 表示隶属度（这里是“钟形”隶属度），意义是度量倾向的稳定程度
 % Ex 云模型的数字特征，表示期望
 % En 云模型的数字特征，表示熵
 % He 云模型的数字特征，表示超熵
 
 % 通过统计数据样本计算云模型的数字特征
 Ex = mean(y_spor);
 En = mean(abs(y_spor-Ex)).*sqrt(pi./2);
 He = sqrt(var(y_spor)-En.^2);

 % 通过云模型的数字特征还原更多的“云滴”
 for q = 1:n
     Enn = randn(1).*He + En ;
     x(q) = randn(1).*Enn + Ex ;
     y(q) = exp(-(x(q) - Ex).^2./(2 .* Enn.^2));
 end
 x;
 y;
