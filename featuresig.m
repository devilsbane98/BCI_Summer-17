function feat=featuresig(sig)
    t=(0:length(sig(:,1))-1)/128;
        for j=1:14
           feat(j)=trapz(t,abs(sig(:,j)));%integral
        end
           clear l;
        for j=15:28
           feat(j)=mean(abs(sig(:,j-14)));%mean
        end
        
        for j=29:42
          feat(j)=rms(sig(:,j-28));%rms
        end
        for j=43:56
           feat(j)=var(sig(:,j-42));%variance
        end
       for j=57:70
          feat(j)=trapz(t,(abs(sig(:,j-56)).^2));%square integral
        end
        for j=71:84
           feat(j)=sum(diff(sign(diff(sig(:,j-70))))~=0);%slope sign change
       end
        for j=85:98
         feat(j)=meanfreq(sig(:,j-84),128);%mean frequency
      end
        for j=99:112
           feat(j)=medfreq(sig(:,j-98),128);%median frequency
        end
        temp=getarfeat(sig,6);
        for j=113:196
           feat(j)=temp(j-112);%autoregression
        end
        for j=197:210
           feat(j)=getwlfeat(sig(:,j-196));%waveform length
        end
	 for j=211:224
	feat(j) = bandpower(sig(:,j-210));   %bandpower
     end
          
    %feat=cell2table(feat);
end