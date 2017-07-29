tdata = linspace(100,1000,10);
cdata = 1e-05.*[454 499 535 565 590 610 626 639 650 659];
x0 = [0.2,0.05,0.05];
opts = optimset( 'lsqcurvefit' ); 
opts = optimset( opts, 'PrecondBandWidth', 0 ) 
x=lsqcurvefit ('curvefun',x0,tdata,cdata,[],[],opts)
f= curvefun(x,tdata)
plot(tdata,cdata,'o',tdata,f,'r-')  
xlabel('时间(秒)')
ylabel('浓度（毫克/立方厘米）')
