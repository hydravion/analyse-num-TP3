function px = barycentre(nodes,data,x)
   
   wi=weight(nodes);
   n=length(nodes);
   p=[];
   %sum=zeros(1,n);
 for j = [1:n] 
   l=polyval(poly(nodes),x(j));
   sum=0;
   for i=[1:n]
      %sum[j]=sum[j]+data[i]*weight[i]/(x[j]-nodes[i]); 
      sum=sum+data(i)*wi(i)/(x(j)-nodes(i));
   end
  % px[j]=l*sum[j];
  p=[p l*sum];
 end
   px=p;
   
end

